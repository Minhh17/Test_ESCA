#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
// #include <QtWidgets/QApplication>
#include <QDebug>

#include "./src/modules/audiorecording/recordingcontroller.h"
#include "./src/modules/audiomanipulation/audiomanipulation.h"
#include "./src/modules/audiorecording/recordingchart.h"
#include "./src/modules/audiorecording/audioconfig.h"
#include "./src/modules/systeminformation/systeminformationcontroller.h"
#include "./src/modules/filemanager/FileIO.h"
#include "./src/modules/aiprocess/aicontroller.h"
#include "./src/modules/aiprocess/configurationmanager.h"
#include "./src/config/configapp.h"
#include "./src/modules/transferlearning/transfercontroller.h"
#include "./src/modules/transferlearning/transferconfig.h"
#include "./src/modules/notification/notificationlogger.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QCoreApplication::setOrganizationName("HUST-SIST-SPARC");
    QCoreApplication::setOrganizationDomain("sparc.com");
    QCoreApplication::setApplicationName("ESCA");

    QString homeDir = QStandardPaths::writableLocation(QStandardPaths::HomeLocation);
    // Tạo thư mục nếu chưa tồn tại
    QDir().mkpath(homeDir);

    QString filePath = homeDir + QDir::separator() + "config.json";
    QFile configPath(filePath);

    if (!configPath.exists()) {
        ConfigApp configApp(filePath);
        configApp.generateConfig();
    }

    RecordingController recordingController;
    SystemInformationController systemInformationController;
    AIController aiController;
    TransferController transferController;
    NotificationLogger notificationLogger;

    // AudioConfig audioConfig;
    QQmlApplicationEngine engine;

    // Khởi tạo ConfigurationManager và tải cấu hình của Inference
    ConfigurationManager configManager;
    configManager.loadConfig();
    TransferConfig transferConfig;
    transferConfig.loadConfig();

    engine.addImportPath("qrc:/qml/imports"); // Thêm phần QML vô C++
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));

    engine.rootContext()->setContextProperty("RecordingObject", &recordingController);
    engine.rootContext()->setContextProperty("AIObject", &aiController);
    engine.rootContext()->setContextProperty("TransferObject", &transferController);

    engine.rootContext()->setContextProperty("ConfigManager", &configManager);
    engine.rootContext()->setContextProperty("TransferConfig", &transferConfig);

    engine.rootContext()->setContextProperty("NotificationLoggerCpp", &notificationLogger);

    qmlRegisterType<FileIO>("FileIO", 1, 0, "FileIO");
    qmlRegisterType<SystemInformationController>("SystemInformation", 1, 0, "SystemInformationController");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    // Should be use the qmlRegisterType<MyQMLType> or slots in C++ because it just calls function from QML to C++
    // and it's enssetially a backend of the QML
    AudioManipulation audioManipulation;
    engine.rootContext()->setContextProperty("AudioManipulationObject", &audioManipulation);

    return app.exec();
}


