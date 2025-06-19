#ifndef METRICSMANAGERBASE_H
#define METRICSMANAGERBASE_H

#include <QObject>
#include <QVariantList>
#include <QList>

class MetricsManagerBase : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList importantMetrics READ importantMetrics NOTIFY importantMetricsChanged)
public:
    explicit MetricsManagerBase(QObject *parent = nullptr);
    virtual ~MetricsManagerBase() = default;

    QVariantList importantMetrics() const;

signals:
    void importantMetricsChanged();

public slots:
    virtual void reset();
    virtual void updateImportantMetrics() = 0;

protected:
    bool isImportantEpoch(int epoch) const;
    void setImportantMetrics(const QVariantList &list);

    int m_epochCount;
    QList<int> m_sampleIndices;
    QVariantList m_importantMetrics;
};

#endif // METRICSMANAGERBASE_H
