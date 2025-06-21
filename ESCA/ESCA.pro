QT = core
QT += qml multimedia widgets network quick concurrent
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    src/common/process/process.cpp \
    src/config/configapp.cpp \
    src/modules/aiprocess/aicontroller.cpp \
    src/modules/aiprocess/configurationmanager.cpp \
    src/modules/aiprocess/inferenceoutputparser.cpp \
    src/modules/aiprocess/processmanager.cpp \
    src/modules/aiprocess/sharedmemorymanager.cpp \
    src/modules/audiomanipulation/audiomanipulation.cpp \
    src/modules/audiorecording/audioconfig.cpp \
    src/modules/audiorecording/audiofile.cpp \
    src/modules/audiorecording/recorddevice.cpp \
    src/modules/audiorecording/recordingchart.cpp \
    src/modules/audiorecording/recordingcontroller.cpp \
    src/modules/audiorecording/recordio.cpp \
    src/modules/notification/alertmanager.cpp \
    src/modules/notification/anomalylogger.cpp \
    src/modules/notification/notificationlogger.cpp \
    src/modules/systeminformation/systeminformationcontroller.cpp \
    src/modules/filemanager/filemanager.cpp \
    src/modules/transferlearning/histogrammanager.cpp \
    src/modules/transferlearning/metricsmanagerbase.cpp \
    src/modules/transferlearning/prmanager.cpp \
    src/modules/transferlearning/rocmanager.cpp \
    src/modules/transferlearning/transferconfig.cpp \
    src/modules/transferlearning/transfercontroller.cpp \
    src/modules/transferlearning/transferlogparser.cpp \
    src/modules/transferlearning/transferprocmng.cpp

# RESOURCES += qml.qrc
RESOURCES += \
    $$files(qml/*)

# Additional import path used to resolve    QML modules in Qt Creator's code model
QML_IMPORT_PATH = qml/imports

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /home/haiminh/Desktop
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    # src/common/chartview.h \
    src/common/process/process.h \
    src/common/storage/datastorage.h \
    src/config/config.h \
    src/config/configapp.h \
    src/modules/aiprocess/aicontroller.h \
    src/modules/aiprocess/configurationmanager.h \
    src/modules/aiprocess/inferenceengine.h \
    src/modules/aiprocess/inferenceoutputparser.h \
    src/modules/aiprocess/processmanager.h \
    src/modules/aiprocess/sharedmemorymanager.h \
    src/modules/audiomanipulation/audiomanipulation.h \
    src/modules/audiorecording/audioconfig.h \
    src/modules/audiorecording/audiofile.h \
    src/modules/audiorecording/recorddevice.h \
    src/modules/audiorecording/recordingchart.h \
    src/modules/audiorecording/recordingcontroller.h \
 \    # src/modules/systeminformation/basicmonitor.h
    src/modules/audiorecording/recordio.h \
    src/modules/filemanager/FileIO.h \
    src/modules/notification/alertmanager.h \
    src/modules/notification/anomalylogger.h \
    src/modules/notification/notificationlogger.h \
    src/modules/systeminformation/systeminformationcontroller.h \
    src/modules/filemanager/filemanager.h \
    src/modules/transferlearning/histogrammanager.h \
    src/modules/transferlearning/metricsmanagerbase.h \
    src/modules/transferlearning/prmanager.h \
    src/modules/transferlearning/rocmanager.h \
    src/modules/transferlearning/transferconfig.h \
    src/modules/transferlearning/transfercontroller.h \
    src/modules/transferlearning/transferengine.h \
    src/modules/transferlearning/transferlogparser.h \
    src/modules/transferlearning/transferprocmng.h

DISTFILES += \
    ../../../ESCA_Qt/ESCA/ui/components/GpuFrame.qml \
    ../../../QT-GUI/ui/component/UsageTextElement.qml \
    qml/content/AudioManipulation/processData.qml \
    qml/content/Base/HomeButton.qml \
    qml/content/Base/FullScreen.qml \
    qml/content/BaseTraining/baseLearning.qml \
    qml/content/FileManager/fileManager.qml \
    qml/content/Inference/realTimeInference_data.qml \
    qml/content/Inference/realTimeInference_result.qml \
    qml/content/Notification/AlertPopup.qml \
    qml/content/Notification/NotificationCenter.qml \
    qml/content/Notification/NotificationItem.qml \
    qml/content/RecordModule/AudioChart.qml \
    qml/content/RecordModule/ConfigAudio.qml \
    qml/content/RecordModule/RecordModule.qml \
    qml/content/RecordModule/Recording.qml \
    qml/content/SystemInformation/SysInfoModule.qml \
    qml/content/SystemInformation/about.qml \
    qml/content/SystemInformation/realTimeMonitor.qml \
    qml/content/SystemInformation/systemInformation.qml \
    qml/content/component/NotificationManager.qml \
    qml/content/component/RamFrame.qml \
    qml/content/component/UsageLineChart.qml
