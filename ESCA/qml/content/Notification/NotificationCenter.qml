// File: qml/NotificationCenter.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: notificationCenter
    anchors.top: parent.top
    anchors.right: parent.right
    width: 320

    // ListModel chứa thông báo
    ListModel {
        id: notificationModel
    }

    // Hàm hiển thị thông báo
    function showNotification(message, type, priority, duration) {
        if (duration === undefined)
            duration = 3000;

        // Chèn thông báo vào model theo thứ tự ưu tiên giảm dần
        var insertIndex = 0;
        for (var i = 0; i < notificationModel.count; i++) {
            if (priority <= notificationModel.get(i).priority)
                insertIndex = i + 1;
            else
                break;
        }
        notificationModel.insert(insertIndex, {
            "message": message,
            "type": type,
            "priority": priority,
            "duration": duration
        });

        // Ghi log thông báo qua C++ nếu có đối tượng notificationLogger
        if (typeof NotificationLoggerCpp !== "undefined") {
            NotificationLoggerCpp.logNotification(message, type, priority);
        }
    }

    ListView {
        id: notificationListView
        anchors {
            top: parent.top
            right: parent.right
            margins: 10
        }
        width: parent.width - 20
        // Chiều cao sẽ tự điều chỉnh theo số lượng thông báo (mỗi thông báo cách nhau 10px)
        // height: Math.min(notificationModel.count * 60, parent.height-200)
        height: Math.min(notificationModel.count * 60, 120)
        model: notificationModel
        spacing: 10
        clip: true
        interactive: false
        orientation: ListView.Vertical
        delegate: NotificationItem {
            id: notifItem
            message: model.message
            type: model.type
            duration: model.duration
            onDismissed: {
                notificationModel.remove(index);
            }
        }
    }
}
