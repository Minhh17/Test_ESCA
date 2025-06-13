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

    m_currentMessage = message;
    m_currentScore = score;

    if (shouldEscalate()) {
        escalate(QStringLiteral("repeated"));
        return;
    }

    if (!m_alertActive) {
        m_alertActive = true;
        if (m_logger) {
            m_logger->logNotification(QStringLiteral("Level1 alert: %1 (score %2)")
                                          .arg(message)
                                          .arg(score, 0, 'f', 2),
                                          "warning", 1);
        }
        emit showLocalAlert(message);
        m_timer.start(m_responseTimeoutMs);
    }
}

void AlertManager::handleUserResponse(bool confirmed, const QString &note)
{
    if (!m_alertActive)
        return;

    m_timer.stop();

    if (m_anomalyLogger)
        m_anomalyLogger->logAnomaly(m_currentMessage, m_currentScore, note);

    if (confirmed) {
        if (m_logger)
            m_logger->logNotification("Alert confirmed: " + m_currentMessage,
                                      "info", 1);
        m_recentAlerts.clear();
        m_alertActive = false;
        m_currentMessage.clear();
    } else {
        escalate(note.isEmpty() ? QStringLiteral("operator unclear") : note);
    }
}

void AlertManager::onResponseTimeout()
{
    escalate(QStringLiteral("timeout"));
}

bool AlertManager::shouldEscalate() const
{
    return m_recentAlerts.size() >= m_escalationThreshold;
}

void AlertManager::escalate(const QString &reason)
{
    if (m_anomalyLogger)
        m_anomalyLogger->logAnomaly(m_currentMessage, m_currentScore, reason);
    if (m_logger)
        m_logger->logNotification("Escalating alert: " + m_currentMessage,
                                  "error", 2);
    emit escalateAlert(m_currentMessage);
    m_timer.stop();
    m_alertActive = false;
    m_currentMessage.clear();
    m_recentAlerts.clear();
}
