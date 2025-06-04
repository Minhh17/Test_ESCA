#include "notificationlogger.h"
#include <QDebug>

NotificationLogger::NotificationLogger(QObject *parent)
    : QObject(parent)
{
    // File log nằm trong thư mục home
    QString logFilePath = QDir::homePath() + "/notification_history.log";
    m_logFile.setFileName(logFilePath);
    if (!m_logFile.open(QIODevice::Append | QIODevice::Text)) {
        qWarning() << "Không mở được file log:" << logFilePath;
    }
}

void NotificationLogger::logNotification(const QString &message, const QString &type, int priority)
{
    if (!m_logFile.isOpen())
        return;

    QTextStream out(&m_logFile);
    QString timestamp = QDateTime::currentDateTime().toString(Qt::ISODate);
    out << timestamp << " [" << type << "] (Priority: " << priority << "): " << message << "\n";
    out.flush();
}
