// ConfigurationManager.cpp
#include "configurationmanager.h"
#include "../../common/storage/datastorage.h"
#include <QDebug>

ConfigurationManager::ConfigurationManager(QObject *parent) : QObject(parent),
    m_logPath("/home/sparclab/Desktop/Test_ESCA/data_storage"),
    m_manualThreshold(0.0026),
    m_sampleSize(16),
    m_second(2),
    m_channels(1),
    m_samplingRate(44100),
    m_importFile(false),
    m_modelPath(""),
    m_folderPath(""),
    m_threshold(0.0),
    m_max(1.0),
    m_min(0.0),
    m_useTensorRT(false),
    m_trtModelPath(""),
    m_gfccChannels(32),
    m_gfccFMin(100.0),
    m_gfccWindowTime(0.12),
    m_gfccHopTime(0.06)
{
    m_filePath = DataStorage::filePath("config.json");
}

ConfigurationManager::~ConfigurationManager()
{
}

void ConfigurationManager::loadMetricsDetails() {
    QFile file(m_modelPath+"/save_parameter/metrics_detail.json");
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Không thể mở file metrics_details.json:" << m_modelPath+"/save_parameter/metrics_detail.json";
        return;
    }

    QByteArray data = file.readAll();
    file.close();

    QJsonDocument doc = QJsonDocument::fromJson(data);
    if (doc.isNull() || !doc.isObject()) {
        qWarning() << "File metrics_details.json không hợp lệ.";
        return;
    }

    QJsonObject jsonObj = doc.object();

    if (jsonObj.contains("threshold") && jsonObj["threshold"].isDouble()) {
        setThreshold(jsonObj["threshold"].toDouble());
    }
    if (jsonObj.contains("max") && jsonObj["max"].isDouble()) {
        setMax(jsonObj["max"].toDouble());
    }
    if (jsonObj.contains("min") && jsonObj["min"].isDouble()) {
        setMin(jsonObj["min"].toDouble());
    }

    qDebug() << "Đã cập nhật threshold:" << m_threshold;
    qDebug() << "Đã cập nhật max:" << m_max;
    qDebug() << "Đã cập nhật min:" << m_min;
}

bool ConfigurationManager::loadConfig() {
    QFile file(m_filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Không thể mở file cấu hình:" << m_filePath;
        loadDefaults(); // Sử dụng giá trị mặc định nếu không mở được file
        return false;
    }

    QByteArray data = file.readAll();
    QJsonDocument doc = QJsonDocument::fromJson(data);
    if (doc.isNull() || !doc.isObject()) {
        qWarning() << "File cấu hình không hợp lệ (không phải JSON object).";
        loadDefaults(); // Sử dụng giá trị mặc định nếu file JSON không hợp lệ
        return false;
    }

    // Lưu toàn bộ cấu hình
    QJsonObject m_fullConfig = doc.object();

    // Kiểm tra và cập nhật các tham số trong phần REALTIME
    if (m_fullConfig.contains("REALTIME") && m_fullConfig["REALTIME"].isObject()) {
        QJsonObject realtimeConfig = m_fullConfig["REALTIME"].toObject();

        // Cập nhật từng tham số (nếu thiếu thì bổ sung mặc định)
        m_logPath = realtimeConfig.value("LOG_PATH").toString("/home/sparclab/Desktop/Test_ESCA/data_storage");
        m_manualThreshold = realtimeConfig.value("MANUAL_THRESHOLD").toDouble(0.01);
        m_sampleSize = realtimeConfig.value("SAMPLESIZE").toInt(16);
        m_second = realtimeConfig.value("SECOND").toInt(5);
        m_channels = realtimeConfig.value("CHANNELS").toInt(1);
        m_samplingRate = realtimeConfig.value("SAMPLING_RATE").toInt(44100);
        m_importFile = realtimeConfig.value("IMPORT_FILE").toBool(false);

        m_modelPath = realtimeConfig.value("MODEL_PATH").toString("/home/haiminh/Desktop/ESCA_Qt/python_ai/result");
        m_folderPath = realtimeConfig.value("FOLDER_PATH").toString("/home/haiminh/Desktop/ESCA_Qt/ESCA/data");
        m_threshold = realtimeConfig.value("THRESHOLD").toDouble(m_threshold);
        m_max = realtimeConfig.value("MAX").toDouble(m_max);
        m_min = realtimeConfig.value("MIN").toDouble(m_min);
      
        m_trtModelPath = realtimeConfig.value("TRT_MODEL_PATH").toString(m_trtModelPath);

        qDebug() << "Đã cập nhật các tham số REALTIME từ file cấu hình.";
    } else {
        qWarning() << "Phần REALTIME không tồn tại trong file cấu hình. Sử dụng giá trị mặc định.";
        loadDefaults(); // Chỉ tải giá trị mặc định cho phần REALTIME
    }

    if (m_fullConfig.contains("DEVICE") && m_fullConfig["DEVICE"].isObject()) {
        QJsonObject deviceObj = m_fullConfig["DEVICE"].toObject();
        m_useTensorRT = deviceObj.value("USE_TENSORRT").toBool(m_useTensorRT);
    }

    if (m_fullConfig.contains("PREPROCESS") && m_fullConfig["PREPROCESS"].isObject()) {
        QJsonObject preprocessObj = m_fullConfig["PREPROCESS"].toObject();
        if (preprocessObj.contains("GAMMA") && preprocessObj["GAMMA"].isObject()) {
            QJsonObject gamma = preprocessObj["GAMMA"].toObject();
            m_gfccChannels = gamma.value("CHANNELS").toInt(m_gfccChannels);
            m_gfccFMin = gamma.value("F_MIN").toDouble(m_gfccFMin);
            m_gfccHopTime = gamma.value("HOP_TIME").toDouble(m_gfccHopTime);
            m_gfccWindowTime = gamma.value("WINDOW_TIME").toDouble(m_gfccWindowTime);
        }
    }

    loadMetricsDetails();
    return true;
}

bool ConfigurationManager::saveConfig() const {
    QFile file(m_filePath);
    QJsonObject rootObject;
    if (file.exists()) {
        if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
            qWarning() << "Không thể mở file cấu hình để đọc:" << m_filePath;
            return false;
        }

        QByteArray data = file.readAll();
        QJsonDocument doc = QJsonDocument::fromJson(data);

        if (!doc.isNull() && doc.isObject()) {
            rootObject = doc.object();
        }

        file.close();
    }

    // Cập nhật phần REALTIME
    QJsonObject realtimeConfig;
    realtimeConfig["LOG_PATH"] = m_logPath;
    realtimeConfig["MANUAL_THRESHOLD"] = m_manualThreshold;
    realtimeConfig["SAMPLESIZE"] = m_sampleSize;
    realtimeConfig["SECOND"] = m_second;
    realtimeConfig["CHANNELS"] = m_channels;
    realtimeConfig["SAMPLING_RATE"] = m_samplingRate;
    realtimeConfig["IMPORT_FILE"] = m_importFile;
    realtimeConfig["MODEL_PATH"] = m_modelPath;
    realtimeConfig["FOLDER_PATH"] = m_folderPath;

    realtimeConfig["THRESHOLD"] = m_threshold;
    realtimeConfig["MAX"] = m_max;
    realtimeConfig["MIN"] = m_min;

    realtimeConfig["TRT_MODEL_PATH"] = m_trtModelPath;

    rootObject["REALTIME"] = realtimeConfig; // Ghi đè hoặc thêm phần REALTIME

    QJsonObject deviceObj = rootObject.value("DEVICE").toObject();
    deviceObj["USE_TENSORRT"] = m_useTensorRT;
    rootObject["DEVICE"] = deviceObj;

    QJsonObject preprocessObj = rootObject.value("PREPROCESS").toObject();
    QJsonObject gammaObj = preprocessObj.value("GAMMA").toObject();
    gammaObj["CHANNELS"] = m_gfccChannels;
    gammaObj["F_MIN"] = m_gfccFMin;
    gammaObj["WINDOW_TIME"] = m_gfccWindowTime;
    gammaObj["HOP_TIME"] = m_gfccHopTime;
    preprocessObj["GAMMA"] = gammaObj;
    rootObject["PREPROCESS"] = preprocessObj;

    // Ghi lại file JSON
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qWarning() << "Không thể mở file cấu hình để ghi:" << m_filePath;
        return false;
    }

    QJsonDocument doc(rootObject);
    file.write(doc.toJson());
    file.close();
    qDebug() << "Đã lưu cấu hình đầy đủ thành công.";
    return true;
}

// Getters
QString ConfigurationManager::logPath() const { return m_logPath; }
double ConfigurationManager::manualThreshold() const { return m_manualThreshold; }
int ConfigurationManager::second() const { return m_second; }
int ConfigurationManager::channels() const { return m_channels; }
int ConfigurationManager::samplingRate() const { return m_samplingRate; }
bool ConfigurationManager::importFile() const { return m_importFile; }

// Setters

void ConfigurationManager::setLogPath(const QString &logPath)
{
    if (m_logPath != logPath) {
        m_logPath = logPath;
        emit logPathChanged();
    }
}

void ConfigurationManager::setManualThreshold(double manualThreshold)
{
    if (m_manualThreshold != manualThreshold) {
        m_manualThreshold = manualThreshold;
        emit manualThresholdChanged();
    }
}

void ConfigurationManager::setSecond(int second)
{
    if (m_second != second) {
        m_second = second;
        emit secondChanged();
    }
}

void ConfigurationManager::setChannels(int channels)
{
    if (m_channels != channels) {
        m_channels = channels;
        emit channelsChanged();
    }
}

void ConfigurationManager::setSamplingRate(int samplingRate)
{
    if (m_samplingRate != samplingRate) {
        m_samplingRate = samplingRate;
        emit samplingRateChanged();
    }
}

void ConfigurationManager::setImportFile(bool importFile)
{
    if (m_importFile != importFile) {
        m_importFile = importFile;
        emit importFileChanged();
    }
}

QString ConfigurationManager::modelPath() const
{
    return m_modelPath;
}

void ConfigurationManager::setModelPath(const QString &newModelPath)
{
    // if (m_modelPath == newModelPath)
    //     return;
    // m_modelPath = newModelPath;
    // emit modelPathChanged();

    QUrl fileUrl(newModelPath);
    if (fileUrl.isValid() && fileUrl.scheme() == "file") {
        QString path = fileUrl.toLocalFile();
        m_modelPath = path;
        qDebug()<<"setListOutput"+path;
    } else {
        m_modelPath = newModelPath;
        qDebug()<<"setListOutput"+newModelPath;
    }

    emit modelPathChanged();
}

void ConfigurationManager::loadDefaults()
{
    // Giá trị mặc định đã được khởi tạo trong constructor
    qDebug() << "Đã tải các giá trị mặc định cho REALTIME.";
}

void ConfigurationManager::applyConfig(const QJsonObject& realtime)
{
    if (realtime.contains("LOG_PATH") && realtime["LOG_PATH"].isString()) {
        setLogPath(realtime["LOG_PATH"].toString());
    }

    if (realtime.contains("MANUAL_THRESHOLD") && realtime["MANUAL_THRESHOLD"].isDouble()) {
        setManualThreshold(realtime["MANUAL_THRESHOLD"].toDouble());
    }

    if (realtime.contains("SAMPLESIZE") && realtime["SAMPLESIZE"].isDouble()) {
        setSampleSize(realtime["SAMPLESIZE"].toInt());
    }

    if (realtime.contains("SECOND") && realtime["SECOND"].isDouble()) {
        setSecond(realtime["SECOND"].toInt());
    }

    if (realtime.contains("CHANNELS") && realtime["CHANNELS"].isDouble()) {
        setChannels(realtime["CHANNELS"].toInt());
    }

    if (realtime.contains("SAMPLING_RATE") && realtime["SAMPLING_RATE"].isDouble()) {
        setSamplingRate(realtime["SAMPLING_RATE"].toInt());
    }

    if (realtime.contains("IMPORT_FILE") && realtime["IMPORT_FILE"].isBool()) {
        setImportFile(realtime["IMPORT_FILE"].toBool());
    }
    if (realtime.contains("MODEL_PATH") && realtime["MODEL_PATH"].isString()) {
        setModelPath(realtime["MODEL_PATH"].toString());
    }
    if (realtime.contains("FOLDER_PATH") && realtime["FOLDER_PATH"].isString()) {
        setFolderPath(realtime["FOLDER_PATH"].toString());
    }

    if (realtime.contains("THRESHOLD") && realtime["THRESHOLD"].isDouble()) {
        setThreshold(realtime["THRESHOLD"].toDouble());
    }
    if (realtime.contains("MAX") && realtime["MAX"].isDouble()) {
        setMax(realtime["MAX"].toDouble());
    }
    if (realtime.contains("MIN") && realtime["MIN"].isDouble()) {
        setMin(realtime["MIN"].toDouble());
    }
    if (realtime.contains("TRT_MODEL_PATH") && realtime["TRT_MODEL_PATH"].isString()) {
        setTrtModelPath(realtime["TRT_MODEL_PATH"].toString());
    }
    if (realtime.contains("USE_TENSORRT") && realtime["USE_TENSORRT"].isBool()) {
        setUseTensorRT(realtime["USE_TENSORRT"].toBool());
    }
    if (realtime.contains("GFCC_CHANNELS") && realtime["GFCC_CHANNELS"].isDouble()) {
        setGfccChannels(realtime["GFCC_CHANNELS"].toInt());
    }
    if (realtime.contains("GFCC_F_MIN") && realtime["GFCC_F_MIN"].isDouble()) {
        setGfccFMin(realtime["GFCC_F_MIN"].toDouble());
    }
    if (realtime.contains("GFCC_WINDOW_TIME") && realtime["GFCC_WINDOW_TIME"].isDouble()) {
        setGfccWindowTime(realtime["GFCC_WINDOW_TIME"].toDouble());
    }
    if (realtime.contains("GFCC_HOP_TIME") && realtime["GFCC_HOP_TIME"].isDouble()) {
        setGfccHopTime(realtime["GFCC_HOP_TIME"].toDouble());
    }
}

QJsonObject ConfigurationManager::generateConfig() const
{
    QJsonObject realtimeObj;
    realtimeObj["LOG_PATH"] = m_logPath;
    realtimeObj["MANUAL_THRESHOLD"] = m_manualThreshold;
    realtimeObj["SAMPLESIZE"] = m_sampleSize;
    realtimeObj["SECOND"] = m_second;
    realtimeObj["CHANNELS"] = m_channels;
    realtimeObj["SAMPLING_RATE"] = m_samplingRate;
    realtimeObj["IMPORT_FILE"] = m_importFile;
    realtimeObj["MODEL_PATH"] = m_modelPath;
    realtimeObj["FOLDER_PATH"] = m_folderPath;
    realtimeObj["THRESHOLD"] = m_threshold;
    realtimeObj["MAX"] = m_max;
    realtimeObj["MIN"] = m_min;
    realtimeObj["TRT_MODEL_PATH"] = m_trtModelPath;
    realtimeObj["USE_TENSORRT"] = m_useTensorRT;
    realtimeObj["GFCC_CHANNELS"] = m_gfccChannels;
    realtimeObj["GFCC_F_MIN"] = m_gfccFMin;
    realtimeObj["GFCC_WINDOW_TIME"] = m_gfccWindowTime;
    realtimeObj["GFCC_HOP_TIME"] = m_gfccHopTime;

    return realtimeObj;
}

double ConfigurationManager::max() const
{
    return m_max;
}

void ConfigurationManager::setMax(double newMax)
{
    if (m_max != newMax) {
        m_max = newMax;
        emit maxChanged();
    }
}

double ConfigurationManager::min() const
{
    return m_min;
}

void ConfigurationManager::setMin(double newMin)
{
    if (m_min != newMin) {
        m_min = newMin;
        emit minChanged();
    }
}

double ConfigurationManager::threshold() const
{
    return m_threshold;
}

void ConfigurationManager::setThreshold(double newThreshold)
{
    if (m_threshold != newThreshold) {
        m_threshold = newThreshold;
        emit thresholdChanged();
    }
}

QString ConfigurationManager::folderPath() const
{
    return m_folderPath;
}

void ConfigurationManager::setFolderPath(const QString &newFolderPath)
{
    if (m_folderPath == newFolderPath)
        return;
    m_folderPath = newFolderPath;
    emit folderPathChanged();

    QUrl fileUrl(newFolderPath);
    if (fileUrl.isValid() && fileUrl.scheme() == "file") {
        QString path = fileUrl.toLocalFile();
        m_folderPath = path;
        qDebug()<<"setListOutput"+path;
    } else {
        m_folderPath = newFolderPath;
        qDebug()<<"setListOutput"+newFolderPath;
    }

    emit modelPathChanged();
}

int ConfigurationManager::sampleSize() const
{
    return m_sampleSize;
}

void ConfigurationManager::setSampleSize(int newSampleSize)
{
    if (m_sampleSize == newSampleSize)
        return;
    m_sampleSize = newSampleSize;
    emit sampleSizeChanged();
}

bool ConfigurationManager::useTensorRT() const { return m_useTensorRT; }

void ConfigurationManager::setUseTensorRT(bool newUseTensorRT)
{
    if (m_useTensorRT != newUseTensorRT) {
        m_useTensorRT = newUseTensorRT;
        emit useTensorRTChanged();
    }
}

QString ConfigurationManager::trtModelPath() const { return m_trtModelPath; }

void ConfigurationManager::setTrtModelPath(const QString &newTrtModelPath)
{
    if (m_trtModelPath != newTrtModelPath) {
        m_trtModelPath = newTrtModelPath;
        emit trtModelPathChanged();
    }
}

int ConfigurationManager::gfccChannels() const { return m_gfccChannels; }

void ConfigurationManager::setGfccChannels(int newChannels)
{
    if (m_gfccChannels != newChannels) {
        m_gfccChannels = newChannels;
        emit gfccChannelsChanged();
    }
}

double ConfigurationManager::gfccFMin() const { return m_gfccFMin; }

void ConfigurationManager::setGfccFMin(double newFMin)
{
    if (!qFuzzyCompare(m_gfccFMin, newFMin)) {
        m_gfccFMin = newFMin;
        emit gfccFMinChanged();
    }
}

double ConfigurationManager::gfccWindowTime() const { return m_gfccWindowTime; }

void ConfigurationManager::setGfccWindowTime(double newWindow)
{
    if (!qFuzzyCompare(m_gfccWindowTime, newWindow)) {
        m_gfccWindowTime = newWindow;
        emit gfccWindowTimeChanged();
    }
}

double ConfigurationManager::gfccHopTime() const { return m_gfccHopTime; }

void ConfigurationManager::setGfccHopTime(double newHop)
{
    if (!qFuzzyCompare(m_gfccHopTime, newHop)) {
        m_gfccHopTime = newHop;
        emit gfccHopTimeChanged();
    }
}
