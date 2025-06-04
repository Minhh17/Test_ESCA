#include <QFile>
#include <QDataStream>
#include <QAudioFormat>
#include <QByteArray>
#include <QDir>
#include <QMutex>
#include <QDataStream>
#include <QDateTime>

class AudioFile : public QObject{
    Q_OBJECT

public:
    AudioFile(const QString &outputDir,
              const QAudioFormat &format,
              double durationSeconds = 2.0,
              QObject *parent = nullptr);

    ~AudioFile();

public slots:
    void startRecording();
    void stopRecording();

    void writeAudioData(const QByteArray &data);
    void writeDataForever(const QByteArray &data);

private:
    QString m_outputDir;
    QAudioFormat m_audioFormat;
    double m_durationSeconds;
    quint32 m_chunkSize;
    quint32 dataSize = 0;

    QFile m_outFile;    
    // int m_fileIndex;
    QMutex m_mutex;

    QByteArray m_buffer1;
    QByteArray m_buffer2;
    bool m_usingBuffer1;

    void createFile();
    void writeWavHeader();
    void finalizeWavHeader(quint32 dataSize);

};
