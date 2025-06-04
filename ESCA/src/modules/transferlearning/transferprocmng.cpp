#include "transferprocmng.h"
#include <QDebug>

TransferProcMng::TransferProcMng(QObject *parent)
    : Process(parent)
// m_scriptPath("/home/haiminh/Desktop/rt_test.py -cfg /home/haiminh/Desktop/params.yaml -f /home/haiminh/Desktop/temp.csv") // Đường dẫn mặc định
{
    connect(&m_process, &QProcess::readyRead, this, &TransferProcMng::handleStandardOutput);
    connect(&m_process,
            static_cast<void (QProcess::*)(int, QProcess::ExitStatus)>(&QProcess::finished),
            this,
            &TransferProcMng::handleProcessFinished);
}

TransferProcMng::~TransferProcMng()
{
    stopPythonService();
}

void TransferProcMng::startPythonService()
{
    qInfo() << Q_FUNC_INFO;

    qDebug() << "Current working directory:" << QDir::currentPath();

    setStatement("export PYTHONPATH=~/Desktop/D-ESCA_v2:$PYTHONPATH && python3 ~/Desktop/D-ESCA_v2/tools/tl_training.py");
    // setStatement("python3 ../../../../python_ai/inference/shared_memory_reader.py");

    qInfo() << statement();

    startProcess();
    start();
}

void TransferProcMng::stopPythonService()
{
    m_epoch = 0;
    qInfo() << Q_FUNC_INFO;
    stop();
}

void TransferProcMng::handleStandardOutput()
{
    // Đọc dữ liệu mới từ tiến trình và thêm vào m_buffer
    QByteArray data = m_process.readAll();
    m_buffer += QString::fromUtf8(data);

    // Xử lý theo từng dòng hoàn chỉnh (dựa vào ký tự newline)
    int newlineIndex = m_buffer.indexOf('\n');
    while (newlineIndex != -1) {
        // Lấy 1 dòng (không bao gồm ký tự newline) và xóa khỏi buffer
        QString line = m_buffer.left(newlineIndex).trimmed();
        m_buffer.remove(0, newlineIndex + 1);

        if (line.isEmpty()) {
            newlineIndex = m_buffer.indexOf('\n');
            continue;
        }

        // Kiểm tra nếu log là "[FINISHED]"
        if (line == "[FINISHED]") {
            // stopPythonService();
            emit transFinished(); // Signal thông báo Python đã hoàn thành
        }
        // Xử lý theo tiền tố của dòng
        if (line.startsWith("[PROG]")) {
            // Dòng log progress
            QString progText = line.mid(6).trimmed();
            emit epochSummaryUpdated(progText);

        } else if (line.startsWith("[HIST]")) {
            // Dòng log Histogram
            QString dataStr = line.mid(6).trimmed();
            QStringList valuesStr = dataStr.split(",", Qt::SkipEmptyParts);
            QVector<double> values;
            values.reserve(valuesStr.size());
            for (const QString &val : valuesStr) {
                bool ok;
                double d = val.toDouble(&ok);
                if (ok)
                    values.append(d);
            }
            emit histogramUpdated(values);

        } else if (line.startsWith("[PR]")) {
            // Dòng log PR curve (JSON)
            QString jsonStr = line.mid(4).trimmed();
            QJsonDocument doc = QJsonDocument::fromJson(jsonStr.toUtf8());
            if (doc.isArray()) {
                QJsonArray arr = doc.array();
                if (arr.size() >= 2) {
                    QVector<double> recall, precision;
                    QJsonArray recallArray = arr.at(0).toArray();
                    QJsonArray precisionArray = arr.at(1).toArray();
                    recall.reserve(recallArray.size());
                    precision.reserve(precisionArray.size());
                    for (const QJsonValue &val : recallArray)
                        recall.append(val.toDouble());
                    for (const QJsonValue &val : precisionArray)
                        precision.append(val.toDouble());
                    emit prCurveUpdated(recall, precision);
                } else {
                    qWarning() << "PR JSON array không đủ phần tử:" << jsonStr;
                }
            } else {
                qWarning() << "PR JSON không hợp lệ:" << jsonStr;
            }

        } else if (line.startsWith("[ROC]")) {
            // Dòng log ROC curve (JSON)
            QString jsonStr = line.mid(5).trimmed();
            QJsonDocument doc = QJsonDocument::fromJson(jsonStr.toUtf8());
            if (doc.isArray()) {
                QJsonArray arr = doc.array();
                if (arr.size() >= 2) {
                    QVector<double> fpr, tpr;
                    QJsonArray fprArray = arr.at(0).toArray();
                    QJsonArray tprArray = arr.at(1).toArray();
                    fpr.reserve(fprArray.size());
                    tpr.reserve(tprArray.size());
                    for (const QJsonValue &val : fprArray)
                        fpr.append(val.toDouble());
                    for (const QJsonValue &val : tprArray)
                        tpr.append(val.toDouble());
                    emit rocCurveUpdated(fpr, tpr);
                } else {
                    qWarning() << "ROC JSON array không đủ phần tử:" << jsonStr;
                }
            } else {
                qWarning() << "ROC JSON không hợp lệ:" << jsonStr;
            }

        } else if (line.startsWith("[EPOCH]")) {
            // Dòng log Epoch dạng "[EPOCH] 1/81"
            QString remainder = line.mid(7).trimmed();
            QStringList parts = remainder.split('/');
            if (parts.size() == 2) {
                int currentEpoch = parts[0].toInt();
                int totalEpoch = parts[1].toInt();
                emit epochProgressUpdated(currentEpoch, totalEpoch);
            } else {
                qWarning() << "Dữ liệu [EPOCH] không đúng định dạng:" << line;
            }
        }

        // Tìm dòng tiếp theo
        newlineIndex = m_buffer.indexOf('\n');
    }
}

void TransferProcMng::handleProcessFinished(int exitCode, QProcess::ExitStatus exitStatus)
{
    qInfo() << "Python process finished with exit code:" << exitCode;
    if (exitStatus == QProcess::CrashExit) {
        qWarning() << "Python process crashed!";
    }
    emit transFinished();
}

void TransferProcMng::setScriptPath(const QString &path)
{
    m_scriptPath = path;
}

QString TransferProcMng::scriptPath() const
{
    return m_scriptPath;
}
