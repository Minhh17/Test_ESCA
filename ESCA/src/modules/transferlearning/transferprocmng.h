// TransferProcMng.h
#ifndef TRANSFERPROCMNG_H
#define TRANSFERPROCMNG_H

#include "transferengine.h"
#include "transferlogparser.h"

class TransferProcMng : public TransferEngine
{
    Q_OBJECT

public:
    explicit TransferProcMng(QObject *parent = nullptr);
    ~TransferProcMng();

    void start() override;
    void stop() override;

    void setScriptPath(const QString &path) override;
    QString scriptPath() const override;

signals:
    void logUpdated(int, int, QString, QVariantMap); // preserved for compatibility

public slots:
    void handleStandardOutput();
    void handleProcessFinished(int exitCode, QProcess::ExitStatus exitStatus);

private:
    QString m_scriptPath;
    QString m_buffer;  // Dùng buffer để ghép dữ liệu khi bị cắt
    TransferLogParser *m_parser;

};

#endif // TransferProcMng_H
