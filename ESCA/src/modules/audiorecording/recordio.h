#ifndef RECORDIO_H
#define RECORDIO_H

#include <QAudioDeviceInfo>
#include <QAudioFormat>
#include <QBuffer>
#include <QByteArray>
#include <QDir>
#include <QObject>
#include <QVector>
#include <QtCore/qiodevice.h>
// #include "controller/audiocontroller.h"

QT_BEGIN_NAMESPACE
class QAudioInput;
class QAudioOutput;
class QAudioDeviceInfo;
QT_END_NAMESPACE

class RecordIO : public QObject {

    Q_OBJECT
    
public:
    explicit RecordIO(QObject *parent = nullptr);
    ~RecordIO();

    void startAudioInput(const QAudioFormat &format, const QAudioDeviceInfo& device);
    void audioInputStop();

public slots:
    void onReadyRead();

signals:
    void sendData(const QByteArray &data);

private:
    QAudioInput* m_audioInput = nullptr;
    QAudioOutput* m_audioOutput = nullptr;

    QIODevice* qIODevice;
    RecordIO* recordIO;

    QString saveFileLocation;
    int duration;

};

#endif // RECORDIO_H
