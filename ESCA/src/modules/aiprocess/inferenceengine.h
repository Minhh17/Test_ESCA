#ifndef INFERENCEENGINE_H
#define INFERENCEENGINE_H

#include "../../common/process/process.h"
#include <QObject>

class InferenceEngine : public Process
{
    Q_OBJECT
public:
    explicit InferenceEngine(QObject *parent = nullptr) : Process(parent) {}
    virtual ~InferenceEngine() {}

    virtual void start() = 0;
    virtual void stop() = 0;
    virtual void setScriptPath(const QString &path) = 0;

signals:
    void resultReceived(float predValue);
    void abnormalDetect(const QString &outputStr);
    void doneProcess();
};

#endif // INFERENCEENGINE_H
