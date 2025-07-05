#include "transfercontroller.h"
#include <QDebug>

TransferController::TransferController(TransferEngine* engine,
                                       HistogramManager* hist,
                                       PRManager* pr,
                                       ROCManager* roc,
                                       QObject *parent)
    :QObject(parent),
    transferProcMng(engine ? engine : new TransferProcMng(this)),
    m_histogram(hist ? hist : new HistogramManager(this)),
    m_prManager(pr ? pr : new PRManager(this)),
    m_rocManager(roc ? roc : new ROCManager(this))
{

    qmlRegisterSingletonInstance("TransHistoImport", 1, 0, "TransHisto", m_histogram);
    qmlRegisterSingletonInstance("TransPRImport", 1, 0, "TransPR", m_prManager);
    qmlRegisterSingletonInstance("TransROCImport", 1, 0, "TransROC", m_rocManager);

    // Kết nối tín hiệu từ TransferProcMng tới TransferController
    connect(transferProcMng, &TransferEngine::epochProgressUpdated, this, &TransferController::updateEpochProgress);
    connect(transferProcMng, &TransferEngine::epochSummaryUpdated, this, &TransferController::updateLogSummary);
    connect(transferProcMng, &TransferEngine::histogramUpdated, m_histogram, &HistogramManager::updateEpochData);
    connect(transferProcMng, &TransferEngine::prCurveUpdated, m_prManager, &PRManager::computePRCurve);
    connect(transferProcMng, &TransferEngine::rocCurveUpdated, m_rocManager, &ROCManager::computeROCCurve);

    // Kết nối tín hiệu khi process hoàn thành    
    QObject::connect(transferProcMng, &TransferEngine::transFinished, this, &TransferController::stop);
    setEpoch(0);
}

TransferController::~TransferController()
{
    stop();
}

void TransferController::start()
{
	transferProcMng->setScriptPath(DataStorage::baseProject() + "/python_ai/tl_training.py");
	transferProcMng->start();
	setTlStatus(true);
}

void TransferController::startBaseTraining()
{
	transferProcMng->setScriptPath(DataStorage::baseProject() + "/python_ai/base_training.py");
	transferProcMng->start();
	setTlStatus(true);
}

void TransferController::stop()
{
    transferProcMng->stop();
    setTlStatus(false);
    setEpoch(0);
}

bool TransferController::tlStatus() const
{
    return m_tlStatus;
}

void TransferController::setTlStatus(bool newTlStatus)
{
    if (m_tlStatus == newTlStatus)
        return;
    m_tlStatus = newTlStatus;
    emit tlStatusChanged();
}

int TransferController::epoch() const
{
    return m_epoch;
}

void TransferController::setEpoch(int newEpoch)
{
    // if (m_epoch == newEpoch)
    //     return;
    m_epoch = newEpoch;
    emit epochChanged();
}

int TransferController::totalEpoch() const
{
    return m_totalEpoch;
}

void TransferController::setTotalEpoch(int newTotalEpoch)
{
    // if (m_totalEpoch == newTotalEpoch)
    //     return;
    m_totalEpoch = newTotalEpoch;
    emit totalEpochChanged();
}

QString TransferController::logText() const
{
    return m_logText;
}

void TransferController::setLogText(const QString &newLogText)
{
    if (m_logText == newLogText)
        return;
    m_logText = newLogText;
    emit logTextChanged();
}

void TransferController::updateEpochProgress(int currentEpoch, int totalEpoch)
{
    setEpoch(currentEpoch);
    setTotalEpoch(totalEpoch);
}

void TransferController::updateLogSummary(const QString &summary)
{
    // Cộng dồn log, mỗi summary cách nhau một dòng
    setLogText(m_logText + summary + "\n");
}
