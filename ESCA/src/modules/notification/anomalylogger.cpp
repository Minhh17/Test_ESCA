#include "anomalylogger.h"
#include <QDebug>

    AnomalyLogger::AnomalyLogger(QObject *parent)
: QObject(parent)
{
    QString logFilePath = QDir::homePath() + "/anomaly_history.log";
    m_logFile.setFileName(logFilePath);
    if (!m_logFile.open(QIODevice::Append | QIODevice::Text)) {
        qWarning() << "Cannot open anomaly log file:" << logFilePath;
    }
}

void AnomalyLogger::logAnomaly(const QString &message,
                               float score,
                               const QString &reason)
{
    if (!m_logFile.isOpen())
        return;

    QTextStream out(&m_logFile);
    QString timestamp = QDateTime::currentDateTime().toString(Qt::ISODate);
    out << timestamp << " : " << message << " (" << score << ") - " << reason << "\n";
    out.flush();
}
