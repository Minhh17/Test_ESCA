#include "sharedmemorymanager.h"
#include <QDebug>

SharedMemoryManager::SharedMemoryManager(QObject* parent)
    : QThread(parent),
    shm_key(SHM_KEY),
    sem_key(SEM_KEY),
    shm_size(SHM_SIZE),
    shm_id(-1),
    sem_id(-1),
    running(false) {}

SharedMemoryManager::~SharedMemoryManager() {
    stop();
    wait(); // Đảm bảo thread kết thúc trước khi hủy
    cleanup_ipc();
}

bool SharedMemoryManager::init_ipc() {
    // Tạo shared memory
    shm_id = shmget(shm_key, shm_size, IPC_CREAT | 0666);
    if (shm_id == -1) {
        std::cerr << "shmget failed: " << strerror(errno) << std::endl;
        return false;
    }

    // Tạo semaphore
    sem_id = semget(sem_key, 1, IPC_CREAT | 0666);
    if (sem_id == -1) {
        std::cerr << "semget failed: " << strerror(errno) << std::endl;
        cleanup_ipc(); // Dọn dẹp shm_id đã tạo
        return false;
    }

    // Khởi tạo semaphore
    union semun {
        int val;
        struct semid_ds* buf;
        unsigned short* array;
    } sem_arg;
    sem_arg.val = 1;
    if (semctl(sem_id, 0, SETVAL, sem_arg) == -1) {
        std::cerr << "semctl SETVAL failed: " << strerror(errno) << std::endl;
        cleanup_ipc();
        return false;
    }

    return true;
}

void SharedMemoryManager::cleanup_ipc() {
    if (shm_id != -1) {
        shmctl(shm_id, IPC_RMID, nullptr);
        shm_id = -1;
    }
    if (sem_id != -1) {
        semctl(sem_id, 0, IPC_RMID);
        sem_id = -1;
    }
}

bool SharedMemoryManager::attachSharedMemory(char*& shm_ptr) {
    shm_ptr = static_cast<char*>(shmat(shm_id, nullptr, 0));
    if (shm_ptr == reinterpret_cast<char*>(-1)) {
        std::cerr << "shmat failed: " << strerror(errno) << std::endl;
        return false;
    }
    return true;
}

void SharedMemoryManager::detachSharedMemory(char* shm_ptr) {
    if (shm_ptr && shm_ptr != reinterpret_cast<char*>(-1)) {
        shmdt(shm_ptr);
    }
}

void SharedMemoryManager::run() {
    running = true;
    char* shm_ptr = nullptr;

    while (running) {
        if (semop(sem_id, &sem_lock, 1) == -1) {
            if (errno == EINTR) continue; // Bị gián đoạn bởi signal
            std::cerr << "semop lock failed: " << strerror(errno) << std::endl;
            break;
        }

        if (!attachSharedMemory(shm_ptr)) {
            semop(sem_id, &sem_unlock, 1);
            continue;
        }

        {
            QMutexLocker locker(&bufferMutex);
            std::memset(shm_ptr, 0, shm_size);
            std::memcpy(shm_ptr, buffer.constData(),
                        std::min(static_cast<size_t>(buffer.size()), shm_size));
        }

        detachSharedMemory(shm_ptr);

        if (semop(sem_id, &sem_unlock, 1) == -1) {
            std::cerr << "semop unlock failed: " << strerror(errno) << std::endl;
            break;
        }

        msleep(100); // Có thể điều chỉnh tùy theo yêu cầu realtime
    }

    // Cleanup trong trường hợp thoát bất thường
    detachSharedMemory(shm_ptr);
}

void SharedMemoryManager::getAudioData(const QByteArray &data) {
    QMutexLocker locker(&bufferMutex);
    buffer = data; // Sử dụng move semantics thay vì copy nếu có thể
    emit bufferChanged();
}

void SharedMemoryManager::stop() {
    running = false;
}
