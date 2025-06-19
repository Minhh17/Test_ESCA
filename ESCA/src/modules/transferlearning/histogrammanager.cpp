#include "histogrammanager.h"
#include <algorithm>
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>

HistogramManager::HistogramManager(QObject *parent)
    : MetricsManagerBase(parent),
    m_allEpochs(std::make_unique<QVector<QVector<double>>>()),
    minValue(0.0),
    maxValue(0.0)
{
}

QVector<int> HistogramManager::computeHistogram(const QVector<double>& data, int bins)
{
    QVector<int> hist(bins, 0);
    if(data.isEmpty())
        return hist;

    minValue = *std::min_element(data.begin(), data.end());
    maxValue = *std::max_element(data.begin(), data.end());

    // Nếu tất cả các giá trị bằng nhau, gán toàn bộ số mẫu vào bin cuối cùng
    if (minValue == maxValue) {
        hist[bins - 1] = data.size();
        return hist;
    }

    double binSize = (maxValue - minValue) / bins;
    for (double value : data) {
        int index = static_cast<int>((value - minValue) / binSize);
        if (index >= bins)
            index = bins - 1;
        hist[index]++;
    }
    return hist;
}

void HistogramManager::updateImportantMetrics()
{
    QVariantList list;
    // Chọn các epoch: epoch 1, 20, 40, 60, 81 (index 0, 19, 39, 59, 80)
    QList<int> indices = {0, 19, 39, 59, 80};
    for (int idx : indices) {
        if (idx < m_allEpochs->size()) {
            QVector<int> hist = computeHistogram(m_allEpochs->at(idx), 30);
            QVariantList histVariant;
            for (int count : hist)
                histVariant.append(count);
            QVariantMap epochMap;
            epochMap["epoch"] = idx + 1; // Hiển thị epoch bắt đầu từ 1
            epochMap["histogram"] = histVariant;
            epochMap["min"] = minValue;
            epochMap["max"] = maxValue;
            list.append(epochMap);
        }        
    }
    setImportantMetrics(list);
}

void HistogramManager::updateEpochData(QVector<double> values)
{
    // Lưu raw data của epoch mới
    m_allEpochs->append(values);
    m_epochCount++;

    // Nếu epoch vừa nhận là một trong các epoch quan trọng, cập nhật lại danh sách
    if (isImportantEpoch(m_epochCount)) {
        updateImportantMetrics();
    }
}

bool HistogramManager::saveAllRawData(const QString &fileName)
{
    QJsonArray epochsArray;
    for (const QVector<double>& epoch : *m_allEpochs) {
        QJsonArray epochArray;
        for (double v : epoch)
            epochArray.append(v);
        epochsArray.append(epochArray);
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

void HistogramManager::setMinValue(double newMinValue)
{
    minValue = newMinValue;
}

QVariantList HistogramManager::importantHistograms() const
{
    return importantMetrics();
}

