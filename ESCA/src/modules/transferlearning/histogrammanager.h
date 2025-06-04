#ifndef HISTOGRAMMANAGER_H
#define HISTOGRAMMANAGER_H

#include <QObject>
#include <QVector>
#include <QVariant>
#include <QVariantList>

class HistogramManager : public QObject
{
    Q_OBJECT
    // Q_PROPERTY chứa danh sách các histogram của các epoch quan trọng.
    // Mỗi phần tử là một QVariantMap với key "epoch" (int) và "histogram" (QVariantList gồm 30 số nguyên)
    Q_PROPERTY(QVariantList importantHistograms READ importantHistograms NOTIFY importantHistogramsChanged)

public:
    explicit HistogramManager(QObject *parent = nullptr);

    QVariantList importantHistograms() const;

    double getMinValue() const;

    void setMinValue(double newMinValue);

public slots:
    // Slot nhận dữ liệu raw của một epoch (dữ liệu kiểu QVector<double>)
    void updateEpochData(QVector<double> values);
    // Method lưu toàn bộ raw data của tất cả các epoch vào file (JSON)
    bool saveAllRawData(const QString &fileName);

signals:
    // Khi danh sách importantHistograms thay đổi (sẽ được truyền sang QML)
    void importantHistogramsChanged();

private:
    // Lưu toàn bộ raw data của từng epoch
    QVector<QVector<double>> m_allEpochs;
    // Số epoch đã nhận và min max của data
    int m_epochCount;
    double minValue;
    double maxValue;
    // Property chứa các histogram của các epoch quan trọng (epoch 1, 20, 40, 60, 81)
    QVariantList m_importantHistograms;
    // Tính histogram từ raw data với số bins cho trước (mặc định 30)
    QVector<int> computeHistogram(QVector<double>& data, int bins = 30);
    // Cập nhật lại m_importantHistograms từ m_allEpochs
    void updateImportantHistograms();
};

#endif // HISTOGRAMMANAGER_H
