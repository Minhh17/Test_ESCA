#include "recorddevice.h"

RecordDevice::RecordDevice(const QAudioFormat &format, QObject *parent)
    :QIODevice(parent), m_format(format)
{
    switch (m_format.sampleSize()) {
    case 8:
        switch (m_format.sampleType()) {
        case QAudioFormat::UnSignedInt:
            m_maxAmplitude = 255;
            break;
        case QAudioFormat::SignedInt:
            m_maxAmplitude = 127;
            break;
        default:
            break;
        }
        break;
    case 16:
        switch (m_format.sampleType()) {
        case QAudioFormat::UnSignedInt:
            m_maxAmplitude = 65535;
            break;
        case QAudioFormat::SignedInt:
            m_maxAmplitude = 32767;
            break;
        default:
            break;
        }
        break;
    case 32:
        switch (m_format.sampleType()) {
        case QAudioFormat::UnSignedInt:
            m_maxAmplitude = 0xffffffff;
            break;
        case QAudioFormat::SignedInt:
            m_maxAmplitude = 0x7fffffff;
            break;
        case QAudioFormat::Float:
            m_maxAmplitude = 0x7fffffff; // Kind of
        default:
            break;
        }
        break;
    default:
        break;
    }
}

qint64 RecordDevice::readData(char *data, qint64 maxSize)
{
    Q_UNUSED(data)
    Q_UNUSED(maxSize)
    return 17;
}

qint64 RecordDevice::writeData(const char *data, qint64 maxSize)
{
    if (m_maxAmplitude) {
        Q_ASSERT(m_format.sampleSize() % 8 == 0);
        const int channelBytes = m_format.sampleSize() / 8;
        const int sampleBytes = m_format.channelCount() * channelBytes;
        Q_ASSERT(maxSize % sampleBytes == 0);
        const int numSamples = qMin<int>(maxSize / sampleBytes, 100);

        // const int numSamples = 100;

        quint32 maxValue = 0;
        const unsigned char *ptr = reinterpret_cast<const unsigned char *>(data);
        for (int i = 0; i < numSamples; ++i) {
            for (int j = 0; j < m_format.channelCount(); ++j) {
                quint32 value = 0;

                if (m_format.sampleSize() == 8) {
                    if (m_format.sampleType() == QAudioFormat::UnSignedInt) {
                        value = *reinterpret_cast<const quint8*>(ptr);
                    } else if (m_format.sampleType() == QAudioFormat::SignedInt) {
                        value = qAbs(*reinterpret_cast<const qint8*>(ptr));
                    }
                } else if (m_format.sampleSize() == 16) {
                    if (m_format.sampleType() == QAudioFormat::UnSignedInt) {
                        value = *reinterpret_cast<const quint16*>(ptr);
                    } else if (m_format.sampleType() == QAudioFormat::SignedInt) {
                        value = qAbs(*reinterpret_cast<const qint16*>(ptr));
                    }
                } else if (m_format.sampleSize() == 32) {
                    if (m_format.sampleType() == QAudioFormat::UnSignedInt) {
                        value = *reinterpret_cast<const quint32*>(ptr);
                    } else if (m_format.sampleType() == QAudioFormat::SignedInt) {
                        value = qAbs(*reinterpret_cast<const qint32*>(ptr));
                    } else if (m_format.sampleType() == QAudioFormat::Float) {
                        value = qAbs(*reinterpret_cast<const float*>(ptr) * 0x7fffffff);
                    }
                }

                dataBuffer.append(value);
                maxValue = qMax(value, maxValue);
                ptr += channelBytes;
            }
        }
        maxValue = qMin(maxValue, m_maxAmplitude);
        m_level = qreal(maxValue) / m_maxAmplitude;
        // qInfo() << "dataBuffer level:" << m_level;

        if (!dataBuffer.isEmpty()) {
            // qInfo() << "write func io:" << dataBuffer.at(0) << maxSize;
        } else {
            // qInfo() << "write empty";
        }
    }
    // qDebug() << "Số lần tín hiệu dataReady được phát ra: " << spy.count();
    return maxSize;
}



