#include "recordingcontroller.h"
#include <QDebug>

RecordingController::RecordingController(QObject *parent)
    : QObject(parent)
    , m_recordIO(new RecordIO())
    , m_recordingChart(new RecordingChart())
    , m_audioConfig(new AudioConfig())
    , m_audioFile(nullptr)
    , m_audioFileThread(nullptr)
    , m_recordingSchedule(nullptr)
    , m_format(m_audioConfig->format())
    , m_recStatus(false)
    , sharedMemoryManager(new SharedMemoryManager(this))
    , m_chunkSize(calculateChunkSize(m_format, 2.0))
{
    qmlRegisterSingletonInstance("AudioChartImport", 1, 0, "AudioChart", m_recordingChart);
    qmlRegisterSingletonInstance("AudioConfigImport", 1, 0, "AudioConfig", m_audioConfig);
    setRecStatus(false);

    // m_outputDir = QStandardPaths::writableLocation(QStandardPaths::HomeLocation);

    connect(this, &RecordingController::sendChartData, m_recordingChart, &RecordingChart::onSendChartData);

    qInfo()<<"format in ini: "<<m_audioConfig->format();
    sharedMemoryManager->setBufferSize(m_chunkSize);

    if (!sharedMemoryManager->init_ipc()) {
        qDebug() << "Failed to initialize IPC.";
        delete sharedMemoryManager;
        sharedMemoryManager = nullptr;
    }
    // else {
    //     sharedMemoryManager->start();
    //     qDebug() << "SharedMemoryManager started.";
    // }
}

RecordingController::~RecordingController()
{
    // m_recordIO->audioInputStop();
    stopRecording();

    // Dừng và dọn dẹp thread nếu còn chạy
    if (m_audioFileThread && m_audioFileThread->isRunning()) {
        m_audioFileThread->quit();
        m_audioFileThread->wait();
    }
    delete m_audioFile;
    delete m_audioFileThread;
    delete m_recordingChart;
    delete m_recordIO;
    delete m_audioConfig;
    qDebug() << "RecordingController destroyed.";
}

void RecordingController::startRecording()
{
    connect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleDataReady);
    m_format = m_audioConfig->format();
    m_chunkSize = calculateChunkSize(m_format, 2.0);
    sharedMemoryManager->setBufferSize(m_chunkSize);
    qDebug()<< "format"<< m_format;

    QAudioDeviceInfo deviceInfo = m_audioConfig->deviceInfo();
    m_outputDir = m_audioConfig->listOutput();
    qDebug()<< "m_outputDir"<< m_outputDir;

    m_audioFile = new AudioFile(m_outputDir, m_format, 2.0);

    // Đảm bảo thread chưa chạy thì start lại
    if (!m_audioFileThread) {
        m_audioFileThread = new QThread();
    } else if (m_audioFileThread->isRunning()) {
        m_audioFileThread->quit();
        m_audioFileThread->wait();
    }

    m_recordIO->startAudioInput(m_format, deviceInfo);
    qInfo() << "format before thread" << m_format;

    m_audioFile->moveToThread(m_audioFileThread);   // cho AudioFile vào thread riêng

    // Kết nối các signal và slot để quản lý thread và AudioFile
    connect(m_audioFileThread, &QThread::started, m_audioFile, &AudioFile::startRecording);
    connect(m_audioFile, &AudioFile::destroyed, m_audioFileThread, &QThread::quit);
    connect(m_audioFile, &AudioFile::destroyed, m_audioFileThread, &QObject::deleteLater);

    // Start thread
    m_audioFileThread->start();

    setRecStatus(true);
    qInfo() << "Start recording with format" << m_format;

    // qDebug() << "Producer Record is running.";
}

void RecordingController::stopRecording()
{
    disconnect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleDataReady);
    if (recStatus() == true) {
        m_audioFile->stopRecording();
        m_recordIO->audioInputStop();
        qInfo() << "Stop recording";
        // m_recordingChart = nullptr;
        // m_recordIO = nullptr;
    }
    setRecStatus(false);   
}

void RecordingController::startSharedMemory(){
    connect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleSharedMemory);

    QAudioDeviceInfo deviceInfo = m_audioConfig->deviceInfo();
    m_format = m_audioConfig->format();
    m_chunkSize = calculateChunkSize(m_format, 2.0);
    sharedMemoryManager->setBufferSize(m_chunkSize);
    sharedMemoryManager->start();
    m_recordIO->startAudioInput(m_format, deviceInfo);
    qInfo() << "format before shm" << m_format;
}

void RecordingController::stopSharedMemory()
{
    disconnect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleSharedMemory);
    m_recordIO->audioInputStop();
    sharedMemoryManager->stop();
}

void RecordingController::handleDataReady(const QByteArray &data)
{
    QString duration = m_audioConfig->duration();
    processBuffer(data, [this, &duration](const QByteArray &chunk){
        if (duration == "2s") {
            if (m_audioFile) {
                QMetaObject::invokeMethod(m_audioFile, "writeAudioData",
                                          Qt::QueuedConnection,
                                          Q_ARG(QByteArray, chunk));
            }
        } else {
            if (m_audioFile) {
                QMetaObject::invokeMethod(m_audioFile, "writeDataForever",
                                          Qt::QueuedConnection,
                                          Q_ARG(QByteArray, chunk));
            }
        }
    });

    m_recordingChart->onSendChartData(data);
}

void RecordingController::handleSharedMemory(const QByteArray &data) {
    processBuffer(data, [this](const QByteArray &chunk){
        qDebug() << "Real-time SharedMemory - First 10 bytes: " << chunk.mid(0, 30);
        sharedMemoryManager->getAudioData(chunk);
    });
}


bool RecordingController::recStatus() /*const*/
{
    return m_recStatus;
}

void RecordingController::setRecStatus(bool newRecStatus)
{
    if (m_recStatus == newRecStatus)
        return;
    m_recStatus = newRecStatus;
    emit recStatusChanged();
}

size_t RecordingController::calculateChunkSize(const QAudioFormat &format, double durationSec)
{
    return static_cast<size_t>(format.sampleRate() * (format.sampleSize() / 8) *
                              format.channelCount() * durationSec);
}

void RecordingController::processBuffer(const QByteArray &data,
                                        const std::function<void(const QByteArray&)> &onChunkReady)
{
    QByteArray &activeBuffer = m_usingBuffer1 ? audioBuffer1 : audioBuffer2;
    activeBuffer.append(data);

    if (activeBuffer.size() >= static_cast<int>(m_chunkSize)) {
        QByteArray chunk = activeBuffer.left(m_chunkSize);
        activeBuffer.remove(0, m_chunkSize);
        m_usingBuffer1 = !m_usingBuffer1;
        onChunkReady(chunk);
    }
}
