#ifndef PRMANAGER_H
#define PRMANAGER_H

#include "metricsmanagerbase.h"
#include <QVector>
#include <QVariant>
#include <QVariantList>
#include <QPair>
#include <memory>

class PRManager : public MetricsManagerBase
{
    Q_OBJECT
    // Mỗi phần tử là một map với key: "epoch" (int), "recall" (QVariantList) và "precision" (QVariantList)
    Q_PROPERTY(QVariantList importantPRCurves READ importantPRCurves NOTIFY importantMetricsChanged)

public:
    explicit PRManager(QObject *parent = nullptr);

    QVariantList importantPRCurves() const;

public slots:
    // Slot nhận dữ liệu PR của một epoch (recall và precision)
    void computePRCurve(const QVector<double>& recall, const QVector<double>& precision);
    bool saveAllPRData(const QString &fileName);  //save to file

signals:
   void importantMetricsChanged();

private:
    // Mỗi phần tử là một pair: first = recall, second = precision
    std::unique_ptr<QVector<QPair<QVector<double>, QVector<double>>>> m_allPRData;

    void updateImportantMetrics() override;
};

#endif // PRMANAGER_H
