#ifndef CONFIGAPP_H
#define CONFIGAPP_H

#include <QJsonObject>
#include <QJsonArray>
#include <QString>
#include <QJsonDocument>
#include <QFile>

class ConfigApp {
public:
    explicit ConfigApp(QString &filePath);
    void generateConfig();
    QString getHomePath();

private:
    QString filePath;

    void saveToFile(const QJsonObject &jsonObject);
};

#endif // CONFIGAPP_H
