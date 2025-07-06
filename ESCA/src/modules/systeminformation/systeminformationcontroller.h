#ifndef SYSTEMINFORMATIONCONTROLLER_H
#define SYSTEMINFORMATIONCONTROLLER_H

#include <QObject>
#include <tuple>
#include <QQmlEngine>
#include <QTimer>
#include <QFile>
#include <QStorageInfo>
#include <QVector>
#include <QDateTime>
#include <QTextStream>
#include <QDir>

class SystemInformationController : public QObject
{
    Q_OBJECT
    
    Q_PROPERTY(int cpuPercentage READ cpuPercentage NOTIFY cpuChanged)
    Q_PROPERTY(QString cpuText READ cpuText NOTIFY cpuChanged)
    Q_PROPERTY(int ramPercentage READ ramPercentage NOTIFY ramChanged)
    Q_PROPERTY(QString ramText READ ramText NOTIFY ramChanged)
    Q_PROPERTY(QString diskText READ diskText NOTIFY diskChanged)

    Q_PROPERTY(int gpuPercentage READ gpuPercentage NOTIFY gpuChanged)
    Q_PROPERTY(QString gpuText READ gpuText NOTIFY gpuChanged)
    Q_PROPERTY(int temperature READ temperature NOTIFY temperatureChanged)
    Q_PROPERTY(QString temperatureText READ temperatureText NOTIFY temperatureChanged)
    Q_PROPERTY(QVector<int> cpuHistory READ cpuHistory NOTIFY historyChanged)
    Q_PROPERTY(QVector<int> gpuHistory READ gpuHistory NOTIFY historyChanged)
    Q_PROPERTY(QVector<int> ramHistory READ ramHistory NOTIFY historyChanged)
    Q_PROPERTY(QVector<int> tempHistory READ tempHistory NOTIFY historyChanged)

public:
    explicit SystemInformationController(QObject *parent = nullptr);

signals:
    void cpuChanged();
    void ramChanged();
    void diskChanged();
    void gpuChanged();
    void temperatureChanged();
    void historyChanged();

private:
    int cpuPercentage() const;
    QString cpuText() const;

    int ramPercentage() const;
    QString ramText() const;

    QString diskText() const;

    QTimer m_timer;

    unsigned long long lastTotalUser, lastTotalUserLow, lastTotalSys, lastTotalIdle;
    int cpu_usage = 0;

    int ram_usage = 0;

    int disk_usage = 0;

    int gpu_usage = 0;
    int temperature_value = 0;

    QVector<int> m_cpuHistory;
    QVector<int> m_gpuHistory;
    QVector<int> m_ramHistory;
    QVector<int> m_tempHistory;
    QFile m_healthLog;
    
	QDateTime m_logStart;

    QString healthLogFilePath(const QDateTime &dt) const;
    void openHealthLog(const QDateTime &dt);
    void rotateHealthLog();

    unsigned int user, total = 0;
    std::tuple<unsigned int, unsigned int> readFile();

    double getCpu();
    double getRam();
    std::tuple<double, double> getGpuTemp();
    int parseLine(char* line);
    double getDisk();

    void appendHistory(QVector<int>& list, int value);

    int gpuPercentage() const;
    QString gpuText() const;
    int temperature() const;
    QString temperatureText() const;

    QVector<int> cpuHistory() const;
    QVector<int> gpuHistory() const;
    QVector<int> ramHistory() const;
    QVector<int> tempHistory() const;
};

#endif // SYSTEMINFORMATIONCONTROLLER_H
