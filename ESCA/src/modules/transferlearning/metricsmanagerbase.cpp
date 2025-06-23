#include "metricsmanagerbase.h"

MetricsManagerBase::MetricsManagerBase(QObject *parent)
    : QObject(parent),
    m_epochCount(0),
    m_sampleIndices{1, 20, 40, 60, 81}
{
}

QVariantList MetricsManagerBase::importantMetrics() const
{
    return m_importantMetrics;
}

void MetricsManagerBase::reset()
{
    m_epochCount = 0;
    m_importantMetrics.clear();
    emit importantMetricsChanged();
}

bool MetricsManagerBase::isImportantEpoch(int epoch) const
{
    return m_sampleIndices.contains(epoch);
}

void MetricsManagerBase::setImportantMetrics(const QVariantList &list)
{
    m_importantMetrics = list;
    emit importantMetricsChanged();
}
