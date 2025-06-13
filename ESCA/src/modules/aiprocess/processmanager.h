#ifndef PROCESSMANAGER_H
#define PROCESSMANAGER_H

#include <QDir>
#include "inferenceengine.h"
#include "inferenceoutputparser.h"

class ProcessManager : public InferenceEngine
{
    Q_OBJECT

public:
    explicit ProcessManager(QObject *parent = nullptr);
    ~ProcessManager();

    void start() override;
    void stop() override;

    void setScriptPath(const QString &path) override;
    QString scriptPath() const;

private slots:
    void handleStandardOutput();
    void handleProcessFinished(int exitCode, QProcess::ExitStatus exitStatus);

private:
    QString m_scriptPath;
    InferenceOutputParser *m_parser;
};

#endif // PROCESSMANAGER_H
