#include "transfercontroller.h"
#include <QDebug>

TransferController::TransferController(QObject *parent)
    :QObject(parent)
{
    transferProcMng = new TransferProcMng(this);
    m_histogram = new HistogramManager(this);
    m_prManager = new PRManager(this);
    m_rocManager = new ROCManager(this);

    qmlRegisterSingletonInstance("TransHistoImport", 1, 0, "TransHisto", m_histogram);
    qmlRegisterSingletonInstance("TransPRImport", 1, 0, "TransPR", m_prManager);
    qmlRegisterSingletonInstance("TransROCImport", 1, 0, "TransROC", m_rocManager);

    // Kết nối tín hiệu từ TransferProcMng tới TransferController
    connect(transferProcMng, &TransferProcMng::epochProgressUpdated, this, &TransferController::updateEpochProgress);
    connect(transferProcMng, &TransferProcMng::epochSummaryUpdated, this, &TransferController::updateLogSummary);
    connect(transferProcMng, &TransferProcMng::histogramUpdated, m_histogram, &HistogramManager::updateEpochData);
    connect(transferProcMng, &TransferProcMng::prCurveUpdated, m_prManager, &PRManager::computePRCurve);
    connect(transferProcMng, &TransferProcMng::rocCurveUpdated, m_rocManager, &ROCManager::computeROCCurve);

    // Kết nối tín hiệu khi process hoàn thành
    QObject::connect(transferProcMng, &TransferProcMng::transFinished, this, &TransferController::stop);
    setEpoch(0);
}

TransferController::~TransferController()
{
    stop();
}

void TransferController::start()
{
    // Đọc cấu hình
    // if (!configManager->loadConfig("python_ai/ai_module/config/config.json")) {
    //     qWarning() << "Failed to load configuration.";
    //     return;
    // }
    transferProcMng->startPythonService();
    setTlStatus(true);
}

void TransferController::stop()
{
    transferProcMng->stopPythonService();
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
