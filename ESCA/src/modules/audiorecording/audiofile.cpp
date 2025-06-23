#include "audiofile.h"
#include <QDebug>
#include <QDir>

constexpr quint32 WAV_HEADER_SIZE = 44;

AudioFile::AudioFile(const QString &outputDir,
                     const QAudioFormat &format,
                     double durationSeconds,
                     QObject *parent)
    : QObject(parent),
    m_outputDir(outputDir),
    m_audioFormat(format),
    m_durationSeconds(durationSeconds),
    m_usingBuffer1(true),
    dataSize(0) // Khởi tạo dataSize
{
    QDir dir(m_outputDir);
    if (!dir.exists()) {
        if (!dir.mkpath(".")) {
            qWarning() << "Failed to create output directory:" << m_outputDir;
        }
    }

    m_chunkSize = static_cast<quint32>(
        m_audioFormat.sampleRate() *
        (m_audioFormat.sampleSize() / 8) *
        m_audioFormat.channelCount() *
        m_durationSeconds
        );

    m_buffer1.reserve(m_chunkSize);
    m_buffer2.reserve(m_chunkSize);
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

    // Ghi dữ liệu còn lại trong buffer
    QByteArray &currentBuffer = m_usingBuffer1 ? m_buffer1 : m_buffer2;
    if (!currentBuffer.isEmpty()) {
        m_outFile.write(currentBuffer);
        m_outFile.flush();
        dataSize = currentBuffer.size(); // Cập nhật dataSize dựa trên dữ liệu thực tế
        qDebug() << "Wrote remaining" << dataSize << "bytes to file:" << m_outFile.fileName();
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

void AudioFile::writeDataForever(const QByteArray &data) {
    QMutexLocker locker(&m_mutex);

    if (!m_outFile.isOpen()) {
        qWarning() << "writeDataForever: File is not open!";
        return;
    }

    if (data.isEmpty()) {
        qWarning() << "writeDataForever: Empty data received!";
        return;
    }

    qint64 bytesWritten = m_outFile.write(data);
    if (bytesWritten == -1) {
        qWarning() << "writeDataForever: Failed to write data!";
        return;
    }

    m_outFile.flush();
    dataSize += static_cast<quint32>(bytesWritten);
}

void AudioFile::writeAudioData(const QByteArray &data) {
    QMutexLocker locker(&m_mutex);

    if (!m_outFile.isOpen()) {
        qWarning() << "writeAudioData: File is not open!";
        return;
    }

    QByteArray &currentBuffer = m_usingBuffer1 ? m_buffer1 : m_buffer2;
    currentBuffer.append(data);

    while (currentBuffer.size() >= m_chunkSize) {
        // Ghi dữ liệu vào file
        QByteArray chunk = currentBuffer.left(m_chunkSize);
        //qDebug() << "Data before writing to WAV - First 10 bytes: " << chunk.mid(0, 10);
        m_outFile.write(chunk);
        m_outFile.flush();
        dataSize = m_chunkSize; // Cập nhật dataSize cho chunk này

        // Hoàn thiện header cho file hiện tại
        finalizeWavHeader(dataSize);

        // Xóa dữ liệu đã ghi
        currentBuffer.remove(0, m_chunkSize);

        // Tạo file mới
        createFile();
    }
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
