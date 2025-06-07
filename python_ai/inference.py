import sysv_ipc
import signal
import sys
import time
import numpy as np
from gammatone import gtgram
from tensorflow.keras.models import load_model
import tensorflow as tf
try:
    from tensorflow.python.compiler.tensorrt import trt_convert as trt
except Exception:
    trt = None
import os
import wave

from config.config_manager import ConfigManager

config_manager = ConfigManager()

# Định nghĩa khóa và kích thước shared memory (chỉ dùng cho Real-time)
SHM_KEY = 0x1234
SEM_KEY = 0x5678
SHM_SIZE = 176400  # 2 giây dữ liệu = 176400 bytes = 88200 mẫu int16

EXCEED_LIMIT = 1


def gtgram_tf(audio_array, sr, window_time, hop_time, channels, f_min):
    """GPU-accelerated gammatone spectrogram using TensorFlow ops."""
    window_size = int(sr * window_time)
    hop_size = int(sr * hop_time)
    audio = tf.convert_to_tensor(audio_array, dtype=tf.float32)
    stft = tf.signal.stft(
        audio,
        frame_length=window_size,
        frame_step=hop_size,
        window_fn=tf.signal.hann_window,
        pad_end=True,
    )
    magnitude = tf.abs(stft)
    spec_bins = tf.shape(magnitude)[-1]
    weights = tf.signal.linear_to_mel_weight_matrix(
        num_mel_bins=channels,
        num_spectrogram_bins=spec_bins,
        sample_rate=sr,
        lower_edge_hertz=f_min,
        upper_edge_hertz=sr / 2,
        dtype=magnitude.dtype,
    )
    gammatone_spec = tf.matmul(tf.square(magnitude), weights)
    return tf.transpose(gammatone_spec)

# Lấy tham số cấu hình từ config
frame_rate = config_manager.get("PREPROCESS.FRAME_RATE")
window_time = config_manager.get("PREPROCESS.GAMMA.WINDOW_TIME")
hop_time = config_manager.get("PREPROCESS.GAMMA.HOP_TIME")
channels = config_manager.get("PREPROCESS.GAMMA.CHANNELS")
f_min = config_manager.get("PREPROCESS.GAMMA.F_MIN")
model_path = config_manager.get("REALTIME.MODEL_PATH") + "/saved_model/vq_vae"
manual_threshold = config_manager.get("REALTIME.MANUAL_THRESHOLD")
threshold = config_manager.get("REALTIME.THRESHOLD")
MIN = config_manager.get("REALTIME.MIN")
MAX = config_manager.get("REALTIME.MAX")
use_tf_gamma = config_manager.get("PREPROCESS.USE_TF_GTGRAM")

# print(f"model_path: {model_path}")
# print(f"frame_rate: {frame_rate}, window_time: {window_time}, hop_time: {hop_time}, channels: {channels}, f_min: {f_min}")
# print(f"manual_threshold: {manual_threshold}, threshold: {threshold}, MIN: {MIN}, MAX: {MAX}")

# Load model
use_trt = config_manager.get("DEVICE.USE_TENSORRT")
trt_model_path = config_manager.get("REALTIME.TRT_MODEL_PATH")

run_model = None

def _setup_model():
    global run_model
    if use_trt and trt is not None:
        try:
            if trt_model_path and os.path.exists(trt_model_path):
                model = tf.saved_model.load(trt_model_path)
                infer = model.signatures['serving_default']
            else:
                converter = trt.TrtGraphConverterV2(input_saved_model_dir=model_path)
                converter.convert()
                if trt_model_path:
                    converter.save(trt_model_path)
                    model = tf.saved_model.load(trt_model_path)
                else:
                    model = converter.convert()
                infer = model.signatures['serving_default'] if hasattr(model, 'signatures') else model

            def run_trt(a):
                result = infer(tf.convert_to_tensor(a))
                return list(result.values())[0].numpy() if isinstance(result, dict) else result.numpy()

            run_model = run_trt
            return
        except Exception as e:
            print(f"TensorRT conversion failed: {e}. Falling back to TensorFlow model.")

    model = load_model(model_path)
    run_model = lambda a: model.predict(a, verbose=0)

_setup_model()
# model.summary()

shm = None
semaphore = None

def cleanup():
    """Dọn dẹp shared memory và semaphore khi thoát."""
    global shm, semaphore
    if shm:
        try:
            shm.detach()
            print("Shared memory detached.")
        except Exception as e:
            print(f"Failed to detach shared memory: {e}")

def signal_handler(signum, frame):
    """Xử lý tín hiệu (SIGINT, SIGTERM)."""
    print(f"Signal {signum} received. Exiting...")
    cleanup()
    sys.exit(0)

def wait_for_shared_memory():
    """Chờ shared memory và semaphore có sẵn (chỉ dùng cho real-time)."""
    global shm, semaphore
    while True:
        try:
            shm = sysv_ipc.SharedMemory(SHM_KEY)
            print("Shared memory connected.")
            break
        except sysv_ipc.ExistentialError:
            print("Shared memory không tồn tại. Đang chờ...")
            time.sleep(1)

    while True:
        try:
            semaphore = sysv_ipc.Semaphore(SEM_KEY)
            print("Semaphore connected.")
            break
        except sysv_ipc.ExistentialError:
            print("Semaphore không tồn tại. Đang chờ...")
            time.sleep(1)

def predict_mse(audio_array):
    """Dự đoán MSE từ audio array."""
    if use_tf_gamma and tf is not None:
        gtg = gtgram_tf(audio_array, frame_rate, window_time, hop_time, channels, f_min).numpy()
    else:
        gtg = gtgram.gtgram(audio_array, frame_rate, window_time, hop_time, channels, f_min)
    a = np.flipud(20 * np.log10(gtg + 1e-10))  # Tránh log(0)
    a = np.clip((a-MIN)/(MAX-MIN), a_min=0, a_max=1)
    # print(f"Spectrogram shape: {a.shape}")
    a = np.reshape(a, (1 ,a.shape[0], a.shape[1], 1))
    # print(f"Reshaped Spectrogram shape: {a.shape}")

    if a.shape != (1, 32, 32, 1):
        print(f"Input shape không hợp lệ: {a.shape}")
        return None

    pred = run_model(a)
    return np.mean((a - pred) ** 2)

def process_realtime():
    """Xử lý Real-time: Đọc shared memory và inference mỗi 2 giây."""
    cycle_duration = 2.0  # Đảm bảo đúng chu kỳ 2 giây
    last_read_time = time.time()

    while True:
        cycle_start = time.time()

        # Đợi đúng chu kỳ 2 giây kể từ lần đọc trước
        if cycle_start - last_read_time < cycle_duration:
            time.sleep(cycle_duration - (cycle_start - last_read_time))
            continue

        last_read_time = cycle_start  # Cập nhật thời điểm đọc mới nhất

        try:
            semaphore.acquire()
            raw_data = bytearray(shm.read(SHM_SIZE))
            semaphore.release()
        except sysv_ipc.BusyError:
            print("Semaphore is busy. Skipping this cycle.")
            continue

        if len(raw_data) != SHM_SIZE:
            print(f"⚠️ Warning: Expected {SHM_SIZE} bytes but got {len(raw_data)} bytes!")
            continue

        audio_array = np.frombuffer(raw_data, dtype=np.int16)
        # print(f"Real-time - Mean: {np.mean(audio_array)}, Std: {np.std(audio_array)}")
        # print(f"First 5 samples: {audio_array[:5]}")

        # print(f"Sample Rate: {sr}")
        # print(f"Audio Data Shape: {audio_array.shape}")
        # print(f"Max Value: {np.max(audio_array)}, Min Value: {np.min(audio_array)}")
        # print(f"Dtype: {audio_array.dtype}")
        # read_time = time.strftime('%H:%M:%S')
        # print(f"🔄 Shared memory read at {read_time} - {len(audio_array)} samples, First 10 bit {audio_array[:30]}")

        mse = predict_mse(audio_array)
        if mse is None:
            continue

        # Kiểm tra anomaly
        if mse > manual_threshold:
            print("Anomaly detected!", flush=True)
        # print(f"Predict Result: {mse}", flush=True)
        print(mse, flush=True)

        # Đảm bảo đọc đúng mỗi 2 giây
        elapsed = time.time() - cycle_start
        if elapsed < cycle_duration:
            time.sleep(cycle_duration - elapsed)

def process_folder(folder_path):
    """
    Xử lý âm thanh từ các file WAV trong thư mục.
    """
    exceed_count = 0

    wav_files = [f for f in os.listdir(folder_path) if f.lower().endswith(".wav")]
    wav_files.sort()  # Sort to ensure order
    # print(f"Files: {wav_files}")

    for wav_file in wav_files:
        file_path = os.path.join(folder_path, wav_file)
        # print(f"\n=== Đang xử lý file: {file_path} ===")

        with wave.open(file_path, 'rb') as wav_file_obj:
            # Lấy thông tin file WAV
            num_channels = wav_file_obj.getnchannels()
            sample_width = wav_file_obj.getsampwidth()
            frame_rate = wav_file_obj.getframerate()
            num_frames = wav_file_obj.getnframes()

            # print(f"File: {wav_file}")
            # print(f"Sample Rate: {frame_rate}")
            # print(f"Channels: {num_channels}")
            # print(f"Sample Width: {sample_width}")
            # print(f"Num Frames: {num_frames}")        

            # Đọc dữ liệu âm thanh từ file
            audio_data = wav_file_obj.readframes(num_frames)
            audio_array = np.frombuffer(audio_data, dtype=np.int16)

            # Tính MSE
            mse = predict_mse(audio_array)
            if mse is None:
                continue

            # Kiểm tra anomaly
            if mse > manual_threshold:
                exceed_count += 1
            else:
                exceed_count = 0

            if exceed_count > EXCEED_LIMIT:
                print("Anomaly detected!", flush=True)
                exceed_count = 0  # reset
            print(mse, flush=True)

    print("Done Folder Mode")    

def main():
    """Hàm chính: Chỉ tối ưu phần Real-time, giữ nguyên chế độ đọc file từ folder."""
    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)

    import_file = config_manager.get("REALTIME.IMPORT_FILE")  # True = Folder Mode, False = Real-time Mode
    print(f"IMPORT_FILE: {import_file}")

    if not import_file:
        # print("Chế độ Real-time")
        wait_for_shared_memory()
        process_realtime()
    else:
        folder_path = config_manager.get("REALTIME.FOLDER_PATH")
        # print(f"Chế độ Folder, xử lý thư mục: {folder_path}")
        process_folder(folder_path)  # Giữ nguyên không thay đổi

if __name__ == "__main__":
    main()
