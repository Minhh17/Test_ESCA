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
};

#endif // ANOMALYLOGGER_H
