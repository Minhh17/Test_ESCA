#ifndef TRANSFERENGINE_H
#define TRANSFERENGINE_H

#include "../../common/process/process.h"
#include <QVector>

class TransferEngine : public Process
{
    Q_OBJECT
public:
    explicit TransferEngine(QObject *parent = nullptr) : Process(parent) {}
    ~TransferEngine() override = default;

    virtual void start() = 0;
    virtual void stop() = 0;
    virtual void setScriptPath(const QString &path) = 0;
    virtual QString scriptPath() const = 0;

signals:
    void epochProgressUpdated(int current, int total);
    void epochSummaryUpdated(QString summary);
    void histogramUpdated(QVector<double> values);
    void prCurveUpdated(const QVector<double>& recall, const QVector<double>& precision);
    void rocCurveUpdated(const QVector<double>& fpr, const QVector<double>& tpr);
    void transFinished();
};

#endif // TRANSFERENGINE_H
