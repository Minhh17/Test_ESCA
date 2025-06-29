#ifndef LATENCYTRACKER_H
#define LATENCYTRACKER_H

#include <QQueue>
#include <QMutex>
#include <QtGlobal>
#include <QFile>
#include <QTextStream>

class LatencyTracker
{
public:
    static void init();
    static void writeSummary();
    static void reset();
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
    static QFile m_logFile;
    static qint64 m_totalRecordToSend;
    static qint64 m_totalSendToResult;
    static double m_totalReadMs;
    static double m_totalGfccMs;
    static double m_totalInferMs;
    static qint64 m_totalLatency;
    static int m_count;
};
#endif // LATENCYTRACKER_H
