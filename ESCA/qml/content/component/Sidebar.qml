import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle
    width: parent.height
    height: parent.width
    color: "#161525"
    radius: 20

    Column {
        id: column
        x: 0
        y: 0
        width: 180
        height: 312
        spacing: 10
        topPadding: 20

        Rectangle {
            id: rectangle2
            width: 180
            height: 60
            color: "#00ffffff"

            Text {
                id: text1
                color: Constants.focusColor
                anchors.centerIn: parent
                text: qsTr("Visualize")
                font.pixelSize: 22
                font.family: "Oxanium"
            }
        }

        Rectangle {
            id: rectangle3
            width: 180
            height: 60
            color: "#00ffffff"
            Text {
                color: "#ffffff"
                text: qsTr("Config")
                font.pixelSize: 22
                font.family: "Oxanium"
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: rectangle4
            width: 180
            height: 60
            color: "#00ffffff"
            Text {
                color: "#ffffff"
                text: qsTr("Timer")
                font.pixelSize: 22
                font.family: "Oxanium"
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: rectangle5
            width: 180
            height: 60
            color: "#00ffffff"
            Text {
                color: "#ffffff"
                text: qsTr("FileManager")
                font.pixelSize: 22
                font.family: "Oxanium"
                anchors.centerIn: parent
            }
        }
    }
}
