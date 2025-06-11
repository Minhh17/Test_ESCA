#include "aicontroller.h"
#include <QDebug>

AIController::AIController(QObject *parent) : QObject(parent)
{
    // configManager = new ConfigurationManager(this);
    // sharedMemoryManager = new SharedMemoryManager(this);
    processManager = new ProcessManager(this);
    parser = new InferenceOutputParser(this);

    connect(processManager, &ProcessManager::outputReceived, parser, &InferenceOutputParser::parseLine);
    connect(parser, &InferenceOutputParser::resultReceived, this, &AIController::handleInferenceResult);
    connect(parser, &InferenceOutputParser::abnormalDetect, this, &AIController::handleAbnormalDetect);
    connect(parser, &InferenceOutputParser::doneProcess, this, &AIController::handleDoneProcess);
}

AIController::~AIController()
{
    stop();
}

void AIController::start()
{
    // Đọc cấu hình
    // if (!configManager->loadConfig("python_ai/ai_module/config/config.json")) {
    //     qWarning() << "Failed to load configuration.";
    //     return;
    // }
    processManager->startPythonService();
    setinferenceStatus(true);
}

void AIController::stop()
{
    processManager->stopPythonService();
    setinferenceStatus(false);
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
