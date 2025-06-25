#include "latencytracker.h"
#include <QDateTime>
#include <QDebug>

QMutex LatencyTracker::m_mutex;
QQueue<LatencyTracker::ChunkMetrics> LatencyTracker::m_chunks;

void LatencyTracker::chunkStarted()
{
    QMutexLocker locker(&m_mutex);
    ChunkMetrics chunk;
    chunk.recordStart = QDateTime::currentMSecsSinceEpoch();
    m_chunks.enqueue(chunk);
}

void LatencyTracker::bufferSent()
{
    QMutexLocker locker(&m_mutex);
    if (m_chunks.isEmpty()) {
        ChunkMetrics chunk;
        chunk.bufferSent = QDateTime::currentMSecsSinceEpoch();
        m_chunks.enqueue(chunk);
    } else {
        m_chunks.last().bufferSent = QDateTime::currentMSecsSinceEpoch();
    }
}

void LatencyTracker::shmWritten()
{
    QMutexLocker locker(&m_mutex);
    if (!m_chunks.isEmpty()) {
        m_chunks.last().shmWritten = QDateTime::currentMSecsSinceEpoch();
    }
}

void LatencyTracker::pythonRead(double ms)
{
    qDebug()<<"pythonRead "<< ms;
    QMutexLocker locker(&m_mutex);
    if (!m_chunks.isEmpty()) {
        m_chunks.head().readMs = ms;
    }
}

void LatencyTracker::gfccTime(double ms)
{
    qDebug()<<"gfccTime "<< ms;
    QMutexLocker locker(&m_mutex);
    if (!m_chunks.isEmpty()) {
        m_chunks.head().gfccMs = ms;
    }
}

void LatencyTracker::inferenceTime(double ms)
{
    qDebug()<<"inferenceTime "<< ms;
    QMutexLocker locker(&m_mutex);
    if (!m_chunks.isEmpty()) {
        m_chunks.head().inferMs = ms;
    }
}

void LatencyTracker::resultReceived()
{
    ChunkMetrics chunk;
    qint64 now = QDateTime::currentMSecsSinceEpoch();
    {
        QMutexLocker locker(&m_mutex);
        if (m_chunks.isEmpty()) {
            qWarning() << "LatencyTracker: resultReceived but no chunk";
            return;
        }
        chunk = m_chunks.dequeue();
    }

    qint64 totalLatency = now - chunk.recordStart;
    qint64 recordToSend = chunk.bufferSent - chunk.recordStart;
    qint64 sendToResult = now - chunk.bufferSent;

    qInfo() << "Latency details - record->send:" << recordToSend
            << "ms, read:" << chunk.readMs << "ms, gfcc:" << chunk.gfccMs
            << "ms, infer:" << chunk.inferMs << "ms, total:" << totalLatency
            << "ms";
}
