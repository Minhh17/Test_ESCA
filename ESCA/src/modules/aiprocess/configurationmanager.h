// ConfigurationManager.h
#ifndef CONFIGURATIONMANAGER_H
#define CONFIGURATIONMANAGER_H

#include <QObject>
#include <QJsonObject>
#include <QJsonDocument>
#include <QFile>
#include <QStandardPaths>
#include <QDir>

class ConfigurationManager : public QObject
{
    Q_OBJECT
    // Các thuộc tính của phần REALTIME
    Q_PROPERTY(QString logPath READ logPath WRITE setLogPath NOTIFY logPathChanged)
    Q_PROPERTY(double manualThreshold READ manualThreshold WRITE setManualThreshold NOTIFY manualThresholdChanged)
    Q_PROPERTY(int sampleSize READ sampleSize WRITE setSampleSize NOTIFY sampleSizeChanged)
    Q_PROPERTY(int second READ second WRITE setSecond NOTIFY secondChanged)
    Q_PROPERTY(int channels READ channels WRITE setChannels NOTIFY channelsChanged)
    Q_PROPERTY(int samplingRate READ samplingRate WRITE setSamplingRate NOTIFY samplingRateChanged)
    Q_PROPERTY(bool importFile READ importFile WRITE setImportFile NOTIFY importFileChanged)
    Q_PROPERTY(QString modelPath READ modelPath WRITE setModelPath NOTIFY modelPathChanged FINAL)
    Q_PROPERTY(double threshold READ threshold WRITE setThreshold NOTIFY thresholdChanged FINAL)
    Q_PROPERTY(double max READ max WRITE setMax NOTIFY maxChanged FINAL)
    Q_PROPERTY(double min READ min WRITE setMin NOTIFY minChanged FINAL)
    Q_PROPERTY(QString folderPath READ folderPath WRITE setFolderPath NOTIFY folderPathChanged FINAL)
    Q_PROPERTY(bool useTensorRT READ useTensorRT WRITE setUseTensorRT NOTIFY useTensorRTChanged FINAL)
    Q_PROPERTY(QString trtModelPath READ trtModelPath WRITE setTrtModelPath NOTIFY trtModelPathChanged FINAL)
    Q_PROPERTY(int gfccChannels READ gfccChannels WRITE setGfccChannels NOTIFY gfccChannelsChanged FINAL)
    Q_PROPERTY(double gfccFMin READ gfccFMin WRITE setGfccFMin NOTIFY gfccFMinChanged FINAL)
    Q_PROPERTY(double gfccWindowTime READ gfccWindowTime WRITE setGfccWindowTime NOTIFY gfccWindowTimeChanged FINAL)
    Q_PROPERTY(double gfccHopTime READ gfccHopTime WRITE setGfccHopTime NOTIFY gfccHopTimeChanged FINAL)
public:
    explicit ConfigurationManager(QObject *parent = nullptr);
    ~ConfigurationManager();

    // Getters
    QString logPath() const;
    double manualThreshold() const;
    int second() const;
    int channels() const;
    int samplingRate() const;
    bool importFile() const;

    // Setters
    void setLogPath(const QString &logPath);
    void setManualThreshold(double manualThreshold);
    void setSecond(int second);
    void setChannels(int channels);
    void setSamplingRate(int samplingRate);
    void setImportFile(bool importFile);

    // Phương thức tải và lưu cấu hình
    Q_INVOKABLE bool loadConfig();
    Q_INVOKABLE bool saveConfig() const;

    QString modelPath() const;
    void setModelPath(const QString &newModelPath);

    double threshold() const;
    void setThreshold(double newThreshold);

    double min() const;
    void setMin(double newMin);

    double max() const;
    void setMax(double newMax);

    QString folderPath() const;
    void setFolderPath(const QString &newFolderPath);

    int sampleSize() const;
    void setSampleSize(int newSampleSize);


    bool useTensorRT() const;
    void setUseTensorRT(bool newUseTensorRT);

    QString trtModelPath() const;
    void setTrtModelPath(const QString &newTrtModelPath);

    int gfccChannels() const;
    void setGfccChannels(int newChannels);

    double gfccFMin() const;
    void setGfccFMin(double newFMin);

    double gfccWindowTime() const;
    void setGfccWindowTime(double newWindow);

    double gfccHopTime() const;
    void setGfccHopTime(double newHop);

signals:
    void logPathChanged();
    void manualThresholdChanged();
    void secondChanged();
    void channelsChanged();
    void samplingRateChanged();
    void importFileChanged();

    void modelPathChanged();

    void thresholdChanged();
    void maxChanged();
    void minChanged();

    void folderPathChanged();

    void sampleSizeChanged();

    void useTensorRTChanged();
    void trtModelPathChanged();
    void gfccChannelsChanged();
    void gfccFMinChanged();
    void gfccWindowTimeChanged();
    void gfccHopTimeChanged();

private:
    QString m_logPath;
    double m_manualThreshold;
    int m_sampleSize;
    int m_second;
    int m_channels;
    int m_samplingRate;
    bool m_importFile;
    // QJsonObject m_fullConfig;

    QString m_filePath;

    void loadDefaults();
    void loadMetricsDetails();
    void applyConfig(const QJsonObject& realtime);
    QJsonObject generateConfig() const;

    QString m_modelPath;

    double m_threshold;
    double m_max;
    double m_min;
    QString m_folderPath;

    bool m_useTensorRT;
    QString m_trtModelPath;
    int m_gfccChannels;
    double m_gfccFMin;
    double m_gfccWindowTime;
    double m_gfccHopTime;
};

#endif // CONFIGURATIONMANAGER_H
