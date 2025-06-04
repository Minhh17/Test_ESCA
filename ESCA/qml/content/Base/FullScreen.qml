import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: frame_22
    width: 1024
    height: 500
    color: "#141619"

    Item {
        id: imgBackground
        x: 0
        y: 0
        width: 1024
        height: 500
        opacity: 0.5
        Image {
            id: rectangle
            source: "/qml/content/resources/backgrounds/home.svg"
            anchors.centerIn: parent
        }
    }

    Text {
        id: recording_audio_text
        width: 140
        height: 29
        color: "#ffffff"
        text: qsTr("Recording Audio")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: -33
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -366
    }

    Text {
        id: base_learning_text
        width: 140
        height: 28
        color: "#ffffff"
        text: qsTr("Base Training")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: 191
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -364
    }

    Text {
        id: tranfer_learning_text
        width: 140
        height: 28
        color: "#ffffff"
        text: qsTr("Tranfer Learning")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: 191
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -113
    }

    Text {
        id: realtime_inference_text
        width: 156
        height: 27
        color: "#ffffff"
        text: qsTr("Real-time inference")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: 192
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 134
    }

    Text {
        id: system_config_text
        width: 156
        height: 28
        color: "#ffffff"
        text: qsTr("Recording Configure")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: 191
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 384
    }

    Text {
        id: process_file_text
        width: 170
        height: 29
        color: "#ffffff"
        text: qsTr("Audio Manipulation")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: -33
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -113
    }

    Text {
        id: file_manager_text
        width: 140
        height: 29
        color: "#ffffff"
        text: qsTr("File Manager")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: -30
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 133
    }

    Text {
        id: system_performance_text
        width: 175
        height: 29
        color: "#ffffff"
        text: qsTr("System Performance")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: -33
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 391
    }

    Rectangle {
        id: base_learning_rec
        width: 145
        height: 137
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: 94
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -367

        Image {
            id: baseLearningIcon
            anchors.centerIn: parent
            width: 50
            height: 50
            smooth: true
            fillMode: Image.PreserveAspectFit
            source: "/qml/content/resources/icons/BaseTraining.svg"
        }
        MouseArea {
            id: base_learning_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                screenLoader.source = "../BaseTraining/baseLearning.qml"
            }
        }
    }

    Rectangle {
        id: transfer_learning_rec
        width: 144
        height: 137
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: 94
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -116

        Image {
            id: transferIcon
            anchors.centerIn: parent
            width: 50
            height: 50
            smooth: true
            fillMode: Image.PreserveAspectFit
            source: "/qml/content/resources/icons/TransferLearning.svg"
        }

        MouseArea {
            id: tranfer_learning_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                screenLoader.source = "../TransferLearning/TransferModule.qml"
            }
        }
    }

    Rectangle {
        id: realtime_inference_rec
        width: 144
        height: 137
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: 94
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 133

        Image {
            id: resultsData
            anchors.centerIn: parent
            width: 40
            height: 50
            smooth: true
            fillMode: Image.PreserveAspectFit
            source: "/qml/content/resources/icons/Inference.svg"
        }

        MouseArea {
            id: realtime_inference_ma
            anchors.fill: parent
            anchors.rightMargin: 0
            onClicked: {
                screenLoader.source = "../Inference/realTimeInference_data.qml"
            }
        }
    }

    Rectangle {
        id: system_config_rec
        width: 145
        height: 137
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: 94
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 384

        Image {
            id: systemConfigIcon
            anchors.centerIn: parent
            width: 50
            height: 50
            smooth: true
            fillMode: Image.PreserveAspectFit
            source: "/qml/content/resources/icons/gear-solid.svg"
        }

        MouseArea {
            id: system_config_ma
            anchors.fill: parent
            onClicked: {
                screenLoader.source = "../RecordModule/ConfigAudio.qml"
            }
        }
    }

    Rectangle {
        id: recording_audio_rec
        width: 145
        height: 139
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: -131
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -367

        Image {
            id: recordIcon
            anchors.centerIn: parent
            width: 40
            height: 50
            smooth: false
            fillMode: Image.PreserveAspectFit
            source: "/qml/content/resources/icons/Recording.svg"
        }

        MouseArea {
            id: recording_audio_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                screenLoader.source = "../RecordModule/RecordModule.qml"
            }
        }
    }

    Rectangle {
        id: process_file_rec
        width: 144
        height: 139
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: -131
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -116

        Image {
            id: processDataIcon
            anchors.centerIn: parent
            width: 60
            height: 45
            smooth: false
            fillMode: Image.PreserveAspectFit
            source: "/qml/content/resources/icons/AudioManipulation.svg"
        }

        MouseArea {
            id: process_file_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                screenLoader.source = "../AudioManipulation/processData.qml"
            }
        }
    }

    Rectangle {
        id: file_manager_rec
        width: 144
        height: 139
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: -131
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 133

        Image {
            id: fileManagerIcon
            anchors.centerIn: parent
            width: 60
            height: 50
            smooth: true
            // fillMode: Image.PreserveAspectFitv
            source: "/qml/content/resources/icons/FileManager.svg"
        }

        MouseArea {
            id: file_manager_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                screenLoader.source = "../FileManager/fileManager.qml"
            }
        }
    }

    Rectangle {
        id: system_performance_rec
        width: 145
        height: 139
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: -131
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 384

        Image {
            id: systemPerformanceIcon
            anchors.centerIn: parent
            width: 50
            height: 50
            smooth: true
            fillMode: Image.PreserveAspectFit
            source: "/qml/content/resources/icons/SysInfo.svg"
        }

        MouseArea {
            id: system_performance_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                screenLoader.source = "../SystemInformation/SysInfoModule.qml"
            }
        }
    }

}
