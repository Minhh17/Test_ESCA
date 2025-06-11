#ifndef INFERENCEOUTPUTPARSER_H
#define INFERENCEOUTPUTPARSER_H

#include <QObject>

class InferenceOutputParser : public QObject
{
    Q_OBJECT
public:
    explicit InferenceOutputParser(QObject *parent = nullptr);

public slots:
    void parseLine(const QString &line);

signals:
    void resultReceived(float predValue);
    void abnormalDetect(const QString &outputStr);
    void doneProcess();

};

#endif // INFERENCEOUTPUTPARSER_H
