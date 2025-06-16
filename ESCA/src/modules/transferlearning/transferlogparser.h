#ifndef TRANSFERLOGPARSER_H
#define TRANSFERLOGPARSER_H

#include <QObject>
#include <QVector>

class TransferLogParser : public QObject
{
    Q_OBJECT
public:
    explicit TransferLogParser(QObject *parent = nullptr);

public slots:
    void parseLine(const QString &line);

signals:
    void epochProgressUpdated(int currentEpoch, int totalEpoch);
    void epochSummaryUpdated(QString summary);
    void histogramUpdated(QVector<double> values);
    void prCurveUpdated(QVector<double> recall, QVector<double> precision);
    void rocCurveUpdated(QVector<double> fpr, QVector<double> tpr);
    void finished();
};

#endif // TRANSFERLOGPARSER_H
