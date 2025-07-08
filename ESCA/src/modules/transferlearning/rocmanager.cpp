#include "rocmanager.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>

ROCManager::ROCManager(QObject *parent)
    : MetricsManagerBase(parent),
    m_allROCData(std::make_unique<QVector<QPair<QVector<double>, QVector<double>>>>())
{
}

void ROCManager::computeROCCurve(const QVector<double>& fpr, const QVector<double>& tpr)
{
    // Lưu dữ liệu ROC của epoch mới vào container
    m_allROCData->append(qMakePair(fpr, tpr));
    m_epochCount++;

    // Nếu epoch vừa nhận là một trong các epoch quan trọng, cập nhật lại danh sách
    // (ví dụ: epoch 1, 20, 40, 60, 81 tương ứng với chỉ số 0, 19, 39, 59, 80)
    if (isImportantEpoch(m_epochCount))
    {        
        updateImportantMetrics();
    }
}

void ROCManager::updateImportantMetrics()
{
    QVariantList list;
    // Danh sách các chỉ số quan trọng (0-based): 0, 19, 39, 59, 80
    QList<int> indices = {0, 4, 9, 14, 19};
    for (int idx : indices) {
        if (idx < m_allROCData->size()) {
            const QPair<QVector<double>, QVector<double>> &pair = m_allROCData->at(idx);
            QVariantList fprList, tprList;
            for (double v : pair.first)
                fprList.append(v);
            for (double v : pair.second)
                tprList.append(v);
            QVariantMap epochMap;
            epochMap["epoch"] = idx + 1;  // Hiển thị epoch bắt đầu từ 1
            epochMap["fpr"] = fprList;
            epochMap["tpr"] = tprList;
            list.append(epochMap);
        }
    }
    setImportantMetrics(list);
}

bool ROCManager::saveAllROCData(const QString &fileName)
{
    QJsonArray epochsArray;
    for (int i = 0; i < m_allROCData->size(); i++) {
        QJsonObject epochObj;
        QJsonArray fprArray;
        QJsonArray tprArray;
        const QPair<QVector<double>, QVector<double>> &pair = m_allROCData->at(i);
        for (double v : pair.first)
            fprArray.append(v);
        for (double v : pair.second)
            tprArray.append(v);
        epochObj["epoch"] = i + 1;
        epochObj["fpr"] = fprArray;
        epochObj["tpr"] = tprArray;
        epochsArray.append(epochObj);
    }
    QJsonObject root;
    root["epochs"] = epochsArray;
    QJsonDocument doc(root);

    QFile file(fileName);
    if (!file.open(QIODevice::WriteOnly))
        return false;
    file.write(doc.toJson(QJsonDocument::Indented));
    file.close();
    return true;
}

QVariantList ROCManager::importantROCCurves() const
{
    return importantMetrics();
}
