#include "inferenceoutputparser.h"
#include "latencytracker.h"
#include <QDebug>
#include <QByteArray>

InferenceOutputParser::InferenceOutputParser(QObject *parent)
    : QObject{parent}
{

}

void InferenceOutputParser::parseLine(const QString &line)
{
    QString outputStr = line.trimmed();
    if (outputStr.isEmpty())
        return;

    if (outputStr.startsWith("METRIC")) {
        const QStringList parts = outputStr.split(' ');
        //qDebug()<<"parseLine";
        if (parts.size() >= 3) {
            const QString key = parts.at(1);
            bool ok = false;
            //qDebug()<<"parseLine2 "<< key;
            double value = parts.at(2).toDouble(&ok);

            //qDebug()<<"parseLine3 "<< value;
            if (ok) {
                if (key == "read_ms") {
                    LatencyTracker::pythonRead(value);
                } else if (key == "gfcc_ms") {
                    LatencyTracker::gfccTime(value);
                } else if (key == "infer_ms") {
                    LatencyTracker::inferenceTime(value);
                }
            }
        }
        return;
    }

    bool ok = false;
    float predValue = outputStr.toFloat(&ok);

    if (ok) {
        qInfo() << "Predict Result:" << predValue;
        LatencyTracker::resultReceived();
        emit resultReceived(predValue);
    } else if (outputStr == "Done Folder Mode") {
        emit doneProcess();
    } else {
        qWarning() << "Warning from Python:" << outputStr;
        emit abnormalDetect(outputStr);
    }
}
