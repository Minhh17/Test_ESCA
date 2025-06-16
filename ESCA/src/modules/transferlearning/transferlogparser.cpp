#include "transferlogparser.h"
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonValue>
#include <QDebug>

TransferLogParser::TransferLogParser(QObject *parent)
    : QObject(parent)
{
}

void TransferLogParser::parseLine(const QString &line)
{
    QString trimmed = line.trimmed();
    if (trimmed.isEmpty())
        return;

    if (trimmed == "[FINISHED]") {
        emit finished();
        return;
    }

    if (trimmed.startsWith("[PROG]")) {
        QString progText = trimmed.mid(6).trimmed();
        emit epochSummaryUpdated(progText);
        return;
    }

    if (trimmed.startsWith("[HIST]")) {
        QString dataStr = trimmed.mid(6).trimmed();
        QStringList valuesStr = dataStr.split(',', Qt::SkipEmptyParts);
        QVector<double> values;
        values.reserve(valuesStr.size());
        for (const QString &val : valuesStr) {
            bool ok; double d = val.toDouble(&ok);
            if (ok) values.append(d);
        }
        emit histogramUpdated(values);
        return;
    }

    if (trimmed.startsWith("[PR]")) {
        QString jsonStr = trimmed.mid(4).trimmed();
        QJsonDocument doc = QJsonDocument::fromJson(jsonStr.toUtf8());
        if (doc.isArray()) {
            QJsonArray arr = doc.array();
            if (arr.size() >= 2) {
                QVector<double> recall, precision;
                QJsonArray recallArray = arr.at(0).toArray();
                QJsonArray precisionArray = arr.at(1).toArray();
                recall.reserve(recallArray.size());
                precision.reserve(precisionArray.size());
                for (const QJsonValue &val : recallArray)
                    recall.append(val.toDouble());
                for (const QJsonValue &val : precisionArray)
                    precision.append(val.toDouble());
                emit prCurveUpdated(recall, precision);
            }
        } else {
            qWarning() << "PR JSON invalid:" << jsonStr;
        }
        return;
    }

    if (trimmed.startsWith("[ROC]")) {
        QString jsonStr = trimmed.mid(5).trimmed();
        QJsonDocument doc = QJsonDocument::fromJson(jsonStr.toUtf8());
        if (doc.isArray()) {
            QJsonArray arr = doc.array();
            if (arr.size() >= 2) {
                QVector<double> fpr, tpr;
                QJsonArray fprArray = arr.at(0).toArray();
                QJsonArray tprArray = arr.at(1).toArray();
                fpr.reserve(fprArray.size());
                tpr.reserve(tprArray.size());
                for (const QJsonValue &val : fprArray)
                    fpr.append(val.toDouble());
                for (const QJsonValue &val : tprArray)
                    tpr.append(val.toDouble());
                emit rocCurveUpdated(fpr, tpr);
            }
        } else {
            qWarning() << "ROC JSON invalid:" << jsonStr;
        }
        return;
    }

    if (trimmed.startsWith("[EPOCH]")) {
        QString remainder = trimmed.mid(7).trimmed();
        QStringList parts = remainder.split('/');
        if (parts.size() == 2) {
            int currentEpoch = parts[0].toInt();
            int totalEpoch = parts[1].toInt();
            emit epochProgressUpdated(currentEpoch, totalEpoch);
        }
        return;
    }
}
