#ifndef SHAREDMEMORYMANAGER_H
#define SHAREDMEMORYMANAGER_H

#include <QThread>
#include <QByteArray>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/sem.h>
#include <QMutex>
#include <cstring>
#include <iostream>
#include <QWaitCondition>

class SharedMemoryManager : public QThread {
    Q_OBJECT
public:
    explicit SharedMemoryManager(QObject* parent = nullptr);
    ~SharedMemoryManager() override;

    bool init_ipc();
    void cleanup_ipc();

protected:
    void run() override;

public slots:
    void getAudioData(const QByteArray &data);
    void stop();

signals:
    void bufferChanged();
    void sharedMemoryUnavailable();

private:
    static constexpr key_t SHM_KEY = 0x1234;
    static constexpr key_t SEM_KEY = 0x5678;
    static constexpr size_t SHM_SIZE = 176400; // 2s @ 44100Hz, 1ch, 16bit

    key_t shm_key;
    key_t sem_key;
    size_t shm_size;
    int shm_id;
    int sem_id;
    volatile bool running;

    QWaitCondition dataReady;
    QMutex waitMutex;
    bool hasNewData = false;

    QByteArray buffer;
    QMutex bufferMutex;

    struct sembuf sem_lock{0, -1, 0};   // P operation
    struct sembuf sem_unlock{0, 1, 0};  // V operation

    static_assert(sizeof(struct sembuf) > 0, "struct sembuf is not defined");

    bool attachSharedMemory(char*& shm_ptr, int maxRetries = 3, int backoffMs = 100, int timeoutMs = 0);
    void detachSharedMemory(char* shm_ptr);
};

#endif // SHAREDMEMORYMANAGER_H
