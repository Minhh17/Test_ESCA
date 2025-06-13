#include "alertmanager.h"
#include <QDebug>

AlertManager::AlertManager(NotificationLogger *logger,
                           AnomalyLogger *anomalyLogger,
                           QObject *parent)
    : QObject(parent), m_logger(logger), m_anomalyLogger(anomalyLogger)
{
    connect(&m_timer, &QTimer::timeout, this, &AlertManager::onResponseTimeout);
    m_timer.setSingleShot(true);
}

void AlertManager::triggerAlert(const QString &message, float score)
{
    QDateTime now = QDateTime::currentDateTime();
    while (!m_recentAlerts.isEmpty() &&
           m_recentAlerts.head().secsTo(now) > m_escalationWindowSec) {
        m_recentAlerts.dequeue();
    }
    m_recentAlerts.enqueue(now);

    if (!m_alertActive) {
        m_alertActive = true;
        m_currentMessage = message;
        m_currentScore = score;
        if (m_logger) {
            m_logger->logNotification(QStringLiteral("Level1 alert: %1 (score %2)")
                                          .arg(message)
                                          .arg(score, 0, 'f', 2),
                                          "warning", 1);
        }
        emit showLocalAlert(message);
        m_timer.start(5000); // wait 5 seconds for response
    }

    if (shouldEscalate()) {
        if (m_anomalyLogger)
            m_anomalyLogger->logAnomaly(message, m_currentScore,
                                        QStringLiteral("repeated"));
        if (m_logger)
            m_logger->logNotification("Repeated abnormal sound detected:",
                                      "error", 2);
        emit escalateAlert(message);
        m_recentAlerts.clear();
    }
}

void AlertManager::handleUserResponse(bool confirmed, const QString &note)
{
    if (!m_alertActive)
        return;

    m_timer.stop();

    if (m_anomalyLogger)
        m_anomalyLogger->logAnomaly(m_currentMessage, m_currentScore, note);

    if (m_logger) {
        if (confirmed)
            m_logger->logNotification("Alert confirmed: " + m_currentMessage,
                                      "info", 1);
        else
            m_logger->logNotification("Escalating alert: " + m_currentMessage,
                                      "error", 2);
    }

    if (!confirmed)
        emit escalateAlert(m_currentMessage);

    m_alertActive = false;
    m_currentMessage.clear();
}

void AlertManager::onResponseTimeout()
{
    handleUserResponse(false, QStringLiteral("timeout"));
}

bool AlertManager::shouldEscalate() const
{
    return m_recentAlerts.size() >= m_escalationThreshold;
}
