#ifndef RECORDDEVICE_H
#define RECORDDEVICE_H

#include <QObject>
#include <qqml.h>
#include <QtCore/QIODevice>
#include <QtCore/QVector>
#include <QAudioFormat>
#include <qendian.h>
#include <QTimer>
#include <QFile>
#include <QMutex>
#include <QtGlobal>

class RecordDevice : public QIODevice
{

    Q_OBJECT

public:
    explicit RecordDevice(const QAudioFormat &format, QObject *parent = nullptr);
    
signals:
    void dataReady(const QVector<quint32> &buffer);

protected:
    qint64 readData(char *data, qint64 maxSize) override;
    qint64 writeData(const char *data, qint64 maxSize) override;

private:
    const QAudioFormat m_format;
    quint32 m_maxAmplitude = 0;
    qreal m_level = 0.0; // 0.0 <= m_level <= 1.0

    QMutex bufferMutex;
    QVector<quint32> dataBuffer;
};

#endif // RECORDDEVICE_H
