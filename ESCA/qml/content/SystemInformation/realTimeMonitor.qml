import QtQuick 2.15
import QtQuick.Controls 2.15

import "../component"

Rectangle {
    id: rectangle
    width: 1024
    height: 480
    color: "#2a2a2a"

    // graph
    CpuFrame{
        x: 277
        y: 100
        width: 250
        height: 250
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 103
        anchors.bottomMargin: 126
        anchors.rightMargin: 385
        anchors.leftMargin: 386
        //        MouseArea {
        //            anchors.fill: parent
//            onClicked: {
//                    loader.source = "cpuMonitor.qml"
//                }
//        }
    }

    RamFrame{
        x: 689
        y: 169
        width: 250
        height: 250
        anchors.right: parent.right
        anchors.rightMargin: 85
        //        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                    loader.source = "ramMonitor.qml"
//                }
//        }
    }

    GpuFrame{
        y: 169
        width: 250
        height: 250
        anchors.left: parent.left
        anchors.leftMargin: 79
//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                    loader.source = "gpuMonitor.qml"
//                }
//        }
    }

    // TEMP COMPONENT

    Text {
        id: diskUsage
        x: 74
        y: 32
        width: 313
        height: 40
        color: "#ffffff"
        text: BackendObject.diskText
        font.pixelSize: 23
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Oxanium"
        font.weight: Font.Normal
    }

    Text {
        id: internetStatus
        x: 74
        y: 78
        width: 260
        height: 40
        color: "#ffffff"
        text: "Monitor: ASUS VA27EHF"
        font.pixelSize: 23
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Oxanium"
        font.weight: Font.Normal
    }
    Text {
        id: runnningTime
        x: 684
        y: 38
        width: 260
        height: 40
        color: "#ffffff"
        text: "Microphone: AT2020"
        font.pixelSize: 23
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Oxanium"
        font.weight: Font.Normal
    }

    Text {
        id: connectionPort
        x: 684
        y: 78
        width: 279
        height: 40
        color: "#ffffff"
        text: "Speaker: MEGUO 2023"
        font.pixelSize: 23
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Oxanium"
        font.weight: Font.Normal
    }
}
