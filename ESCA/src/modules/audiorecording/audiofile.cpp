#include "audiofile.h"
#include <QDebug>
#include <QDir>

constexpr quint32 WAV_HEADER_SIZE = 44;

AudioFile::AudioFile(const QString &outputDir,
                     const QAudioFormat &format,
                     QObject *parent)
    : QObject(parent),
    m_outputDir(outputDir),
    m_audioFormat(format),
    dataSize(0) // Khởi tạo dataSize
{
    QDir dir(m_outputDir);
    if (!dir.exists()) {
        if (!dir.mkpath(".")) {
            qWarning() << "Failed to create output directory:" << m_outputDir;
        }
    }
}

AudioFile::~AudioFile() {
    stopRecording();
    if (m_outFile.isOpen()) {
        m_outFile.close();
    }
}

void AudioFile::startRecording() {
    QMutexLocker locker(&m_mutex);
    if (m_outFile.isOpen()) {
        qWarning() << "Recording already in progress.";
        return;
    }
    createFile();
}

void AudioFile::stopRecording() {
    QMutexLocker locker(&m_mutex);
    if (!m_outFile.isOpen()) {
        return;
    }

    finalizeWavHeader(dataSize);
    m_outFile.close();
    qDebug() << "Stopped recording. Finalized file with dataSize:" << dataSize;
}

void AudioFile::createFile() {
    QDateTime local(QDateTime::currentDateTime());
    QString fileName = QString("%1/basefile_%2.wav")
                           .arg(m_outputDir)
                           .arg(local.toString("yyyyMMdd_HHmmss"));


    m_outFile.setFileName(fileName);
    if (!m_outFile.open(QIODevice::WriteOnly)) {
        qWarning() << "Cannot open file for writing:" << fileName;
        return;
    }

    dataSize = 0; // Reset dataSize cho file mới
    writeWavHeader();
    //qDebug() << "Created file:" << fileName;
}

void AudioFile::writeWavHeader() {
    QByteArray header;
    header.resize(WAV_HEADER_SIZE);
    char *ptr = header.data();

    // RIFF header
    memcpy(ptr, "RIFF", 4);
    ptr += 4;
    quint32 chunkSize = 36 + dataSize; // Sẽ được cập nhật sau
    memcpy(ptr, &chunkSize, 4);
    ptr += 4;
    memcpy(ptr, "WAVE", 4);
    ptr += 4;

    // fmt subchunk
    memcpy(ptr, "fmt ", 4);
    ptr += 4;
    quint32 subchunk1Size = 16;
    memcpy(ptr, &subchunk1Size, 4);
    ptr += 4;
    quint16 audioFormat = 1; // PCM
    memcpy(ptr, &audioFormat, 2);
    ptr += 2;
    quint16 numChannels = m_audioFormat.channelCount();
    memcpy(ptr, &numChannels, 2);
    ptr += 2;
    quint32 sampleRate = m_audioFormat.sampleRate();
    memcpy(ptr, &sampleRate, 4);
    ptr += 4;
    quint32 byteRate = sampleRate * numChannels * (m_audioFormat.sampleSize() / 8);
    memcpy(ptr, &byteRate, 4);
    ptr += 4;
    quint16 blockAlign = numChannels * (m_audioFormat.sampleSize() / 8);
    memcpy(ptr, &blockAlign, 2);
    ptr += 2;
    quint16 bitsPerSample = m_audioFormat.sampleSize();
    memcpy(ptr, &bitsPerSample, 2);
    ptr += 2;

    // data subchunk
    memcpy(ptr, "data", 4);
    ptr += 4;
    memcpy(ptr, &dataSize, 4); // Sẽ được cập nhật sau

    m_outFile.seek(0);
    m_outFile.write(header);
    qInfo() << "End write header to WAV file";
}

void AudioFile::appendData(const QByteArray &data) {
    QMutexLocker locker(&m_mutex);

    if (!m_outFile.isOpen()) {
        qWarning() << "appendData: File is not open!";
        return;
    }

    if (data.isEmpty()) {
        qWarning() << "appendData: Empty data received!";
        return;
    }

    qint64 bytesWritten = m_outFile.write(data);
    if (bytesWritten == -1) {
        qWarning() << "appendData: Failed to write data!";
        return;
    }

    m_outFile.flush();
    dataSize += static_cast<quint32>(bytesWritten);
}

void AudioFile::writeChunk(const QByteArray &data) {
    QMutexLocker locker(&m_mutex);

    if (!m_outFile.isOpen()) {
        qWarning() << "writeChunk: File is not open!";
        return;
    }
    
    if (data.isEmpty()) {
        qWarning() << "writeChunk: Empty data received!";
        return;
    }

    m_outFile.write(data);
    m_outFile.flush();
    dataSize = static_cast<quint32>(data.size());

    finalizeWavHeader(dataSize);

    createFile();
}

void AudioFile::finalizeWavHeader(quint32 dataSize) {
    if (!m_outFile.isOpen()) {
        return;
    }

    // Cập nhật ChunkSize và DataSize trong header
    m_outFile.seek(4);
    quint32 chunkSize = 36 + dataSize;
    QDataStream out(&m_outFile);
    out.setByteOrder(QDataStream::LittleEndian);
    out << chunkSize;

    m_outFile.seek(40);
    out << dataSize;

    m_outFile.close();
    //qDebug() << "Finalized file with dataSize:" << dataSize;
}
