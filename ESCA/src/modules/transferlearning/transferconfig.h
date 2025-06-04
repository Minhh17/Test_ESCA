#ifndef TRANSFERCONFIG_H
#define TRANSFERCONFIG_H

#include <QObject>
#include <QJsonObject>
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include <QDebug>
#include <QStandardPaths>
#include <QDir>

class TransferConfig : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString baseWeightPath READ baseWeightPath WRITE setBaseWeightPath NOTIFY baseWeightPathChanged)
    Q_PROPERTY(QString tfrecordUsedPath READ tfrecordUsedPath WRITE setTfrecordUsedPath NOTIFY tfrecordUsedPathChanged)
    Q_PROPERTY(QString tfrecordNewPath READ tfrecordNewPath WRITE setTfrecordNewPath NOTIFY tfrecordNewPathChanged)
    Q_PROPERTY(QString savePath READ savePath WRITE setSavePath NOTIFY savePathChanged)

    Q_PROPERTY(int batchSize READ batchSize WRITE setBatchSize NOTIFY batchSizeChanged)
    Q_PROPERTY(double learningRate READ learningRate WRITE setLearningRate NOTIFY learningRateChanged)
    Q_PROPERTY(int epoch READ epoch WRITE setEpoch NOTIFY epochChanged)
    Q_PROPERTY(double beta READ beta WRITE setBeta NOTIFY betaChanged)

public:
    explicit TransferConfig(QObject *parent = nullptr);

    QString baseWeightPath() const;
    void setBaseWeightPath(const QString &path);

    QString tfrecordUsedPath() const;
    void setTfrecordUsedPath(const QString &path);

    QString tfrecordNewPath() const;
    void setTfrecordNewPath(const QString &path);

    QString savePath() const;
    void setSavePath(const QString &path);

    int batchSize() const;
    void setBatchSize(int size);

    double learningRate() const;
    void setLearningRate(double rate);

    int epoch() const;
    void setEpoch(int epoch);

    double beta() const;
    void setBeta(double beta);

    Q_INVOKABLE bool saveConfig() const;
    Q_INVOKABLE bool loadConfig();

signals:
    void baseWeightPathChanged();
    void tfrecordUsedPathChanged();
    void tfrecordNewPathChanged();
    void savePathChanged();
    void batchSizeChanged();
    void learningRateChanged();
    void epochChanged();
    void betaChanged();

private:
    QString m_baseWeightPath;
    QString m_tfrecordUsedPath;
    QString m_tfrecordNewPath;
    QString m_savePath;

    int m_batchSize;
    double m_learningRate;
    int m_epoch;
    double m_beta;

    void loadDefaults();
    QString m_filePath;
};

#endif // TRANSFERCONFIG_H
