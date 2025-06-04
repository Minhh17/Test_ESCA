#ifndef TRANSFERCONTROLLER_H
#define TRANSFERCONTROLLER_H

#include <QObject>
#include <QString>
#include <QQmlEngine>

#include "transferprocmng.h"
#include "histogrammanager.h"
#include "prmanager.h"
#include "rocmanager.h"

class TransferController : public QObject
{
    Q_OBJECT
public:
    explicit TransferController(QObject *parent = nullptr);
    ~TransferController();

    Q_PROPERTY(bool tlStatus READ tlStatus WRITE setTlStatus NOTIFY tlStatusChanged FINAL)

    Q_PROPERTY(int epoch READ epoch WRITE setEpoch NOTIFY epochChanged)
    Q_PROPERTY(int totalEpoch READ totalEpoch WRITE setTotalEpoch NOTIFY totalEpochChanged)
    Q_PROPERTY(QString logText READ logText WRITE setLogText NOTIFY logTextChanged)

    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();

    bool tlStatus() const;
    void setTlStatus(bool newTlStatus);

    int epoch() const;
    void setEpoch(int newEpoch);

    int totalEpoch() const;
    void setTotalEpoch(int newTotalEpoch);

    QString logText() const;
    void setLogText(const QString &newLogText);

signals:
    void tlStatusChanged();
    void epochChanged();
    void totalEpochChanged();
    void logTextChanged();

public slots:
    void updateEpochProgress(int currentEpoch, int totalEpoch);
    void updateLogSummary(const QString &summary);

private:
    TransferProcMng* transferProcMng;
    HistogramManager* m_histogram;
    PRManager* m_prManager;
    ROCManager* m_rocManager;

    bool m_tlStatus = false;
    int m_epoch;
    int m_totalEpoch;
    QString m_logText;
};

#endif // TransferController_H

