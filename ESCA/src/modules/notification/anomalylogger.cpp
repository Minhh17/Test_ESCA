#include "anomalylogger.h"
#include "../../common/storage/datastorage.h"
#include <QDebug>

    AnomalyLogger::AnomalyLogger(QObject *parent)
: QObject(parent)
{
    m_logStart = QDateTime::currentDateTime();
    openLog(m_logStart);
}

void AnomalyLogger::logAnomaly(const QString &message,
                               float score,
                               const QString &reason)
{
    if (!m_logFile.isOpen())
        return;
        
    rotateLog();

    QTextStream out(&m_logFile);
    QString timestamp = QDateTime::currentDateTime().toString(Qt::ISODate);
    out << timestamp << " : " << message << " (" << score << ") - " << reason << "\n";
    out.flush();
}


QString AnomalyLogger::anomalyLogFilePath(const QDateTime &dt) const
{
    QString dirPath = DataStorage::filePath("logs/anomaly");
    QDir().mkpath(dirPath);
    int bucket = (dt.time().minute()/10)*10;
    QTime t(dt.time().hour(), bucket);
    QDateTime bucketTime(dt.date(), t);
    QString name = QStringLiteral("anomaly_%1.log").arg(bucketTime.toString("yyyyMMdd_HHmm"));
    return QDir(dirPath).filePath(name);
}

void AnomalyLogger::openLog(const QDateTime &dt)
{
    QString logFilePath = anomalyLogFilePath(dt);
    m_logFile.setFileName(logFilePath);
    if (!m_logFile.open(QIODevice::Append | QIODevice::Text)) {
        qWarning() << "Cannot open anomaly log file:" << logFilePath;
    }
}

void AnomalyLogger::rotateLog()
{
    QDateTime now = QDateTime::currentDateTime();
    if (m_logStart.secsTo(now) >= 600) {
        m_logFile.close();
        m_logStart = now;
        openLog(m_logStart);
    }
}
