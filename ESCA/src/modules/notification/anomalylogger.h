#ifndef ANOMALYLOGGER_H
#define ANOMALYLOGGER_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDateTime>
#include <QDir>

class AnomalyLogger : public QObject
{
    Q_OBJECT
public:
    explicit AnomalyLogger(QObject *parent = nullptr);
    Q_INVOKABLE void logAnomaly(const QString &message,
                                float score,
                                const QString &reason);

private:
    QFile m_logFile;
    QDateTime m_logStart;

    QString anomalyLogFilePath(const QDateTime &dt) const;
    void openLog(const QDateTime &dt);
    void rotateLog();
};

#endif // ANOMALYLOGGER_H
