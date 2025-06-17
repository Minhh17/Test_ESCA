#ifndef ROCMANAGER_H
#define ROCMANAGER_H

#include "metricsmanagerbase.h"
#include <QVector>
#include <QVariant>
#include <QVariantList>
#include <QPair>

class ROCManager : public MetricsManagerBase
{
    Q_OBJECT
    // Q_PROPERTY chứa danh sách các ROC Curve của các epoch quan trọng.
    // Mỗi phần tử là một QVariantMap với key "epoch" (int), "fpr" (QVariantList) và "tpr" (QVariantList)
    Q_PROPERTY(QVariantList importantROCCurves READ importantROCCurves NOTIFY importantMetricsChanged)

public:
    explicit ROCManager(QObject *parent = nullptr);

    QVariantList importantROCCurves() const;

public slots:
    // Slot nhận dữ liệu ROC của một epoch (FPR và TPR)
    void computeROCCurve(const QVector<double>& fpr, const QVector<double>& tpr);
    // Phương thức lưu toàn bộ dữ liệu ROC (cho tất cả các epoch) vào file JSON
    bool saveAllROCData(const QString &fileName);

signals:
    void importantMetricsChanged();

private:
    // Lưu toàn bộ dữ liệu ROC của từng epoch:
    // Mỗi phần tử là một pair: first = fpr, second = tpr
    QVector<QPair<QVector<double>, QVector<double>>> m_allROCData;

    // Property chứa các ROC Curve của các epoch quan trọng (epoch 1, 20, 40, 60, 81)
    // Hàm cập nhật lại m_importantROCCurves từ m_allROCData
    void updateImportantROCCurves();

};

#endif // ROCMANAGER_H
