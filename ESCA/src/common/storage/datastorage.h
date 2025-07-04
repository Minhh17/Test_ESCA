#ifndef DATASTORAGE_H
#define DATASTORAGE_H

#include <QString>
#include <QDir>
#include <QDebug>

namespace DataStorage {

inline QString basePath()
{
    QString env = qEnvironmentVariable("ESCA_DATA_PATH");
    //qDebug()<<"qEnvironmentVariable"<< env;
    if (!env.isEmpty())
        return env + "/data_storage";
    return QDir::homePath() + QDir::separator() + "data_storage";
}

inline QString baseProject()
{
    QString env = qEnvironmentVariable("ESCA_DATA_PATH");
    //qDebug()<<"qEnvironmentVariable"<< env;
    if (!env.isEmpty())
        return env;
    return QDir::homePath();
}

inline QString filePath(const QString &relative)
{
    QString base = basePath();
    QDir dir(base);
    if (!dir.exists())
        dir.mkpath(".");
    return dir.filePath(relative);
}

} // namespace DataStorage

#endif // DATASTORAGE_H
