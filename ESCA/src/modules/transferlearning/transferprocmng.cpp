#include "transferprocmng.h"
#include <QDebug>
#include <QString>
#include <QtConcurrent>

TransferProcMng::TransferProcMng(QObject *parent)
    : TransferEngine(parent),
    m_scriptPath("/home/haiminh/Desktop/D-ESCA_v2/tools/tl_training.py -cfg ./config/default.py -f '' "),
    m_parser(std::make_unique<TransferLogParser>(this))
{
    connect(&m_process, &QProcess::readyRead, this, &TransferProcMng::handleStandardOutput);
    connect(&m_process,
            static_cast<void (QProcess::*)(int, QProcess::ExitStatus)>(&QProcess::finished),
            this,
            &TransferProcMng::handleProcessFinished);

    connect(m_parser.get(), &TransferLogParser::epochProgressUpdated, this, &TransferProcMng::epochProgressUpdated);
    connect(m_parser.get(), &TransferLogParser::epochSummaryUpdated, this, &TransferProcMng::epochSummaryUpdated);
    connect(m_parser.get(), &TransferLogParser::histogramUpdated, this, &TransferProcMng::histogramUpdated);
    connect(m_parser.get(), &TransferLogParser::prCurveUpdated, this, &TransferProcMng::prCurveUpdated);
    connect(m_parser.get(), &TransferLogParser::rocCurveUpdated, this, &TransferProcMng::rocCurveUpdated);
    connect(m_parser.get(), &TransferLogParser::finished, this, &TransferProcMng::transFinished);
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
    setStatement("python3 ~/Desktop/minh/ESCA_Qt/python_ai/tl_training.py");

    //export PYTHONPATH=~/Desktop/D-ESCA_v2:$PYTHONPATH &&
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
            QtConcurrent::run(m_parser.get(), &TransferLogParser::parseLine, line);
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
