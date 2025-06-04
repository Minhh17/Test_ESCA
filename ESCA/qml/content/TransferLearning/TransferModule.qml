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

    property string selectedBtn: "monitor"
    property bool tlStatus: TransferObject.tlStatus
    property string logContent: ""    

    Rectangle {
        id: rectangle
        x: 13
        y: 0
        width: 180
        height: 500
        color: "#161525"
        radius: 20

        // StatusLight {
        //     id: statusLight
        // }

        Button {
            id: startBtn
            x: 40
            y: 367
            text: qsTr("Start")
            onClicked: {
                // loader.source = "/ui/layout/splitingScreen.qml"

                if (!tlStatus) {                    
                    TransferObject.start();
                }
            }
        }

        Button {
            id: stopBtn
            x: 40
            y: 420
            text: qsTr("Stop")
            onClicked:
                TransferObject.stop();
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
                    color: selectedBtn === "Params" ? Constants.focusColor : "#ffffff"
                    anchors.centerIn: parent
                    text: qsTr("Params")
                    font.pixelSize: 22
                    font.family: "Oxanium"
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        selectedBtn = "Params"
                        contentLoader.setSource("transferParams.qml");
                    }
                }
            }

            Rectangle {
                id: configRec
                width: 180
                height: 60
                color: "#00ffffff"
                Text {
                    color: selectedBtn === "dataset" ? Constants.focusColor : "#ffffff"
                    text: qsTr("Dataset")
                    font.pixelSize: 22
                    font.family: "Oxanium"
                    anchors.centerIn: parent
                }

                MouseArea {
                    id: mouseArea1
                    anchors.fill: parent
                    onClicked: {
                        selectedBtn = "dataset"
                        contentLoader.setSource("transferDataset.qml");
                    }
                }
            }

            Rectangle {
                id: fileManagerRec
                width: 180
                height: 60
                color: "#00ffffff"
                Text {
                    color:  selectedBtn === "monitor" ? Constants.focusColor : "#ffffff"
                    text: qsTr("Monitor")
                    font.pixelSize: 22
                    font.family: "Oxanium"
                    anchors.centerIn: parent
                }

                MouseArea {
                    id: mouseArea3
                    anchors.fill: parent
                    onClicked: {
                        selectedBtn = "monitor"
                        contentLoader.setSource("transferMonitor.qml");
                    }
                }
            }

            Rectangle {
                id: timerRec
                width: 180
                height: 60
                color: "#00ffffff"
                Text {
                    color:  selectedBtn === "results" ? Constants.focusColor : "#ffffff"
                    text: qsTr("Result")
                    font.pixelSize: 22
                    font.family: "Oxanium"
                    anchors.centerIn: parent
                }

                MouseArea {
                    id: mouseArea2
                    anchors.fill: parent
                    onClicked: {
                        selectedBtn = "results"
                        contentLoader.setSource("TransferResult.qml");
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

        Loader {
            id: contentLoader
            anchors.fill: parent
            source: "transferMonitor.qml"
        }
    }
}
