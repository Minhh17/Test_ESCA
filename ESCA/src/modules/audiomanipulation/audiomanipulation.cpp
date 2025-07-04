#include "audiomanipulation.h"
#include "../../common/storage/datastorage.h"
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QFile>
#include <QFileInfo>

AudioManipulation::AudioManipulation(QObject *parent) : QObject(parent)
{
    m_process = new QProcess(this);
    connect(m_process, QOverload<int, QProcess::ExitStatus>::of(&QProcess::finished),
            this, &AudioManipulation::onProcessFinished);
    connect(m_process, &QProcess::errorOccurred,
            this, &AudioManipulation::onProcessError);
            
    m_filePath = DataStorage::filePath("config.json");
}

AudioManipulation::~AudioManipulation()
{
    if (m_process && m_process->state() != QProcess::NotRunning) {
        m_process->terminate();
        m_process->waitForFinished(1000); // Chờ 1 giây trước khi hủy
    }
}

void AudioManipulation::extractMFCC(QString audioPath)
{
    qDebug() << "AudioManipulation audioPath" << audioPath;

    QString statement = "export PYTHONPATH=~/Desktop/ESCA_Audio_Features_Extractor:$PYTHONPATH && python3 ~/Desktop/ESCA_Audio_Features_Extractor/src/mel.py -f ";
    statement.append(audioPath);
    qInfo() << "Executing command:" << statement;

    m_process->start("/bin/sh", QStringList() << "-c" << statement);
}

void AudioManipulation::extractGFCC(QString audioPath)
{
    QString filePath = "/home/gianghandsome/ESCA/data/data.wav"; // Hard-coded tạm thời
    QString statement = "cd ";
    statement.append(AUDIO_FEATURES_EXTRACTOR_SRC);
    statement.append(" && python3 gfcc.py -f ");
    statement.append(filePath);
    qInfo() << "Executing command:" << statement;

    m_process->start("/bin/sh", QStringList() << "-c" << statement);
}

void AudioManipulation::extractFrequency(QString audioPath)
{
    QString statement = "export PYTHONPATH=~/Desktop/ESCA_Audio_Features_Extractor:$PYTHONPATH && python3 ~/Desktop/ESCA_Audio_Features_Extractor/src/frequency.py -f ";
    statement.append(audioPath);
    qInfo() << "Executing command:" << statement;

    m_process->start("/bin/sh", QStringList() << "-c" << statement);
}

void AudioManipulation::splitAudio(QString source, QString destination, QString duration)
{
    qDebug() << "AudioManipulation source:" << source;
    qDebug() << "AudioManipulation destination:" << destination;
    qDebug() << "AudioManipulation duration:" << duration;

    // Kiểm tra file nguồn
    // QFileInfo sourceFile(source);
    // if (!sourceFile.exists() || !sourceFile.isFile()) {
    //     qWarning() << "Source file does not exist or is not a file:" << source;
    //     return;
    // }

    // Chuẩn hóa đường dẫn đích
    QString destPath = destination;
    if (!destPath.startsWith('/')) {
        destPath.prepend('/'); // Đảm bảo đường dẫn tuyệt đối
    }

    // Tạo lệnh shell
    QString statement = "cd ~/Desktop/D-ESCA_v2 && python3 helper/split_audio_qt.py -s ";
    statement.append(source);
    statement.append(" -d ");
    statement.append(destPath);
    // if (!duration.isEmpty()) {
    //     statement.append(" -du ");
    //     statement.append(duration);
    // }

    qInfo() << "Executing command:" << statement;

    // Chạy lệnh bất đồng bộ
    m_process->start("/bin/sh", QStringList() << "-c" << statement);
}

void AudioManipulation::prepareDataset(QString normalPath, QString anomalyPath, QString outputPath)
{	

	QFile file(m_filePath);
    QJsonObject rootObject;
    
	if (file.exists()) {
        if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
            qWarning() << "Không thể mở file cấu hình để đọc:" << m_filePath;
        }

        QByteArray data = file.readAll();
        QJsonDocument doc = QJsonDocument::fromJson(data);

        if (!doc.isNull() && doc.isObject()) {
            rootObject = doc.object();
        }

        file.close();
    }    
    
    // Cập nhật phần REALTIME
    QJsonObject dataset;
    QJsonObject path;    
    path["ANOMALY"] = anomalyPath;
    path["NORMAL"] = normalPath;
    path["TEST"] = QJsonValue::Null;
    path["TFRECORDS"] = QJsonArray({outputPath});
    
    QJsonObject dataloader; 
    dataloader["BATCH_SIZE"] = 128;
    dataloader["SHUFFLE"] = true;
    
    QJsonObject ratio;
    ratio["TEST"] = 0.1;
    ratio["TRAIN"] = 0.8;
         
    dataset["DATALOADER"] = dataloader;
	dataset["PATH"] = path;
	dataset["RATIO"] = ratio;
    rootObject["DATASET"] = dataset; // Ghi đè hoặc thêm phần REALTIME

    // Ghi lại file JSON
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qWarning() << "Không thể mở file cấu hình để ghi:" << m_filePath;
    }

    QJsonDocument doc(rootObject);
    file.write(doc.toJson());
    file.close();
    qDebug() << "Đã lưu cấu hình đầy đủ thành công.";
    
	QString statement = "python3 /home/sparclab/Desktop/Test_ESCA/python_ai/prepare_data.py";
	qInfo() << "Executing command:" << statement;
	m_process->start("/bin/sh", QStringList() << "-c" << statement);
}



void AudioManipulation::onProcessFinished(int exitCode, QProcess::ExitStatus exitStatus)
{
    if (exitStatus == QProcess::NormalExit && exitCode == 0) {
        qInfo() << "Audio manipulation process completed successfully";
        qDebug() << "Output:" << m_process->readAllStandardOutput();
    } else {
        qWarning() << "Audio manipulation process failed with exit code:" << exitCode;
        qWarning() << "Error output:" << m_process->readAllStandardError();
    }
}

void AudioManipulation::onProcessError(QProcess::ProcessError error)
{
    qWarning() << "Process error occurred:" << m_process->errorString();
}
