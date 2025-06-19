#include "prmanager.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>

PRManager::PRManager(QObject *parent)
    : MetricsManagerBase(parent),
    m_allPRData(std::make_unique<QVector<QPair<QVector<double>, QVector<double>>>>())
{
}

void PRManager::computePRCurve(const QVector<double>& recall, const QVector<double>& precision)
{    
    m_allPRData->append(qMakePair(recall, precision));
    m_epochCount++;

    if (isImportantEpoch(m_epochCount))
    {
        updateImportantMetrics();
    }
}

void PRManager::updateImportantMetrics()
{
    QVariantList list;
    // Các index của epoch mẫu: 0, 19, 39, 59, 80
    QList<int> indices = {0, 19, 39, 59, 80};
    for (int idx : indices) {
        if (idx < m_allPRData->size()) {
            const QPair<QVector<double>, QVector<double>> &pair = m_allPRData->at(idx);
            QVariantList recallList, precisionList;
            for (double r : pair.first)
                recallList.append(r);
            for (double p : pair.second)
                precisionList.append(p);
            QVariantMap epochMap;
            epochMap["epoch"] = idx + 1;
            epochMap["recall"] = recallList;
            epochMap["precision"] = precisionList;
            list.append(epochMap);
        }
    }
    setImportantMetrics(list);
}

bool PRManager::saveAllPRData(const QString &fileName)
{
    QJsonArray epochsArray;
    for (int i = 0; i < m_allPRData->size(); i++) {
        QJsonObject epochObj;
        QJsonArray recallArray;
        QJsonArray precisionArray;
        const QPair<QVector<double>, QVector<double>> &pair = m_allPRData->at(i);
        for (double r : pair.first)
            recallArray.append(r);
        for (double p : pair.second)
            precisionArray.append(p);
        epochObj["epoch"] = i + 1;
        epochObj["recall"] = recallArray;
        epochObj["precision"] = precisionArray;
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

QVariantList PRManager::importantPRCurves() const
{
    return importantMetrics();
}
