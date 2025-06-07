import sysv_ipc
import signal
import sys
import time
import numpy as np
from gammatone import gtgram
from tensorflow.keras.models import load_model
from config import ConfigManager
import logging
import os


config_manager = ConfigManager()

log_dir = config_manager.get("REALTIME.LOG_PATH", "./logs")
os.makedirs(log_dir, exist_ok=True)
log_file = os.path.join(log_dir, "processing_time.log")
logging.basicConfig(
    filename=log_file,
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)
logger = logging.getLogger(__name__)

logger.info("Cấu hình mặc định:")
logger.info(config_manager.config)

preprocess_type = config_manager.get("PREPROCESS.TYPE")
logger.info(f"PREPROCESS.TYPE: {preprocess_type}")


# Định nghĩa khóa và kích thước shared memory
SHM_KEY = 0x1234
SEM_KEY = 0x5678
SHM_SIZE = 176400

SAMPLE_RATE = 44100 
NUM_CHANNELS = 1   
BIT_DEPTH = 16     

frame_rate = 44100  
window_time = 0.12  
hop_time = 0.06 
channels = 32  
f_min = 100  

MIN = -23.14520263671875 
MAX = 51.67738342285156  
a_min = 0  
a_max = 1  
threshold = 0.002630938310176134 

model = load_model('/home/haiminh/Desktop/ESCA_Qt/python_ai/result/saved_model/vq_vae')

# Khởi tạo biến để giữ IPC
shm = None
semaphore = None

def cleanup():
    """
    Hàm dọn dẹp shared memory và semaphore khi thoát.
    """
    global shm, semaphore
    if shm:
        try:
            shm.detach()
            logger.info("Shared memory detached.")
        except Exception as e:
            logger.error(f"Failed to detach shared memory: {e}")

def signal_handler(signum, frame):
    """
    Xử lý tín hiệu (SIGINT, SIGTERM).
    """
    logger.info(f"Signal {signum} received. Exiting...")
    cleanup()
    sys.exit(0)
    
    
def wait_for_shared_memory():
    """
    đợi cho đến khi shared memory và semaphore có sẵn
    """
    global shm, semaphore
    while True:
        try:
            shm = sysv_ipc.SharedMemory(SHM_KEY)
            logger.info("Shared memory connected.")
            break
        except sysv_ipc.ExistentialError:
            logger.info("Shared memory không tồn tại. Đang chờ...")
            time.sleep(1)

    while True:
        try:
            semaphore = sysv_ipc.Semaphore(SEM_KEY)
            logger.info("Semaphore connected.")
            break
        except sysv_ipc.ExistentialError:
            logger.info("Semaphore không tồn tại. Đang chờ...")
            time.sleep(1)

def main():

    global shm, semaphore

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)
    
    wait_for_shared_memory()

    try:
        # Kết nối tới shared memory
        shm = sysv_ipc.SharedMemory(SHM_KEY)
    except sysv_ipc.ExistentialError:
        logger.error("Shared memory không tồn tại. Hãy chắc chắn rằng Producer đang chạy.")
        sys.exit(1)

    try:
        # Kết nối tới semaphore
        semaphore = sysv_ipc.Semaphore(SEM_KEY)
    except sysv_ipc.ExistentialError:
        logger.error("Semaphore không tồn tại. Hãy chắc chắn rằng Producer đang chạy.")
        sys.exit(1)

    while True:
        try:
            # Thực hiện P operation để khóa semaphore
            semaphore.acquire()
            # Đọc dữ liệu nhị phân từ shared memory lưu ra buffer
            raw_data = bytearray(shm.read(SHM_SIZE))
            # print("raw audio data: ", raw_data)
                        
            start_time = time.time()
            audio_array = np.frombuffer(raw_data, dtype=np.int16)
            # print("audio data: ", audio_array)
            gtg = gtgram.gtgram(audio_array, frame_rate, window_time, hop_time, channels, f_min)
            # print("gtg: ", gtg)

            # Xử lý feature (chuyển đỗi sang log-spectrogram)
            a = np.flipud(20 * np.log10(gtg + 0.000000001))
            # print("a step 1: ", a, a.shape)
            a = np.clip((a - MIN) / (MAX - MIN), a_min=0, a_max=1)
            # print("a step 2: ", a, a.shape)
            a = np.reshape(a, (1, a.shape[0], a.shape[1], 1))
            # print("a step 3: ", a, a.shape)

            if a.shape != (1, 32, 32, 1):
                #print(f"Input shape Error: {a.shape}")
                return
    
            # Tính MSE giữa input và output của autoencoder (sử dụng mô hình đã huấn luyện)
            pred = np.mean((a - model.predict(a))**2)

            type = 1 if pred > threshold else 0
    
            end_time = time.time()
            
            # Thực hiện V operation để mở khóa semaphore
            semaphore.release()
            
            print(pred, flush=True)
            logger.info(f"Processing time: {end_time - start_time} seconds, Pred: {pred}")
        
        except sysv_ipc.BusyError:
            logger.info("Semaphore is busy. Skipping this cycle.")
        except Exception as e:
            logger.error(f"Unexpected error: {e}")
            try:
                semaphore.release()
            except sysv_ipc.ExistentialError:
                pass

        #time.sleep(0.01)  # 100ms

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        signal_handler(signal.SIGINT, None)
