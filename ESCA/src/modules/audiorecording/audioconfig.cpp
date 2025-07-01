#include "audioconfig.h"
#include "../../common/storage/datastorage.h"
#include <QDir>

AudioConfig::AudioConfig(QObject *parent) : QObject{parent}
{
    appDataPath = DataStorage::filePath("config.json");
    qDebug()<< "Config File is exist!" << appDataPath;
    QFile configFile(appDataPath);

    m_listOutput = DataStorage::basePath();
    qDebug()<< "Home Location" << listOutput();

    if (!configFile.exists()) {
        qDebug()<< "Config File is not exist!";
    }

    if (configFile.open(QIODevice::ReadOnly)) {
        QByteArray data = configFile.readAll();
        QJsonDocument jsonDoc = QJsonDocument::fromJson(data);

        if (jsonDoc.isObject()) {
            QJsonObject json = jsonDoc.object();

            int rtSecond = 2.0;
            if (json.contains("REALTIME") && json["REALTIME"].isObject()) {
                QJsonObject rt = json["REALTIME"].toObject();
                rtSecond = rt.value("SECOND").toDouble(rtSecond);
            }
            if (!m_listDuration.isEmpty())
                m_listDuration[0] = QString::number(rtSecond) + "s";

            // Truy cập phần RECORD
            if (json.contains("RECORD") && json["RECORD"].isObject()) {
                QJsonObject record = json["RECORD"].toObject();

                qDebug()<<"RECORD"<< record;

                int savedDeviceIndex = record.value("DEVICE").toInt();  // Load saved device index
                QString savedDeviceName = record.value("DEVICENAME").toString("default");  // Load saved device name

                m_nearistParams.clear();
                m_nearistParams.append(savedDeviceIndex);
                m_nearistParams.append(record.value("CODEC").toInt());
                m_nearistParams.append(record.value("SAMPLERATE").toInt());
                m_nearistParams.append(record.value("CHANNEL").toInt());
                m_nearistParams.append(record.value("ENDIAN").toInt());
                m_nearistParams.append(record.value("SAMPLESIZE").toInt());
                m_nearistParams.append(record.value("DURATION").toInt());

                emit nearistParamsChanged();

                qInfo() << "Loaded m_nearistParams from RECORD:" << m_nearistParams;

                // Tải danh sách thiết bị đầu vào
                for (auto &deviceInfo : QAudioDeviceInfo::availableDevices(QAudio::AudioInput)) {
                    cpplistDevices.append(deviceInfo);
                    m_listDevices.append(deviceInfo.deviceName());
                }

                // Tải danh sách thiết bị đầu ra
                // for (auto &outputInfo : QAudioDeviceInfo::availableDevices(QAudio::AudioOutput)) {
                //     cpplistOutput.append(outputInfo);
                //     m_listOutput.append(outputInfo.deviceName());
                // }

                // Kiểm tra tính hợp lệ của thiết bị
                if (savedDeviceIndex >= 0 && savedDeviceIndex < cpplistDevices.size() &&
                    cpplistDevices[savedDeviceIndex].deviceName() == savedDeviceName) {
                    m_deviceInfo = cpplistDevices[savedDeviceIndex];
                } else {
                    // Nếu không tìm thấy thiết bị, tìm theo tên
                    bool found = false;
                    for (const auto &device : cpplistDevices) {
                        if (device.deviceName() == savedDeviceName) {
                            m_deviceInfo = device;
                            found = true;
                            break;
                        }
                    }
                    if (!found) {
                        m_deviceInfo = cpplistDevices.first();  // Mặc định chọn thiết bị đầu tiên
                    }
                }
            } else {
                qWarning() << "RECORD section not found in config.";
            }
        } else {
            qWarning() << "Invalid JSON format in config file.";
        }
        configFile.close();
    } else {
        qWarning() << "Failed to open configuration file.";
    }

    m_format.setCodec(m_deviceInfo.supportedCodecs().at(m_nearistParams[1]));
    m_format.setSampleRate(m_deviceInfo.supportedSampleRates().at(m_nearistParams[2]));
    m_format.setChannelCount(m_deviceInfo.supportedChannelCounts().at(m_nearistParams[3]));
    m_format.setByteOrder(m_deviceInfo.supportedByteOrders().at(m_nearistParams[4]));
    m_format.setSampleSize(m_deviceInfo.supportedSampleSizes().at(m_nearistParams[5]));
    m_format.setSampleType(QAudioFormat::SignedInt);

    setListDevices(m_listDevices);
    setListSampleRate(m_deviceInfo.supportedSampleRates());
    setListChannel(m_deviceInfo.supportedChannelCounts());
    setListCodecs(m_deviceInfo.supportedCodecs());
    setListEndianz(m_deviceInfo.supportedByteOrders());
    setListSampleSize(m_deviceInfo.supportedSampleSizes());

    connect(QGuiApplication::instance(), &QGuiApplication::aboutToQuit, this, &AudioConfig::saveSettings);  // lưu vào file json trước khi tắt app

    qInfo() << "Initialized m_nearistParams from settings:" << m_nearistParams << m_deviceInfo.supportedSampleSizes();
    qInfo() << "m_format: "<<m_format << m_format.sampleSize();
}

AudioConfig::~AudioConfig()
{
}

void AudioConfig::changeDevice(int idx)
{
    if (cpplistDevices.empty()) {
        qWarning() <<  "no device found";
        return;
    }

    m_deviceInfo = cpplistDevices[idx];
    m_nearistParams[0] = idx;  // Cập nhật index thiết bị

    setListCodecs(m_deviceInfo.supportedCodecs());
    if (!m_deviceInfo.supportedCodecs().empty()) {
        m_format.setCodec(m_deviceInfo.supportedCodecs().at(0));
    }

    setListSampleRate(m_deviceInfo.supportedSampleRates());
    if (!m_deviceInfo.supportedSampleRates().empty()) {
        m_format.setSampleRate(m_deviceInfo.supportedSampleRates().at(0));
    }

    setListChannel(m_deviceInfo.supportedChannelCounts());
    if (!m_deviceInfo.supportedChannelCounts().empty()) {
        m_format.setChannelCount(m_deviceInfo.supportedChannelCounts().at(0));
    }

    setListEndianz(m_deviceInfo.supportedByteOrders());
    if (!m_deviceInfo.supportedByteOrders().empty()) {
        m_format.setByteOrder(m_deviceInfo.supportedByteOrders().at(0));
    }

    setListSampleSize(m_deviceInfo.supportedSampleSizes());
    if (!m_deviceInfo.supportedSampleSizes().empty()) {
        m_format.setSampleSize(m_deviceInfo.supportedSampleSizes().at(0));
    }
}

QStringList AudioConfig::listDevices() const
{
    return m_listDevices;
}
void AudioConfig::setListDevices(const QStringList &newListDevices)
{
    if (m_listDevices == newListDevices)
        return;
    m_listDevices = newListDevices;
    emit listDevicesChanged();
}

QString AudioConfig::listOutput() const
{
    return m_listOutput;
}

void AudioConfig::setListOutput(const QString &newListOutput)
{
    QUrl fileUrl(newListOutput);
    if (fileUrl.isValid() && fileUrl.scheme() == "file") {
        QString path = fileUrl.toLocalFile();
        m_listOutput = path;
        qDebug()<<"setListOutput"+path;
    } else {
        m_listOutput = newListOutput;
        qDebug()<<"setListOutput"+newListOutput;
    }

    emit listOutputChanged();
}

QList<int> AudioConfig::listSampleRate() const
{
    return m_listSampleRate;
}
void AudioConfig::setListSampleRate(const QList<int> &newListSampleRate)
{
    if (m_listSampleRate == newListSampleRate)
        return;
    m_listSampleRate = newListSampleRate;
    emit listSampleRateChanged();
}

QList<int> AudioConfig::listChannel() const
{
    return m_listChannel;
}
void AudioConfig::setListChannel(const QList<int> &newListChannel)
{
    if (m_listChannel == newListChannel)
        return;
    m_listChannel = newListChannel;
    emit listChannelChanged();
}

QStringList AudioConfig::listCodecs() const
{
    return m_listCodecs;
}
void AudioConfig::setListCodecs(const QStringList &newListCodecs)
{
    if (m_listCodecs == newListCodecs)
        return;
    m_listCodecs = newListCodecs;
    emit listCodecsChanged();
}

QList<QAudioFormat::Endian> AudioConfig::listEndianz() const
{
    return m_listEndianz;
}

void AudioConfig::setListEndianz(const QList<QAudioFormat::Endian> &newListEndianz)
{
    if (m_listEndianz == newListEndianz)
        return;
    m_listEndianz = newListEndianz;
    emit listEndianzChanged();
}

QList<int> AudioConfig::listSampleSize() const
{
    return m_listSampleSize;
}

void AudioConfig::setListSampleSize(const QList<int> &newListSampleSize)
{
    if (m_listSampleSize == newListSampleSize)
        return;
    m_listSampleSize = newListSampleSize;
    emit listSampleSizeChanged();
}

QStringList AudioConfig::listDuration() const
{
    return m_listDuration;
}

void AudioConfig::saveConfig(int device, int codec, int sampleRate, int channel, int endian, int sampleSize, int duration, QString outputDir)
{
    m_nearistParams = {device, codec, sampleRate, channel, endian, sampleSize, duration};
    setListOutput(outputDir);

    qInfo()<< "save params qml: " << m_nearistParams;

    // int checkVar = 0;
    m_deviceInfo = cpplistDevices[device];
    m_format.setSampleRate(listSampleRate().at(sampleRate));
    m_format.setChannelCount(listChannel().at(channel));
    m_format.setByteOrder(listEndianz().at(endian));
    m_format.setSampleSize(listSampleSize().at(sampleSize));
    m_format.setSampleType(QAudioFormat::SignedInt);

    if (!m_deviceInfo.isFormatSupported(m_format)) {
        setSaveDone(false);

        qWarning() << "Default format not supported - use nearist format";
        m_format = m_deviceInfo.nearestFormat(m_format);

        m_nearistParams[1] = m_deviceInfo.supportedCodecs().indexOf(m_format.codec());
        m_nearistParams[2] = m_deviceInfo.supportedSampleRates().indexOf(m_format.sampleRate());
        m_nearistParams[3] = m_deviceInfo.supportedChannelCounts().indexOf(m_format.channelCount());
        m_nearistParams[4] = m_deviceInfo.supportedByteOrders().indexOf(m_format.byteOrder());
        m_nearistParams[5] = m_deviceInfo.supportedSampleSizes().indexOf(m_format.sampleSize());
        emit nearistParamsChanged();
    }
    qInfo()<< "save format Config qml: " << m_format;
    saveSettings();
}

QAudioDeviceInfo AudioConfig::deviceInfo()
{
    return m_deviceInfo;
}

QAudioFormat AudioConfig::format()
{
    m_format.setCodec(m_deviceInfo.supportedCodecs().at(m_nearistParams[1]));
    m_format.setSampleRate(m_deviceInfo.supportedSampleRates().at(m_nearistParams[2]));
    m_format.setChannelCount(m_deviceInfo.supportedChannelCounts().at(m_nearistParams[3]));
    m_format.setByteOrder(m_deviceInfo.supportedByteOrders().at(m_nearistParams[4]));
    m_format.setSampleSize(m_deviceInfo.supportedSampleSizes().at(m_nearistParams[5]));
    m_format.setSampleType(QAudioFormat::SignedInt);
    return m_format;
}

QString AudioConfig::duration()
{
    return listDuration().at(m_nearistParams[6]);
}

QList<int> AudioConfig::nearistParams()
{
    return m_nearistParams;
}

bool AudioConfig::saveDone()
{
    return m_saveDone;
}

void AudioConfig::setSaveDone(bool newSaveDone)
{
    if (m_saveDone == newSaveDone)
        return;
    m_saveDone = newSaveDone;
    emit saveDoneChanged();
}

void AudioConfig::saveSettings()
{
    QFile configFile(appDataPath);
    QJsonDocument jsonDoc;
    QJsonObject root;

    // Đọc nội dung file JSON hiện tại (nếu có)
    if (configFile.open(QIODevice::ReadOnly)) {
        QByteArray data = configFile.readAll();
        jsonDoc = QJsonDocument::fromJson(data);
        root = jsonDoc.object(); // Lấy root object
        configFile.close();
    }

    // Cập nhật hoặc thêm mới phần RECORD
    QJsonObject recordConfig = root.value("RECORD").toObject();
    recordConfig["DEVICE"] = m_nearistParams[0];
    recordConfig["CODEC"] = m_nearistParams[1];
    recordConfig["SAMPLERATE"] = m_nearistParams[2];
    recordConfig["CHANNEL"] = m_nearistParams[3];
    recordConfig["ENDIAN"] = m_nearistParams[4];
    recordConfig["SAMPLESIZE"] = m_nearistParams[5];
    recordConfig["DURATION"] = m_nearistParams[6];
    recordConfig["DEVICENAME"] = m_deviceInfo.deviceName();

    // Chỉ ghi đè phần RECORD
    root["RECORD"] = recordConfig;

    // Ghi lại file JSON với nội dung đã cập nhật
    jsonDoc.setObject(root);
    if (configFile.open(QIODevice::WriteOnly)) {
        configFile.write(jsonDoc.toJson(QJsonDocument::Indented)); // Lưu với định dạng đẹp
        configFile.close();
        qInfo() << "Settings saved successfully. Updated RECORD section.";
    } else {
        qWarning() << "Failed to open config file for saving.";
    }
}

QStringList AudioConfig::listSampleRateStr() const
{
    // return m_listSampleRateStr;
    QStringList result;
    for (int rate : m_listSampleRate) {
        result.append(QString::number(rate));
    }
    return result;
}

QStringList AudioConfig::listChannelStr() const
{
    // return m_listChannelStr;
    QStringList result;
    for (int channel : m_listChannel) {
        result.append(QString::number(channel));
    }
    return result;
}

QStringList AudioConfig::listEndianzStr() const
{
    QStringList result;
    for (QAudioFormat::Endian endian : m_listEndianz) {
        result.append(endian == QAudioFormat::BigEndian ? "BigEndian" : "LittleEndian");
    }
    return result;
}

QStringList AudioConfig::listSampleSizeStr() const
{
    QStringList result;
    for (int size : m_listSampleSize) {
        result.append(QString::number(size));
    }
    return result;
}
