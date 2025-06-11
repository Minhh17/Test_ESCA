#include "processmanager.h"
#include <QDebug>

ProcessManager::ProcessManager(QObject *parent)
    : Process(parent),
    m_scriptPath("../../../../python_ai/inference/shared_memory_reader.py")
{
    connect(&m_process, &QProcess::readyRead, this, &ProcessManager::handleStandardOutput);
}

ProcessManager::~ProcessManager()
{
    stopPythonService();
}

void ProcessManager::startPythonService()
{
    qInfo() << Q_FUNC_INFO;
    if(m_scriptPath.isEmpty()) {
        qWarning() << "Python script path is not set.";
        return;
    }

    qDebug() << "Current working directory:" << QDir::currentPath();
    setStatement("python3 ~/Desktop/Test_ESCA/python_ai/inference.py");
    qInfo() << statement();

    startProcess();
    start();
}

void ProcessManager::stopPythonService()
{
    qInfo() << Q_FUNC_INFO;
    stop();
}

void ProcessManager::handleStandardOutput()
{
    static QByteArray buffer;
    buffer.append(m_process.readAllStandardOutput());  // Ghi nhận dữ liệu mới

    QList<QByteArray> lines = buffer.split('\n');  // Chia nhỏ theo dòng

    // Nếu buffer không kết thúc bằng '\n', giữ lại dòng cuối để ghép với dữ liệu sau
    if (!buffer.endsWith("\n")) {
        buffer = lines.takeLast();
    } else {
        buffer.clear();
    }

    for (const QByteArray &line : lines) {
        QString outputStr = QString::fromUtf8(line).trimmed();

        if (outputStr.isEmpty()) continue;  // Bỏ qua dòng rỗng

        bool ok;
        float predValue = outputStr.toFloat(&ok);

        if (ok) {  // Nếu là số thực
            qInfo() << "Predict Result:" << predValue;
            emit resultReceived(predValue);
        } else if (outputStr == "Done Folder Mode") {
            emit doneProcess();
        } else {  // Nếu là chuỗi cảnh báo
            qWarning() << "Warning from Python:" << outputStr;
            emit abnormalDetect(outputStr);
        }
    }
}

void ProcessManager::handleProcessFinished(int exitCode, QProcess::ExitStatus exitStatus)
{
    qInfo() << "Python process finished with exit code:" << exitCode;
    if (exitStatus == QProcess::CrashExit) {
        qWarning() << "Python process crashed!";
    }
    // Có thể xử lý khi tiến trình kết thúc hoặc có lỗi
}

void ProcessManager::setScriptPath(const QString &path)
{
    m_scriptPath = path;
}

QString ProcessManager::scriptPath() const
{
    return m_scriptPath;
}
