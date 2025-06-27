#include "recordingcontroller.h"
#include "../aiprocess/latencytracker.h"
#include <QDebug>
#include <memory>
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include "../../common/storage/datastorage.h"

RecordingController::RecordingController(QObject *parent)
    : QObject(parent)
    , m_recordIO(new RecordIO(this))
    , m_recordingChart(nullptr)
    , m_audioConfig(new AudioConfig(this))
    , m_audioFile(nullptr)
    , m_audioFileThread(nullptr)
    , m_format(m_audioConfig->format())
    , m_recStatus(false)
    , m_chunkSize(0)
    , sharedMemoryManager(nullptr)
{
    qmlRegisterSingletonInstance("AudioChartImport", 1, 0, "AudioChart", m_recordingChart);
    qmlRegisterSingletonInstance("AudioConfigImport", 1, 0, "AudioConfig", m_audioConfig);
    setRecStatus(false);

    // m_outputDir = QStandardPaths::writableLocation(QStandardPaths::HomeLocation);

    qInfo() << "format in ini: " << m_audioConfig->format();

    QFile cfg(DataStorage::filePath("config.json"));
    int sr = 44100, ch = 1, ss = 16, sec = 2;
    if (cfg.open(QIODevice::ReadOnly)) {
        QJsonDocument doc = QJsonDocument::fromJson(cfg.readAll());
        QJsonObject rt = doc.object().value("REALTIME").toObject();
        sr  = rt.value("SAMPLING_RATE").toInt(sr);
        ch  = rt.value("CHANNELS").toInt(ch);
        ss  = rt.value("SAMPLESIZE").toInt(ss);
        sec = rt.value("SECOND").toInt(sec);
    }
    m_durationSec = sec;
    m_chunkSize = sr * ch * (ss / 8) * m_durationSec;
    size_t chartSamples = m_chunkSize / (ss / 8);
    m_recordingChart = new RecordingChart(chartSamples, this);
    qmlRegisterSingletonInstance("AudioChartImport", 1, 0, "AudioChart", m_recordingChart);

    sharedMemoryManager = new SharedMemoryManager(m_chunkSize, this);


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
    m_audioFile.reset();
    m_audioFileThread.reset();
    delete sharedMemoryManager;
    sharedMemoryManager = nullptr;
    qDebug() << "RecordingController destroyed.";
}

void RecordingController::startRecording()
{
    connect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleDataReady);
    m_format = m_audioConfig->format();
    //qDebug()<< "format"<< m_format;
        
    m_chunkSize = computeChunkSize();
    sharedMemoryManager->setSharedMemorySize(m_chunkSize);

    QAudioDeviceInfo deviceInfo = m_audioConfig->deviceInfo();
    m_outputDir = m_audioConfig->listOutput();
    qDebug()<< "m_outputDir"<< m_outputDir;

    //m_audioFile = new AudioFile(m_outputDir, m_format, 2.0);

    m_audioFile = std::make_unique<AudioFile>(m_outputDir, m_format,
                                              static_cast<double>(m_durationSec));

    // Đảm bảo thread chưa chạy thì start lại
    if (!m_audioFileThread) {
        //m_audioFileThread = new QThread();
        m_audioFileThread = std::make_unique<QThread>();
    } else if (m_audioFileThread->isRunning()) {
        m_audioFileThread->quit();
        m_audioFileThread->wait();
    }

    m_recordIO->startAudioInput(m_format, deviceInfo);
    //qInfo() << "format before thread" << m_format;

    m_audioFile->moveToThread(m_audioFileThread.get()); // cho AudioFile vào thread riêng

    // Kết nối các signal và slot để quản lý thread và AudioFile
    connect(m_audioFileThread.get(), &QThread::started, m_audioFile.get(), &AudioFile::startRecording);
    connect(m_audioFile.get(), &AudioFile::destroyed, m_audioFileThread.get(), &QThread::quit);
    connect(m_audioFile.get(), &AudioFile::destroyed, m_audioFileThread.get(), &QObject::deleteLater);

    // Start thread
    m_audioFileThread->start();

    setRecStatus(true);
   // qInfo() << "Start recording with format" << m_format;

    // qDebug() << "Producer Record is running.";
}

void RecordingController::stopRecording()
{
    if (m_recordIO)
        disconnect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleDataReady);
    if (recStatus() == true) {
        if (m_audioFile) {
            m_audioFile->stopRecording();
        }
        m_recordIO->audioInputStop();
        if (m_audioFileThread && m_audioFileThread->isRunning()) {
            m_audioFileThread->quit();
            m_audioFileThread->wait();
        }
        m_audioFile.reset();
        m_audioFileThread.reset();
        qInfo() << "Stop recording";
    }
    setRecStatus(false);   
}

void RecordingController::startSharedMemory(){
    connect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleSharedMemory);

    QAudioDeviceInfo deviceInfo = m_audioConfig->deviceInfo();
    
    m_chunkSize = computeChunkSize();
    qInfo() << "chunksize now before SHM" << m_chunkSize;
    sharedMemoryManager->setSharedMemorySize(m_chunkSize);
    
    sharedMemoryManager->start();
    m_recordIO->startAudioInput(m_format, deviceInfo);
    //qInfo() << "format before shm" << m_format;
}

void RecordingController::stopSharedMemory()
{
    if (m_recordIO)
        disconnect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleSharedMemory);
    m_recordIO->audioInputStop();
    sharedMemoryManager->stop();
    sharedMemoryManager->wait();
}

void RecordingController::handleDataReady(const QByteArray &data)
{
    QString duration = m_audioConfig->duration();
    // static QDateTime lastSwapTime = QDateTime::currentDateTime();
    QByteArray &activeBuffer = m_usingBuffer1 ? audioBuffer1 : audioBuffer2;

    activeBuffer.append(data);

    // Log kích thước buffer và thời gian
    // qDebug() << "handleDataReady() at" << QDateTime::currentDateTime().toString("hh:mm:ss.zzz")
    //          << "buffer size:" << activeBuffer.size();

    if (activeBuffer.size() >= static_cast<int>(m_chunkSize)) {
        QByteArray dataToSend = activeBuffer.left(m_chunkSize);
        activeBuffer.remove(0, m_chunkSize);

        // Swap buffer
        m_usingBuffer1 = !m_usingBuffer1;

        // lastSwapTime = swapStartTime;

        // qDebug() << "Real-time data - First 10 bytes: " << dataToSend.mid(0, 10);
        // QDateTime swapStartTime = QDateTime::currentDateTime();
        // qDebug() << "🔄 Buffer Swap! Ready to send shared memory at:" << swapStartTime.toString("hh:mm:ss.zzz");

        // sharedMemoryManager->getAudioData(dataToSend);
        // qDebug() << "✅ Writing to shared memory completed at:" << QDateTime::currentDateTime().toString("hh:mm:ss.zzz");

        if (duration == "2s"){
            // Chuyển tiếp dữ liệu cho AudioFile để xử lý buffering và ghi file

            if (m_audioFile) {
                QMetaObject::invokeMethod(m_audioFile.get(), "writeAudioData",
                                          Qt::QueuedConnection,
                                          Q_ARG(QByteArray, dataToSend));
            }
        }
        else {
            if (m_audioFile) {
                QMetaObject::invokeMethod(m_audioFile.get(), "writeDataForever",
                                          Qt::QueuedConnection,
                                          Q_ARG(QByteArray, dataToSend));
            }
        }
    }

    m_recordingChart->onSendChartData(data);
}

void RecordingController::handleSharedMemory(const QByteArray &data) {
    QString duration = m_audioConfig->duration();
    // static QDateTime lastSwapTime = QDateTime::currentDateTime();
    QByteArray &activeBuffer = m_usingBuffer1 ? audioBuffer1 : audioBuffer2;

    activeBuffer.append(data);

    if (activeBuffer.size() >= static_cast<int>(m_chunkSize)) {

        LatencyTracker::chunkStarted();

        QByteArray dataToSend = activeBuffer.left(m_chunkSize);
        activeBuffer.remove(0, m_chunkSize);
        //qDebug() << "Real-time SharedMemory - First 10 bytes: " << dataToSend.mid(0, 30);
        m_usingBuffer1 = !m_usingBuffer1;
        
        
        LatencyTracker::bufferSent();
        
        sharedMemoryManager->getAudioData(dataToSend);
    }
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


size_t RecordingController::computeChunkSize() const
{
    QAudioFormat fmt = m_audioConfig->format();
    QString durStr = m_audioConfig->duration();
    bool ok = false;
    double durationSec = durStr.remove('s').toDouble(&ok);
    if (!ok || durationSec <= 0)
        durationSec = 2.0;

    size_t bytesPerSample = static_cast<size_t>(fmt.sampleSize() / 8);
    return static_cast<size_t>(fmt.sampleRate() * bytesPerSample * fmt.channelCount() * durationSec);
}
