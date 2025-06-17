#include "transferprocmng.h"
#include <QDebug>
#include <QString>

TransferProcMng::TransferProcMng(QObject *parent)
    : TransferEngine(parent),
    m_scriptPath("/home/haiminh/Desktop/D-ESCA_v2/tools/tl_training.py -cfg ./config/default.py -f '' "),
    m_parser(new TransferLogParser(this))
{
    connect(&m_process, &QProcess::readyRead, this, &TransferProcMng::handleStandardOutput);
    connect(&m_process,
            static_cast<void (QProcess::*)(int, QProcess::ExitStatus)>(&QProcess::finished),
            this,
            &TransferProcMng::handleProcessFinished);

    connect(m_parser, &TransferLogParser::epochProgressUpdated, this, &TransferProcMng::epochProgressUpdated);
    connect(m_parser, &TransferLogParser::epochSummaryUpdated, this, &TransferProcMng::epochSummaryUpdated);
    connect(m_parser, &TransferLogParser::histogramUpdated, this, &TransferProcMng::histogramUpdated);
    connect(m_parser, &TransferLogParser::prCurveUpdated, this, &TransferProcMng::prCurveUpdated);
    connect(m_parser, &TransferLogParser::rocCurveUpdated, this, &TransferProcMng::rocCurveUpdated);
    connect(m_parser, &TransferLogParser::finished, this, &TransferProcMng::transFinished);
}

TransferProcMng::~TransferProcMng()
{
    stop();
}

void TransferProcMng::start()
{
    qInfo() << Q_FUNC_INFO;
    if (m_scriptPath.isEmpty()) {
        qWarning() << "Script path is not set";
        return;
    }
    setStatement("export PYTHONPATH=~/Desktop/D-ESCA_v2:$PYTHONPATH && python3 ~/Desktop/D-ESCA_v2/tools/tl_training.py");

    Process::start();
}

void TransferProcMng::stop()
{
    qInfo() << Q_FUNC_INFO;
    Process::stop();
}

void TransferProcMng::handleStandardOutput()
{
    QByteArray data = m_process.readAll();
    m_buffer += QString::fromUtf8(data);

    qInfo() << "Python result :" << m_buffer;
    int newlineIndex = m_buffer.indexOf('\n');
    while (newlineIndex != -1) {
        QString line = m_buffer.left(newlineIndex).trimmed();
        m_buffer.remove(0, newlineIndex + 1);

        if (!line.isEmpty()) {
            m_parser->parseLine(line);
        }

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
