#include "recordio.h"
#include <QAudioDeviceInfo>
#include <QAudioInput>
#include <QAudioOutput>
#include <QDebug>
#include <QTimer>

RecordIO::RecordIO(QObject *parent) : QObject{parent}, m_audioInput(nullptr), qIODevice(nullptr)
{
    // m_audioInput->setBufferSize(1024);  // Đặt độ lớn Buffer    
}

RecordIO::~RecordIO()
{
    m_audioInput->stop();
}

void RecordIO::audioInputStop() {
    disconnect(qIODevice, &QIODevice::readyRead, this, &RecordIO::onReadyRead);
    m_audioInput->stop();    
}

void RecordIO::startAudioInput(const QAudioFormat& format, const QAudioDeviceInfo& deviceInfo)
{
    if (m_audioInput) delete m_audioInput;
    m_audioInput = nullptr;

    qInfo()<<"startAudioInput ";

    m_audioInput = new QAudioInput(deviceInfo, format, this);
    qIODevice = m_audioInput->start();

    connect(qIODevice, &QIODevice::readyRead, this, &RecordIO::onReadyRead);
    if(qIODevice == nullptr) qDebug()<<"nullptr QIODev";
}

void RecordIO::onReadyRead()
{
    if (m_audioInput && qIODevice) {
        QByteArray data = qIODevice->readAll();
        emit sendData(data);
        // qInfo()<<"onReadyRead-audioIO"<<data.at(0);
    }
}


