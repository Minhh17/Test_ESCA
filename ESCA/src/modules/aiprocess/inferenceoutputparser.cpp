#include "inferenceoutputparser.h"
#include <QDebug>

InferenceOutputParser::InferenceOutputParser(QObject *parent)
    : QObject{parent}
{

}

void InferenceOutputParser::parseLine(const QString &line)
{
    QString outputStr = line.trimmed();
    if (outputStr.isEmpty())
        return;

    bool ok = false;
    float predValue = outputStr.toFloat(&ok);

    if (ok) {
        qInfo() << "Predict Result:" << predValue;
        emit resultReceived(predValue);
    } else if (outputStr == "Done Folder Mode") {
        emit doneProcess();
    } else {
        qWarning() << "Warning from Python:" << outputStr;
        emit abnormalDetect(outputStr);
    }
}
