// ConfigurationManager.cpp
#include "configurationmanager.h"
#include <QDebug>

ConfigurationManager::ConfigurationManager(QObject *parent) : QObject(parent),
    m_logPath("/home/haiminh/Desktop/rt_test_results"),
    m_manualThreshold(0.0026),
    m_sampleSize(16),
    m_second(2),
    m_channels(1),
    m_samplingRate(44100),
    m_importFile(false),
    m_modelPath("/home/haiminh/Desktop/ESCA_Qt/python_ai/result/saved_model/vq_vae"),
    m_folderPath("/home/haiminh/Desktop/ESCA_Qt/ESCA/data"),
    m_threshold(0.0),
    m_max(1.0),
    m_min(0.0)
{
    m_filePath = QStandardPaths::writableLocation(QStandardPaths::HomeLocation) + QDir::separator() + "config.json";
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
        m_logPath = realtimeConfig.value("LOG_PATH").toString("/default/log/path");
        m_manualThreshold = realtimeConfig.value("MANUAL_THRESHOLD").toDouble(0.01);
        m_sampleSize = realtimeConfig.value("SAMPLESIZE").toInt(16);
        m_second = realtimeConfig.value("SECOND").toInt(5);
        m_channels = realtimeConfig.value("CHANNELS").toInt(1);
        m_samplingRate = realtimeConfig.value("SAMPLING_RATE").toInt(44100);
        m_importFile = realtimeConfig.value("IMPORT_FILE").toBool(false);
        m_modelPath = realtimeConfig.value("MODEL_PATH").toString("/home/haiminh/Desktop/ESCA_Qt/python_ai/result");
        m_folderPath = realtimeConfig.value("FOLDER_PATH").toString("/home/haiminh/Desktop/ESCA_Qt/ESCA/data");

        qDebug() << "Đã cập nhật các tham số REALTIME từ file cấu hình.";
    } else {
        qWarning() << "Phần REALTIME không tồn tại trong file cấu hình. Sử dụng giá trị mặc định.";
        loadDefaults(); // Chỉ tải giá trị mặc định cho phần REALTIME
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

    rootObject["REALTIME"] = realtimeConfig; // Ghi đè hoặc thêm phần REALTIME

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

    return realtimeObj;
}

double ConfigurationManager::max() const
{
    return m_max;
}

void ConfigurationManager::setMax(double newMax)
{
    m_max = newMax;
}

double ConfigurationManager::min() const
{
    return m_min;
}

void ConfigurationManager::setMin(double newMin)
{
    m_min = newMin;
}

double ConfigurationManager::threshold() const
{
    return m_threshold;
}

void ConfigurationManager::setThreshold(double newThreshold)
{
    m_threshold = newThreshold;
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
