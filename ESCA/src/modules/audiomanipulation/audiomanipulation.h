#ifndef AUDIOMANIPULATION_H
#define AUDIOMANIPULATION_H

#include <QObject>
#include <QString>
#include <QProcess>
#include <QDebug>

#include "../../config/config.h"

class AudioManipulation : public QObject
{
    Q_OBJECT

public:
    explicit AudioManipulation(QObject *parent = nullptr);
    ~AudioManipulation();

    Q_INVOKABLE void extractMFCC(QString audioPath);
    Q_INVOKABLE void extractGFCC(QString audioPath);
    Q_INVOKABLE void extractFrequency(QString audioPath);
    Q_INVOKABLE void splitAudio(QString source, QString destination, QString duration);
    Q_INVOKABLE void prepareDataset(QString normalPath, QString anomalyPath, QString outputPath);

private:
    QProcess *m_process;

private slots:
    void onProcessFinished(int exitCode, QProcess::ExitStatus exitStatus);
    void onProcessError(QProcess::ProcessError error);
};

#endif // AUDIOMANIPULATION_H
