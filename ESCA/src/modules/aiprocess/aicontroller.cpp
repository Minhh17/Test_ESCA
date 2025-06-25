#include "aicontroller.h"
#include "processmanager.h"
#include "latencytracker.h"
#include <QDebug>

AIController::AIController(InferenceEngine *engine, QObject *parent)
    : QObject(parent),
    m_engine(engine)
{
    Q_ASSERT(m_engine);

    connect(m_engine, &InferenceEngine::resultReceived, this, &AIController::handleInferenceResult);
    connect(m_engine, &InferenceEngine::abnormalDetect, this, &AIController::handleAbnormalDetect);
    connect(m_engine, &InferenceEngine::doneProcess, this, &AIController::handleDoneProcess);
}

AIController::~AIController()
{
    stop();
}

void AIController::start()
{
    qDebug()<<"In AIController::start";
    LatencyTracker::reset();
    //processManager->startPythonService();
    if (m_engine)
        m_engine->start();
    setinferenceStatus(true);
}

void AIController::stop()
{
    //processManager->stopPythonService();
    if (m_engine)
        m_engine->stop();
    setinferenceStatus(false);
    LatencyTracker::writeSummary();
}

void AIController::handleInferenceResult(const float predValue)
{
    m_predValue.push_back(predValue);

    if (m_predValue.size() > 200) { // Giới hạn số cột hiển thị
        m_predValue.removeFirst();
    }
    emit predValueChanged();
    qDebug() << "Total Pred Values Stored: " << m_predValue.size();
}

void AIController::handleAbnormalDetect(QString outputStr)
{
    setAbnomalDetect(outputStr);
    qDebug() << "setAbnomalDetect: "<<abnomalDetect();
}

void AIController::handleDoneProcess()
{
    // setinferenceStatus(false);
    setDoneDetect(true);
    qDebug() << "Done Detect: "<<doneDetect();
}

QVector<float> AIController::predValue() const
{
    return m_predValue;
}

bool AIController::inferenceStatus() const
{
    return m_inferenceStatus;
}

void AIController::setinferenceStatus(bool newInferenceStatus)
{
    if (m_inferenceStatus == newInferenceStatus)
        return;
    m_inferenceStatus = newInferenceStatus;
    emit inferenceStatusChanged();
}

bool AIController::doneDetect() const
{
    return m_doneDetect;
}

void AIController::setDoneDetect(bool newDoneDetect)
{
    if (m_doneDetect == newDoneDetect)
        return;
    m_doneDetect = newDoneDetect;
    emit doneDetectChanged();
}

QString AIController::abnomalDetect() const
{
    return m_abnomalDetect;
}

void AIController::setAbnomalDetect(const QString &newAbnomalDetect)
{
    m_abnomalDetect = newAbnomalDetect;
    emit abnomalDetectChanged();
}
