#ifndef LATENCYTRACKER_H
#define LATENCYTRACKER_H

#include <QQueue>
#include <QMutex>
#include <QtGlobal>

class LatencyTracker
{
public:
    static void chunkStarted();
    static void bufferSent();
    static void shmWritten();
    static void pythonRead(double ms);
    static void gfccTime(double ms);
    static void inferenceTime(double ms);
    static void resultReceived();

private:
    struct ChunkMetrics {
        qint64 recordStart = 0;
        qint64 bufferSent = 0;
        qint64 shmWritten = 0;
        double readMs = 0.0;
        double gfccMs = 0.0;
        double inferMs = 0.0;
    };

    static QMutex m_mutex;
    static QQueue<ChunkMetrics> m_chunks;
};

#endif // LATENCYTRACKER_H
