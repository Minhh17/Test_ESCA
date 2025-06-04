import QtQuick 2.15
import QtQuick.Controls 2.15
import "../component"
import SystemInformation 1.0

Rectangle {
    width: 1000
    height: 420
    color: "#2a2a2a"
    SystemInformationController {
        id: backendObject
    }

    Text {
        id: diskUsage
        x: 38
        y: 255
        width: 272
        height: 40
        color: "#ffffff"
        text: backendObject.diskText
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }

    Text {
        id: internetStatus
        x: 38
        y: 322
        width: 440
        height: 40
        color: "#ffffff"
        text: "Display: 7 inch QLED quantum Dot display"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }
    Text {
        id: runnningTime
        x: 510
        y: 255
        width: 429
        height: 40
        color: "#ffffff"
        text: "Input source: Micro Sennheiser MKE 600"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }

    Text {
        id: connectionPort
        x: 510
        y: 322
        width: 429
        height: 40
        color: "#ffffff"
        text: "Output source: No Information"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }

    Text {
        id: internetStatus1
        x: 31
        y: 23
        width: 663
        height: 40
        color: "#ffffff"
        text: "CPU" + backendObject.getCpuName()
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }

    Text {
        id: internetStatus2
        x: 31
        y: 86
        width: 663
        height: 40
        color: "#ffffff"
        text: "GPU:" + backendObject.getGpuName()
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }

    Text {
        id: internetStatus3
        x: 31
        y: 147
        width: 663
        height: 40
        color: "#ffffff"
        text: "Memory: External Storage: SSD Kingston 256GB"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }

    Rectangle {
        id: rectangle4
        x: 26
        y: 227
        width: 934
        height: 3
        color: "#ffffff"
    }

    Text {
        id: internetStatus4
        x: 810
        y: 23
        width: 83
        height: 40
        color: "#ffffff"
        text: "Caches"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }

    Rectangle {
        id: rectangle5
        x: 724
        y: -1
        width: 3
        height: 231
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle6
        x: 22
        y: -1
        width: 3
        height: 378
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle7
        x: 962
        y: -1
        width: 3
        height: 378
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle8
        x: 22
        y: 375
        width: 943
        height: 2
        color: "#ffffff"
    }

    Text {
        id: cacheL1
        x: 758
        y: 86
        width: 140
        height: 40
        color: "#ffffff"
        text: "L1:      " + backendObject.getCacheL1() + " KB"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }

    Text {
        id: cacheL2
        x: 758
        y: 147
        width: 140
        height: 40
        color: "#ffffff"
        text: "L2:      " + backendObject.getCacheL2() + "B"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }
}
