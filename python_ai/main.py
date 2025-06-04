# python_ai/main.py
import sys
import time
import json
from inference.shared_memory_reader import SharedMemoryConsumer
from inference.inference_engine import InferenceEngine
from inference.result_sender import ResultSender
from inference.logger import setup_logger
import threading
import queue
from config.config_manager import ConfigManager

logger = setup_logger()

def inference_worker(shared_memory_reader, inference_engine, result_sender, q):
    while True:
        try:
            # Đọc dữ liệu âm thanh từ Shared Memory
            audio_data = shared_memory_reader.read_audio()
            if audio_data is not None:
                # Thực hiện inference
                result = inference_engine.perform_inference(audio_data, sample_rate=44100)
                
                # Gửi kết quả qua stdout
                result_sender.send_result(result)
                
                # Đưa kết quả vào hàng đợi để có thể xử lý thêm nếu cần
                q.put(result)
            else:
                time.sleep(0.1)  # Ngủ một chút nếu không có dữ liệu
        except Exception as e:
            logger.error(f"Inference worker encountered an error: {e}")

def main():
    # Đường dẫn cố định đến file config.json
    config_file = "/home/haiminh/Desktop/ESCA_Qt/python_ai/config/default.json"    
    
    # Đường dẫn cố định đến thư mục log (nếu cần)
    log_path = "/home/haiminh/Desktop/ESCA_Qt/python_ai/log"

    import os
    os.makedirs(log_path, exist_ok=True)
    
    # Đọc cấu hình từ file config.json
    try:
        with open(config_file, 'r') as f:
            config = json.load(f)
    except Exception as e:
        logger.error(f"Failed to read config file: {e}")
        sys.exit(1)
    
    # Khởi tạo các thành phần
    shared_memory_reader = SharedMemoryConsumer(config)
    inference_engine = InferenceEngine(config)
    result_sender = ResultSender()
    
    # Tạo hàng đợi để giao tiếp giữa luồng
    q = queue.Queue()
    
    # Khởi chạy luồng inference
    inference_thread = threading.Thread(target=inference_worker, args=(shared_memory_reader, inference_engine, result_sender, q))
    inference_thread.daemon = True
    inference_thread.start()
    logger.info("Inference thread started.")
    
    try:
        while True:
            try:
                # Có thể thực hiện thêm các xử lý khác ở đây
                result = q.get(timeout=1)  # Chờ một kết quả từ hàng đợi
                logger.info(f"Received result from queue: {result}")
            except queue.Empty:
                continue
    except KeyboardInterrupt:
        logger.info("Inference process terminated by user.")
    except Exception as e:
        logger.error(f"Unexpected error: {e}")
    finally:
        # Giải phóng tài nguyên
        shared_memory_reader.close()
        logger.info("Inference process ended.")

if __name__ == "__main__":
    main()
