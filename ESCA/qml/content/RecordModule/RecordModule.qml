import QtQuick 2.15
import QtQuick.Controls 2.15
import ProjectImport 1.0 // IMport component: Constants, Animation, ...
import QtCharts 2.6
import QtMultimedia 5.15
import "../component"

Rectangle {
    width: Constants.width
    height: Constants.height - 100
    color: "#000000"

    property string selectedBtn: "visualize"
    property bool recStatus: RecordingObject.recStatus

    Rectangle {
        id: rectangle
        x: 13
        y: 0
        width: 180
        height: 500
        color: "#161525"
        radius: 20

        Button {
            id: startBtn
            x: 40
            y: 367
            text: qsTr("Start")
            onClicked: {
                if (!recStatus) {
                    RecordingObject.startRecording()
                }
            }
        }

        Button {
            id: stopBtn
            x: 40
            y: 420
            text: qsTr("Stop")
            onClicked:
                RecordingObject.stopRecording()
        }


        Column {
            id: column
            x: 0
            y: 0
            width: 180
            height: 312
            spacing: 10
            topPadding: 20

            Rectangle {
                id: visualizeRec
                width: 180
                height: 60
                color: "#00ffffff"

                Text {
                    id: text1
                    color: selectedBtn === "visualize" ? Constants.focusColor : "#ffffff"
                    anchors.centerIn: parent
                    text: qsTr("Visualize")
                    font.pixelSize: 22
                    font.family: "Oxanium"
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        selectedBtn = "visualize"
                        contentLoader.setSource("AudioChart.qml");
                    }
                }
            }

            Rectangle {
                id: configRec
                width: 180
                height: 60
                color: "#00ffffff"
                Text {
                    color: selectedBtn === "config" ? Constants.focusColor : "#ffffff"
                    text: qsTr("Config")
                    font.pixelSize: 22
                    font.family: "Oxanium"
                    anchors.centerIn: parent
                }

                MouseArea {
                    id: mouseArea1
                    anchors.fill: parent
                    onClicked: {
                        selectedBtn = "config"
                        contentLoader.setSource("ConfigAudio.qml");
                    }
                }
            }

            Rectangle {
                id: fileManagerRec
                width: 180
                height: 60
                color: "#00ffffff"
                Text {
                    color:  selectedBtn === "fileManager" ? Constants.focusColor : "#ffffff"
                    text: qsTr("FileManager")
                    font.pixelSize: 22
                    font.family: "Oxanium"
                    anchors.centerIn: parent
                }

                MouseArea {
                    id: mouseArea3
                    anchors.fill: parent
                    onClicked: {
                        selectedBtn = "fileManager"
                        contentLoader.setSource("../FileManager/fileManager.qml");
                    }
                }
            }

            Rectangle {
                id: timerRec
                width: 180
                height: 60
                color: "#00ffffff"
                Text {
                    color:  selectedBtn === "timer" ? Constants.focusColor : "#ffffff"
                    text: qsTr("Timer")
                    font.pixelSize: 22
                    font.family: "Oxanium"
                    anchors.centerIn: parent
                }

                MouseArea {
                    id: mouseArea2
                    anchors.fill: parent
                    onClicked: {
                        selectedBtn = "timer"
                        contentLoader.setSource("AudioChart.qml");
                    }
                }
            }
        }
    }

    Rectangle {
        id: contentRec
        x: 207
        y: 0
        width: 802
        height: 500
        color: "#2a2a2a"
        radius: 21

        Loader {
            id: contentLoader
            anchors.fill: parent
            source: "AudioChart.qml"
        }
    }
}
