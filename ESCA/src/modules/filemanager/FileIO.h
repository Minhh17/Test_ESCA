#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QFile>
#include <QAbstractListModel>
#include <QDir>
#include <QFileInfoList>

class FolderListModel : public QAbstractListModel {
    Q_OBJECT
public:
    explicit FolderListModel(QObject *parent = nullptr) : QAbstractListModel(parent) {
        // Khởi tạo
        refresh();
    }

    void refresh() {
        beginResetModel();
        // Làm mới danh sách
        QDir dir(currentFolder);
        QFileInfoList files = dir.entryInfoList(QDir::NoDotAndDotDot | QDir::AllEntries);
        fileList.clear();
        for (const QFileInfo &fileInfo : files) {
            fileList.append(fileInfo);
        }
        endResetModel();
    }
private:
    QString currentFolder;
    QList<QFileInfo> fileList;
};

class FileIO : public QObject {
    Q_OBJECT

public:
    explicit FileIO(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE bool fileExists(const QString &filePath) {
        QFile file(filePath);
        return file.exists();
    }

    Q_INVOKABLE bool removeFile(const QString &filePath) {
        QFile file(filePath);
        return file.remove();
    }
};

#endif // FILEIO_H
