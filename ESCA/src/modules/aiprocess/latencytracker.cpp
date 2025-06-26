#include "latencytracker.h"
#include <QDateTime>
#include <QDebug>
#include "../../common/storage/datastorage.h"

QMutex LatencyTracker::m_mutex;
QQueue<LatencyTracker::ChunkMetrics> LatencyTracker::m_chunks;

QFile LatencyTracker::m_logFile;
qint64 LatencyTracker::m_totalRecordToSend = 0;
qint64 LatencyTracker::m_totalSendToResult = 0;
double LatencyTracker::m_totalReadMs = 0.0;
double LatencyTracker::m_totalGfccMs = 0.0;
double LatencyTracker::m_totalInferMs = 0.0;
qint64 LatencyTracker::m_totalLatency = 0;
int LatencyTracker::m_count = 0;

void LatencyTracker::init()
{
    QMutexLocker locker(&m_mutex);
    if (m_logFile.isOpen())
        return;
    QString logPath = DataStorage::filePath("latency.log");
    m_logFile.setFileName(logPath);
    if (!m_logFile.open(QIODevice::Append | QIODevice::Text)) {
        qWarning() << "Cannot open latency log file:" << logPath;
        return;
    }
    if (m_logFile.size() == 0) {
        QTextStream out(&m_logFile);
        out << "record_to_send,send_to_result,read_ms,gfcc_ms,infer_ms,total_ms\n";
        out.flush();
    }
}

void LatencyTracker::writeSummary()
{
    QMutexLocker locker(&m_mutex);
    if (!m_logFile.isOpen() || m_count == 0)
        return;
    QTextStream out(&m_logFile);
    out << "AVERAGE,"
        << (double)m_totalRecordToSend / m_count << ','
        << (double)m_totalSendToResult / m_count << ','
        << m_totalReadMs / m_count << ','
        << m_totalGfccMs / m_count << ','
        << m_totalInferMs / m_count << ','
        << (double)m_totalLatency / m_count << "\n";
    out.flush();
    locker.unlock();
    reset();
}

void LatencyTracker::reset()
{
    QMutexLocker locker(&m_mutex);
    m_chunks.clear();
    m_totalRecordToSend = 0;
    m_totalSendToResult = 0;
    m_totalReadMs = 0.0;
    m_totalGfccMs = 0.0;
    m_totalInferMs = 0.0;
    m_totalLatency = 0;
    m_count = 0;
}

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

    qint64 totalLatency = -1;
    qint64 recordToSend = -1;
    qint64 sendToDoneShm = -1;

    if (chunk.recordStart > 0)
        totalLatency = now - chunk.recordStart;
    if (chunk.recordStart > 0 && chunk.bufferSent > 0)
        recordToSend = chunk.bufferSent - chunk.recordStart;
    if (chunk.bufferSent > 0)
        sendToDoneShm = chunk.shmWritten - chunk.bufferSent;

    qInfo() << "Latency details - record->send:" << recordToSend
            << "ms, send->shm:" << sendToDoneShm
            << "ms, read:" << chunk.readMs
            << "ms, gfcc:" << chunk.gfccMs
            << "ms, infer:" << chunk.inferMs
            << "ms, total:" << totalLatency << "ms";

    {
        QMutexLocker locker(&m_mutex);
        m_totalRecordToSend += recordToSend;
        m_totalSendToResult += sendToDoneShm;
        m_totalReadMs += chunk.readMs;
        m_totalGfccMs += chunk.gfccMs;
        m_totalInferMs += chunk.inferMs;
        m_totalLatency += totalLatency;
        ++m_count;
    }

    qInfo() << "Latency ave - record->send:" << m_totalRecordToSend / m_count
            << "ms, send->shm:" << m_totalSendToResult / m_count
            << "ms, read:" << m_totalReadMs / m_count
            << "ms, gfcc:" << m_totalGfccMs / m_count
            << "ms, infer:" << m_totalInferMs / m_count
            << "ms, total:" << m_totalLatency / m_count<< "ms";

    if (m_logFile.isOpen()) {
        QTextStream out(&m_logFile);
        out << recordToSend << ','
            << sendToDoneShm << ','
            << chunk.readMs << ','
            << chunk.gfccMs << ','
            << chunk.inferMs << ','
            << totalLatency << "\n";
        m_logFile.flush();
    }
}
