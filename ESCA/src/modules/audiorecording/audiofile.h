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
              QObject *parent = nullptr);

    ~AudioFile();

public slots:
    void startRecording();
    void stopRecording();

    void writeChunk(const QByteArray &data);
    void appendData(const QByteArray &data);

private:
    QString m_outputDir;
    QAudioFormat m_audioFormat;
    quint32 dataSize = 0;

    QFile m_outFile;    
    // int m_fileIndex;
    QMutex m_mutex;

    void createFile();
    void writeWavHeader();
    void finalizeWavHeader(quint32 dataSize);

};
