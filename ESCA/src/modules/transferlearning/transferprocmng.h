// TransferProcMng.h
#ifndef TRANSFERPROCMNG_H
#define TRANSFERPROCMNG_H

#include "../ESCA/src/common/process/process.h"
#include <QDir>
#include <QRegularExpression>
#include <QRegularExpressionMatchIterator>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>

class TransferProcMng : public Process
{
    Q_OBJECT

public:
    explicit TransferProcMng(QObject *parent = nullptr);
    ~TransferProcMng();

    void startPythonService();
    void stopPythonService();

    void setScriptPath(const QString &path);
    QString scriptPath() const;

signals:
    void logUpdated(int, int, QString, QVariantMap);
    void epochProgressUpdated(int, int);
    void epochSummaryUpdated(QString);
    void progressUpdated(QString);
    void histogramUpdated(QVector<double>);
    void prCurveUpdated(const QVector<double>& recall, const QVector<double>& precision);
    void rocCurveUpdated(const QVector<double>& fpr, const QVector<double>& tpr);
    void transFinished();

public slots:
    void handleStandardOutput();
    void handleProcessFinished(int exitCode, QProcess::ExitStatus exitStatus);

private:
    QString m_scriptPath;
    int m_epoch = 0;
    int m_totalEpoch = 0;
    QVariantMap m_details;
    QString m_buffer;  // Dùng buffer để ghép dữ liệu khi bị cắt

};

#endif // TransferProcMng_H
