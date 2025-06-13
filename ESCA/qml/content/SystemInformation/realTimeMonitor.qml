import QtQuick 2.15
import QtQuick.Controls 2.15

import "../component"

Rectangle {
    id: rectangle
    width: 1024
    height: 480
    color: "#2a2a2a"

    property var cpuData: []
    property var gpuData: []
    property var ramData: []
    property var tempData: []
    property string chartMode: "all"

    UsageLineChart {
        id: usageChart
        anchors.fill: parent
        anchors.margins: 80
        cpuData: rectangle.cpuData
        gpuData: rectangle.gpuData
        ramData: rectangle.ramData
        tempData: rectangle.tempData
        mode: rectangle.chartMode
    }

    Row {
        id: legendRow
        spacing: 20

        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        Row {
            spacing: 4
            Rectangle {
                width: 12
                height: 12
                color: "#00dffe"
            }
            Text {
                text: "CPU: " + BackendObject.cpuText
                color: "white"
                font.pixelSize: 14
            }
        }
        Row {
            spacing: 4
            Rectangle {
                width: 12
                height: 12
                color: "#ff9900"
            }
            Text {
                text: "GPU: " + BackendObject.gpuText
                color: "white"
                font.pixelSize: 14
            }
        }
        Row {
            spacing: 4
            Rectangle {
                width: 12
                height: 12
                color: "#aa00ff"
            }
            Text {
                text: "RAM: " + BackendObject.ramText
                color: "white"
                font.pixelSize: 14
            }
        }
        Row {
            spacing: 4
            Rectangle {
                width: 12
                height: 12
                color: "#ff4444"
            }
            Text {
                text: "TEMP: " + BackendObject.temperatureText
                color: "white"
                font.pixelSize: 14
            }
        }
    }


    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            function push(arr,val){
                arr.push(val)
                if(arr.length>60) arr.shift()
            }
            push(cpuData, BackendObject.cpuPercentage)
            push(gpuData, BackendObject.gpuPercentage)
            push(ramData, BackendObject.ramPercentage)
            push(tempData, BackendObject.temperature)
            usageChart.requestPaint()
        }
    }

    Row {
        spacing: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        Repeater {
            model: ["all","cpu","gpu","ram","temp"]
            delegate: Rectangle {
                width: 70
                height: 30
                radius: 5
                color: rectangle.chartMode === modelData ? "#2c3138" : "#394251"
                Text {
                    anchors.centerIn: parent
                    text: modelData.toUpperCase()
                    color: "white";
                    font.pixelSize: 14
                }
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        rectangle.chartMode = modelData;
                        usageChart.requestPaint();
                    }
                }
            }
        }
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

}
