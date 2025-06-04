import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle4
    width: 1024
    height: 460
    color: "#2a2a2a"

    property string selectedButton: "about"  // Biến để lưu trang hiện tại

    // HEADER
    Rectangle {
        id: about
        x: 61
        y: 8
        width: 218
        height: 52
        color: selectedButton === "about" ? "#2c3138" : "#394251"  // Thay đổi màu khi được chọn
        radius: 8

        Text {
            id: text_about
            color: "#ffffff"
            text: qsTr("About")
            anchors.fill: parent
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Oxanium"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.source = "about.qml"
                selectedButton = "about"  // Cập nhật trạng thái
            }
        }
    }

    Rectangle {
        id: rectangle3
        x: 333
        y: 8
        width: 291
        height: 52
        color: selectedButton === "systemInformation" ? "#2c3138" : "#394251"
        radius: 8
        Text {
            id: text3
            color: "#ffffff"
            text: qsTr("System Information")
            anchors.fill: parent
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Oxanium"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.source = "systemInformation.qml"
                selectedButton = "systemInformation"
            }
        }
    }

    Rectangle {
        id: rectangle
        x: 680
        y: 8
        width: 285
        height: 52
        color: selectedButton === "realTimeMonitor" ? "#2c3138" : "#394251"
        radius: 8

        Text {
            id: text1
            color: "#ffffff"
            text: qsTr("Real-time monitor")
            anchors.fill: parent
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Oxanium"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.source = "realTimeMonitor.qml"
                selectedButton = "realTimeMonitor"
            }
        }
    }

    Rectangle {
        id: rectangle2
        x: 41
        y: 66
        width: 943
        height: 2
        color: "#ffffff"
    }

    Rectangle {
        id: contentRec
        x: 19
        y: 68
        width: 1000
        height: 420
        color: "#272d37"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        anchors.topMargin: 68

        Loader {
            id: loader
            anchors.fill: parent
            source: "about.qml"  // Trang mặc định
        }
    }
}
