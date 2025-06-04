// File: qml/NotificationItem.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: notificationItem
    property alias message: textItem.text
    property string type: "info"      // Các loại: "info", "success", "warning", "error"
    property int duration: 3000       // Thời gian hiển thị (ms)
    signal dismissed()              // Signal khi thông báo tự ẩn xong

    width: parent.width
    height: 50
    opacity: 0.0

    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        radius: 5
        opacity: 0.9
        color: {
            switch (notificationItem.type) {
                case "error": return "#f44336";    // đỏ
                case "warning": return "#ff9800";    // cam
                case "success": return "#4caf50";    // xanh lá
                case "info": default: return "#2196f3"; // xanh dương
            }
        }
    }

    Text {
        id: textItem
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 16
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Behavior on opacity {
        NumberAnimation { duration: 500 }
    }

    Component.onCompleted: {
        opacity = 1.0;
        dismissTimer.start();
    }

    Timer {
        id: dismissTimer
        interval: duration
        running: false
        onTriggered: {
            opacity = 0.0;
        }
    }

    onOpacityChanged: {
        if (opacity === 0.0 && !dismissTimer.running) {
            dismissed();
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            dismissTimer.stop();
            opacity = 0.0;
        }
    }
}
