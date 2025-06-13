import QtQuick 2.15
import QtQuick.Controls 2.15
import ProjectImport 1.0 // IMport component: Constants, Animation, ...
import "component"
import "Base"
import "Notification"

ApplicationWindow {
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor
    visible: true

    Loader {
        id: screenLoader
        anchors.top: topbar.bottom
        source: "./Base/FullScreen.qml"
    }

    // NotificationCenter như một overlay
    // NotificationCenter luôn hiển thị lên trên các nội dung khác
    NotificationCenter {
        id: notificationCenter
        anchors.fill: parent
        z: 100
    }

    AlertPopup {
        id: alertPopup
        onResponded: AlertManager.handleUserResponse(confirmed, note)
    }

    TopBar {
        id: topbar
    }

    HomeButton {
        id: homeButton
    }

    // Cập nhật log khi epoch thay đổi
    Connections {
        target: TransferObject
        onTlStatusChanged: {
            // updateTlStatusChange(TransferObject.tlStatus);
            if (TransferObject.tlStatus === true) {
            } else {
                notificationCenter.showNotification("Transfer Learning training completed.", "info", 1);
            }
        }
    }
    Connections {
        target: AIObject
        onAbnomalDetectChanged: {

            AlertManager.triggerAlert(AIObject.abnomalDetect, 0)
            //notificationCenter.showNotification(AIObject.abnomalDetect, "warning", 1);

        }
        onDoneDetectChanged: {
            if (AIObject.inferenceStatus === false) {
                // notificationCenter.showNotification("Inference with Audio Folder Done", "info", 1);
            }
        }
    }

    Connections {
        target: AlertManager
        onShowLocalAlert: {
            alertPopup.message = message
            alertPopup.open()
        }
        onEscalateAlert: {
            notificationCenter.showNotification(message + " (Escalated)", "error", 2)
        }
    }

}

