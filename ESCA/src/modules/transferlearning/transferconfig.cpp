#include "transferconfig.h"
#include "../../common/storage/datastorage.h"

TransferConfig::TransferConfig(QObject *parent)
    : QObject(parent),
    m_baseWeightPath(""),
    m_tfrecordUsedPath(""),
    m_tfrecordNewPath(""),
    m_savePath(""),
    m_batchSize(0),
    m_learningRate(0.0),
    m_epoch(81),
    m_beta(0.0)
{
    m_filePath = DataStorage::filePath("config.json");
}

QString TransferConfig::baseWeightPath() const { return m_baseWeightPath; }

void TransferConfig::setBaseWeightPath(const QString &newPath) {
    QUrl fileUrl(newPath);
    if (fileUrl.isValid() && fileUrl.scheme() == "file") {
        QString path = fileUrl.toLocalFile();
        m_baseWeightPath = path;
        qDebug()<<"setListOutput"+path;
    } else {
        m_baseWeightPath = newPath;
        qDebug()<<"setListOutput"+newPath;
    }
    emit baseWeightPathChanged();
}

QString TransferConfig::tfrecordUsedPath() const { return m_tfrecordUsedPath; }

void TransferConfig::setTfrecordUsedPath(const QString &newPath) {
    QUrl fileUrl(newPath);
    if (fileUrl.isValid() && fileUrl.scheme() == "file") {
        QString path = fileUrl.toLocalFile();
        m_tfrecordUsedPath = path;
        qDebug()<<"setListOutput"+path;
    } else {
        m_tfrecordUsedPath = newPath;
        qDebug()<<"setListOutput"+newPath;
    }
    emit tfrecordUsedPathChanged();
}

QString TransferConfig::tfrecordNewPath() const { return m_tfrecordNewPath; }
void TransferConfig::setTfrecordNewPath(const QString &newPath) {
    QUrl fileUrl(newPath);
    if (fileUrl.isValid() && fileUrl.scheme() == "file") {
        QString path = fileUrl.toLocalFile();
        m_tfrecordNewPath = path;
        qDebug()<<"setListOutput"+path;
    } else {
        m_tfrecordNewPath = newPath;
        qDebug()<<"setListOutput"+newPath;
    }
    emit tfrecordNewPathChanged();
}

QString TransferConfig::savePath() const { return m_savePath; }
void TransferConfig::setSavePath(const QString &newPath) {
    QUrl fileUrl(newPath);
    if (fileUrl.isValid() && fileUrl.scheme() == "file") {
        QString path = fileUrl.toLocalFile();
        m_savePath = path;
        qDebug()<<"setListOutput"+path;
    } else {
        m_savePath = newPath;
        qDebug()<<"setListOutput"+newPath;
    }
    emit savePathChanged();
}

int TransferConfig::batchSize() const { return m_batchSize; }
void TransferConfig::setBatchSize(int size) { m_batchSize = size; emit batchSizeChanged(); }

double TransferConfig::learningRate() const { return m_learningRate; }
void TransferConfig::setLearningRate(double rate) { m_learningRate = rate; emit learningRateChanged(); }

int TransferConfig::epoch() const { return m_epoch; }
void TransferConfig::setEpoch(int epoch) { m_epoch = epoch; emit epochChanged(); }

double TransferConfig::beta() const { return m_beta; }
void TransferConfig::setBeta(double beta) { m_beta = beta; emit betaChanged(); }

bool TransferConfig::loadConfig() {
    QFile file(m_filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Không thể mở file để đọc:" << m_filePath;
        loadDefaults();
        return false;
    }

    QByteArray data = file.readAll();
    QJsonDocument doc = QJsonDocument::fromJson(data);
    if (doc.isNull() || !doc.isObject()) {
        qWarning() << "File không hợp lệ.";
        loadDefaults();
        return false;
    }

    QJsonObject rootObject = doc.object();

    // Cập nhật các trường từ TRANSFER_LEARNING
    if (rootObject.contains("TRANSFER_LEARNING") && rootObject["TRANSFER_LEARNING"].isObject()) {
        QJsonObject transferLearning = rootObject["TRANSFER_LEARNING"].toObject();

        setBaseWeightPath(transferLearning.value("BASED_WEIGHTS").toString("/home/haiminh/Desktop/D-ESCA_v2/Results/base_training_result/saved_model/vq_vae"));
        setTfrecordNewPath(transferLearning.value("TFRECORDS").toArray().at(0).toString("/home/haiminh/Desktop/D-ESCA_v2/data/target/Target25"));
        setSavePath(transferLearning.value("SAVE_PATH").toString("/home/haiminh/Desktop/D-ESCA_v2/Results/tl-training_results/Target3"));
        setBatchSize(transferLearning.value("ANOM_BATCH_SIZE").toInt(128));
        setLearningRate(transferLearning.value("LEARNING_RATE").toDouble(0.001));
        setEpoch(transferLearning.value("EPOCH").toInt(81));
        setBeta(transferLearning.value("BETA").toDouble(1.0));
    }

    // Cập nhật TFRecord Used Path từ DATASET
    if (rootObject.contains("DATASET") && rootObject["DATASET"].isObject()) {
        QJsonObject dataset = rootObject["DATASET"].toObject();
        if (dataset.contains("PATH") && dataset["PATH"].isObject()) {
            QJsonObject path = dataset["PATH"].toObject();
            setTfrecordUsedPath(path.value("TFRECORDS").toArray().at(0).toString("/home/haiminh/Desktop/D-ESCA_v2/park_dataset_demo/mel_data2"));
        }
    }
    return true;
}

bool TransferConfig::saveConfig() const {
    QFile file(m_filePath);
    QJsonObject rootObject;

    // Đọc cấu hình hiện tại từ file nếu tồn tại
    if (file.exists()) {
        if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
            qWarning() << "Không thể mở file để đọc:" << m_filePath;
            return false;
        }
        QByteArray data = file.readAll();
        QJsonDocument doc = QJsonDocument::fromJson(data);

        if (!doc.isNull() && doc.isObject()) {
            rootObject = doc.object();
        }
        file.close();
    }

    // Cập nhật TRANSFER_LEARNING
    QJsonObject transferLearning = rootObject.value("TRANSFER_LEARNING").toObject();
    transferLearning["BASED_WEIGHTS"] = m_baseWeightPath;
    // transferLearning["TFRECORDS"] = QJsonArray{m_tfrecordNewPath};
    QJsonArray tfrecordsArray;
    tfrecordsArray.append(m_tfrecordNewPath);
    transferLearning["TFRECORDS"] = tfrecordsArray;
    transferLearning["SAVE_PATH"] = m_savePath;
    transferLearning["ANOM_BATCH_SIZE"] = m_batchSize;
    transferLearning["LEARNING_RATE"] = m_learningRate;
    transferLearning["EPOCH"] = m_epoch;
    transferLearning["BETA"] = m_beta;
    rootObject["TRANSFER_LEARNING"] = transferLearning;

    // Cập nhật DATASET -> PATH -> TFRECORDS
    if (rootObject.contains("DATASET") && rootObject["DATASET"].isObject()) {
        QJsonObject dataset = rootObject["DATASET"].toObject();
        QJsonObject path = dataset.value("PATH").toObject();
        // path["TFRECORDS"] = QJsonArray{m_tfrecordUsedPath};
        QJsonArray usedtfrecordsArray;
        usedtfrecordsArray.append(m_tfrecordUsedPath);
        path["TFRECORDS"] = usedtfrecordsArray;
        dataset["PATH"] = path;
        rootObject["DATASET"] = dataset;
        qDebug()<<usedtfrecordsArray;
    }

    // Ghi lại cấu hình vào file
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qWarning() << "Không thể mở file để ghi:" << m_filePath;
        return false;
    }

    QJsonDocument doc(rootObject);
    file.write(doc.toJson());
    file.close();
    return true;
}

void TransferConfig::loadDefaults() {
    m_baseWeightPath = "/home/haiminh/Desktop/D-ESCA_v2/Results/base_training_result/saved_model/vq_vae";
    m_tfrecordUsedPath = "/home/haiminh/Desktop/D-ESCA_v2/park_dataset_demo/mel_data2";
    m_tfrecordNewPath = "/home/haiminh/Desktop/D-ESCA_v2/data/target/Target25";
    m_savePath = "/home/haiminh/Desktop/D-ESCA_v2/Results/tl-training_results/Target3";
    m_batchSize = 128;
    m_learningRate = 0.001;
    m_epoch = 81;
    m_beta = 1.0;
}
