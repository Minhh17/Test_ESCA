#ifndef AICONTROLLER_H
#define AICONTROLLER_H

#include <QObject>
#include "sharedmemorymanager.h"
#include "configurationmanager.h"
#include "inferenceoutputparser.h"
#include "inferenceengine.h"

class AIController : public QObject
{
    Q_OBJECT
public:
    explicit AIController(InferenceEngine *engine, QObject *parent = nullptr);
    ~AIController();

    Q_PROPERTY(bool inferenceStatus READ inferenceStatus WRITE setinferenceStatus NOTIFY inferenceStatusChanged FINAL)
    Q_PROPERTY(QVector<float> predValue READ predValue NOTIFY predValueChanged FINAL)
    Q_PROPERTY(QString abnomalDetect READ abnomalDetect WRITE setAbnomalDetect NOTIFY abnomalDetectChanged FINAL)
    Q_PROPERTY(bool doneDetect READ doneDetect WRITE setDoneDetect NOTIFY doneDetectChanged FINAL)

    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();

    QVector<float> predValue() const;

    bool inferenceStatus() const;
    void setinferenceStatus(bool newInferenceStatus);



    bool doneDetect() const;
    void setDoneDetect(bool newDoneDetect);

    QString abnomalDetect() const;
    void setAbnomalDetect(const QString &newAbnomalDetect);

signals:
    void predValueChanged();
    void inferenceStatusChanged();


    void doneDetectChanged();

    void abnomalDetectChanged();

private slots:
    void handleInferenceResult(const float predValue);
    void handleAbnormalDetect(QString outputStr);
    void handleDoneProcess();

private:
    // ConfigurationManager* configManager;
    // SharedMemoryManager* sharedMemoryManager;
    //ProcessManager* processManager;
    InferenceEngine* m_engine;

    QVector<float> m_predValue;
    bool m_inferenceStatus = false;
    QString m_abnomalDetect = "";
    bool m_doneDetect;
};

#endif // AICONTROLLER_H

