#ifndef ALERTMANAGER_H
#define ALERTMANAGER_H

#include <QObject>
#include <QTimer>
#include "notificationlogger.h"
#include "anomalylogger.h"
#include <QQueue>
#include <QDateTime>

class AlertManager : public QObject
{
    Q_OBJECT
public:
    explicit AlertManager(NotificationLogger *logger,
                          AnomalyLogger *anomalyLogger,
                          QObject *parent = nullptr);
    Q_INVOKABLE void triggerAlert(const QString &message, float score = 0.0f);

public slots:
    void handleUserResponse(bool confirmed, const QString &note);

signals:
    void showLocalAlert(const QString &message);
    void escalateAlert(const QString &message);

private slots:
    void onResponseTimeout();

private:
    bool shouldEscalate() const;
    void escalate(const QString &reason);

    NotificationLogger *m_logger;
    AnomalyLogger *m_anomalyLogger;
    QTimer m_timer;
    QString m_currentMessage;
    float m_currentScore = 0.0f;
    bool m_alertActive = false;
    QQueue<QDateTime> m_recentAlerts;
    const int m_escalationThreshold = 3;
    const int m_escalationWindowSec = 60;
    const int m_responseTimeoutMs = 5000;
};

#endif // ALERTMANAGER_H
