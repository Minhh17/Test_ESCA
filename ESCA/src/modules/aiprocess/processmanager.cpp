#include "processmanager.h"
#include <QDebug>
#include <QCoreApplication>

ProcessManager::ProcessManager(QObject *parent)
    : InferenceEngine(parent),
    m_scriptPath("~/Desktop/Test_ESCA/python_ai/inference.py"),
    m_parser(new InferenceOutputParser(this))
{
    connect(&m_process, &QProcess::readyRead, this, &ProcessManager::handleStandardOutput);
    connect(m_parser, &InferenceOutputParser::resultReceived, this, &ProcessManager::resultReceived);
    connect(m_parser, &InferenceOutputParser::abnormalDetect, this, &ProcessManager::abnormalDetect);
    connect(m_parser, &InferenceOutputParser::doneProcess, this, &ProcessManager::doneProcess);
}

ProcessManager::~ProcessManager()
{
    //stopPythonService();
    stop();
}

void ProcessManager::start()
{
    qDebug()<<"In handleStandardOutput prcmng" <<QStringLiteral("python3 %1").arg(m_scriptPath);
    qInfo() << Q_FUNC_INFO;

    setStatement(QStringLiteral("python3 %1").arg(m_scriptPath));
    Process::start();

}

void ProcessManager::stop()
{
    qDebug()<<"In ProcessManager::stop prcmng";
    qInfo() << Q_FUNC_INFO;
    Process::stop();
}

void ProcessManager::handleStandardOutput()
{
    qDebug()<<"In handleStandardOutput prcmng";
    static QByteArray buffer;
    buffer.append(m_process.readAllStandardOutput());

    QList<QByteArray> lines = buffer.split('\n');

    if (!buffer.endsWith("\n")) {
        buffer = lines.takeLast();
    } else {
        buffer.clear();
    }

    for (const QByteArray &line : lines) {
        QString outputStr = QString::fromUtf8(line).trimmed();

        if (outputStr.isEmpty())
            continue;
        m_parser->parseLine(outputStr);
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
