#ifndef PRMANAGER_H
#define PRMANAGER_H

#include <QObject>
#include <QVector>
#include <QVariant>
#include <QVariantList>
#include <QPair>

class PRManager : public QObject
{
    Q_OBJECT
    // Mỗi phần tử là một map với key: "epoch" (int), "recall" (QVariantList) và "precision" (QVariantList)
    Q_PROPERTY(QVariantList importantPRCurves READ importantPRCurves NOTIFY importantPRCurvesChanged)

public:
    explicit PRManager(QObject *parent = nullptr);

    QVariantList importantPRCurves() const;

public slots:
    // Slot nhận dữ liệu PR của một epoch (recall và precision)
    void computePRCurve(const QVector<double>& recall, const QVector<double>& precision);
    bool saveAllPRData(const QString &fileName);  //save to file

signals:
    void importantPRCurvesChanged();

private:
    // Mỗi phần tử là một pair: first = recall, second = precision
    QVector<QPair<QVector<double>, QVector<double>>> m_allPRData;
    // Số epoch đã nhận (để đánh dấu thứ tự)
    int m_epochCount;

    void updateImportantPRCurves();
    QVariantList m_importantPRCurves;
};

#endif // PRMANAGER_H
