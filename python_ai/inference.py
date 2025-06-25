import sysv_ipc
import signal
import json
import sys
import time
import os
import wave
import logging
import numpy as np
#from gammatone.gtgram import gtgram as cpu_gtgram
from gammatone import gtgram
import tensorflow as tf
from tensorflow.keras.models import load_model

from config.config_manager import ConfigManager
from data_storage import file_path

# --- Configuration ---
config = ConfigManager()
USE_TENSORRT      = config.get("DEVICE.USE_TENSORRT", False)
MODEL_PATH        = config.get("REALTIME.MODEL_PATH")
MODEL_PATH_FULL   = MODEL_PATH + "/saved_model/vq_vae"
TRT_ENGINE_PATH   = config.get("REALTIME.TRT_MODEL_PATH")
MANUAL_THRESHOLD  = config.get("REALTIME.MANUAL_THRESHOLD")
IMPORT_FILE       = config.get("REALTIME.IMPORT_FILE")  # False=Real-time, True=Folder
FOLDER_PATH       = config.get("REALTIME.FOLDER_PATH")

FRAME_RATE        = config.get("PREPROCESS.FRAME_RATE")
WINDOW_TIME       = config.get("PREPROCESS.GAMMA.WINDOW_TIME")
HOP_TIME          = config.get("PREPROCESS.GAMMA.HOP_TIME")
CHANNELS          = config.get("PREPROCESS.GAMMA.CHANNELS")
F_MIN             = config.get("PREPROCESS.GAMMA.F_MIN")

metrics_file = os.path.join(MODEL_PATH, 'save_parameter', 'metrics_detail.json')
with open(metrics_file, 'r', encoding='utf-8') as f:
    data = json.load(f)

# Lấy các tham số
MIN_VAL    = data['min']
MAX_VAL    = data['max']
THRESHOLD    = data['threshold']

#print(f"MIN_VAL: {MIN_VAL}, MAX_VAL: {MAX_VAL}, THRESHOLD: {THRESHOLD}")

# Shared memory keys and size
SAMPLE_RATE   = config.get("REALTIME.SAMPLING_RATE", 44100)
CHANNELS_RT   = config.get("REALTIME.CHANNELS", 1)
SAMPLE_SIZE   = config.get("REALTIME.SAMPLESIZE", 16)
DURATION_SEC  = config.get("REALTIME.SECOND", 2)
SHM_KEY, SEM_KEY = 0x1234, 0x5678
SHM_SIZE = SAMPLE_RATE * CHANNELS_RT * (SAMPLE_SIZE // 8) * DURATION_SEC

# --- Logging Setup ---
log_dir = config.get("REALTIME.LOG_PATH", file_path("logs"))
os.makedirs(log_dir, exist_ok=True)
logging.basicConfig(
    filename=os.path.join(log_dir, "processing_time.log"),
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)
logger = logging.getLogger(__name__)

# --- Model Loader ---
if USE_TENSORRT:
    try:
        import tensorrt as trt
        import pycuda.driver as cuda
        import pycuda.autoinit
        def load_model_fn():
            trt_logger = trt.Logger(trt.Logger.WARNING)
            with open(TRT_ENGINE_PATH, 'rb') as f:
                runtime = trt.Runtime(trt_logger)
                engine = runtime.deserialize_cuda_engine(f.read())
            context = engine.create_execution_context()
            in_shape  = tuple(engine.get_binding_shape(0))
            out_shape = tuple(engine.get_binding_shape(1))
            dtype_in  = np.dtype(engine.get_binding_dtype(0).name)
            dtype_out = np.dtype(engine.get_binding_dtype(1).name)
            try:
                h_in  = cuda.pagelocked_empty(trt.volume(in_shape), dtype=dtype_in)
                h_out = cuda.pagelocked_empty(trt.volume(out_shape), dtype=dtype_out)
            except Exception:
                h_in  = np.empty(trt.volume(in_shape), dtype=dtype_in)
                h_out = np.empty(trt.volume(out_shape), dtype=dtype_out)
            d_in  = cuda.mem_alloc(h_in.nbytes)
            d_out = cuda.mem_alloc(h_out.nbytes)
            stream = cuda.Stream()
            def infer(x: np.ndarray) -> np.ndarray:
                x_nchw = np.transpose(x, (0, 3, 1, 2)).astype(dtype_in).ravel()
                np.copyto(h_in, x_nchw)
                cuda.memcpy_htod_async(d_in, h_in, stream)
                context.execute_async_v2([int(d_in), int(d_out)], stream.handle)
                cuda.memcpy_dtoh_async(h_out, d_out, stream)
                stream.synchronize()
                out = h_out.reshape(out_shape).astype(np.float32)
                return out
            return infer
        run_model = load_model_fn()
    except Exception as e:
        logger.warning("TensorRT unavailable, falling back to plain model: %s", e)
        USE_TENSORRT = False

if not USE_TENSORRT:
    def load_plain_model():
        model = load_model(MODEL_PATH_FULL)
        return lambda x: model.predict(x, verbose=0)
    run_model = load_plain_model()

# Khởi tạo biến để giữ IPC
shm = None
semaphore = None


# --- Preprocess Function ---
def preprocess_audio(audio: np.ndarray) -> np.ndarray:
    gtg = gtgram.gtgram(audio, FRAME_RATE, WINDOW_TIME, HOP_TIME, CHANNELS, F_MIN)
    #gtg = gtgram.gtgram(audio_array, frame_rate, window_time, hop_time, channels, f_min)
    db = 20.0 * np.log10(gtg + 1e-10)
    norm = np.clip((db - MIN_VAL) / (MAX_VAL - MIN_VAL), 0.0, 1.0)
    return norm[np.newaxis, ..., np.newaxis]

# --- Prediction & Reporting ---
def predict_and_report(audio: np.ndarray):
    process_start = time.perf_counter()
    logger.info("Chunk start: %.6f", process_start)
    t0 = time.perf_counter()

    inp = preprocess_audio(audio)

    gfcc_ms = (time.perf_counter() - t0) * 1e3
    print(f"METRIC gfcc_ms {gfcc_ms:.3f}", flush=True)

    start = time.perf_counter()
    pred = run_model(inp)

    infer_ms = (time.perf_counter() - start) * 1e3
    print(f"METRIC infer_ms {infer_ms:.3f}", flush=True)

    mse = float(np.mean((inp - pred) ** 2))
    logger.info("Inference time: %.6f ms, MSE: %.6f", infer_ms, mse)
    logger.info("Chunk end: %.6f", time.perf_counter())


    if mse > MANUAL_THRESHOLD:
        print("Anomaly detected!!", flush=True)
        
    print(f"{mse:.10f}", flush=True)


def signal_handler(signum, frame):
    """
    Xử lý tín hiệu (SIGINT, SIGTERM).
    """
    print(f"Signal {signum} received. Exiting...")
    cleanup()
    sys.exit(0)

# --- Real-time Processing ---
def wait_for_shared_memory():
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

def process_realtime():
    """Handle real-time inference using the configured buffer duration."""
    cycle_duration = float(DURATION_SEC)

    last_read_time = time.time()

    while True:
        cycle_start = time.time()

        # Đợi đúng chu kỳ 2 giây kể từ lần đọc trước
        if cycle_start - last_read_time < cycle_duration:
            time.sleep(cycle_duration - (cycle_start - last_read_time))
            continue

        last_read_time = cycle_start  # Cập nhật thời điểm đọc mới nhất

        try:
            t0 = time.perf_counter()    
            semaphore.acquire()
            raw_data = bytearray(shm.read(SHM_SIZE))
            semaphore.release()
            read_ms = (time.perf_counter() - t0) * 1e3
            print(f"METRIC read_ms {read_ms:.3f}", flush=True)
        except sysv_ipc.BusyError:
            print("Semaphore is busy. Skipping this cycle.")
            continue

        if len(raw_data) != SHM_SIZE:
            print(f"⚠️ Warning: Expected {SHM_SIZE} bytes but got {len(raw_data)} bytes!")
            continue

        #print(raw_data, flush=True)
        audio_array = np.frombuffer(raw_data, dtype=np.int16)

        mse = predict_and_report(audio_array)
        if mse is None:
            continue

        # Kiểm tra anomaly

        if mse > MANUAL_THRESHOLD:
            print("Anomaly detected!", flush=True)
        # print(f"Predict Result: {mse}", flush=True)
        print(mse, flush=True)

        # Đảm bảo đọc đúng mỗi 2 giây
        elapsed = time.time() - cycle_start
        if elapsed < cycle_duration:
            time.sleep(cycle_duration - elapsed)

# --- Folder Processing ---
def process_folder():
    files = sorted(f for f in os.listdir(FOLDER_PATH) if f.lower().endswith('.wav'))
    for f in files:
        with wave.open(os.path.join(FOLDER_PATH, f), 'rb') as wf:
            audio = np.frombuffer(wf.readframes(wf.getnframes()), dtype=np.int16)
        predict_and_report(audio)
    print("Done Folder Mode")

# --- Cleanup ---
def cleanup():
    """
    Hàm dọn dẹp shared memory và semaphore khi thoát.
    """
    global shm, semaphore
    if shm:
        try:
            shm.detach()
            print("Shared memory detached.")
        except Exception as e:
            print(f"Failed to detach shared memory: {e}")

# --- Main ---
def main():
    signal.signal(signal.SIGINT, lambda s, f: (cleanup(), sys.exit(0)))
    signal.signal(signal.SIGTERM, lambda s, f: (cleanup(), sys.exit(0)))
    if not IMPORT_FILE:
        wait_for_shared_memory()
        process_realtime()
    else:
        process_folder()

if __name__ == '__main__':
    main()
