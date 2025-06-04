import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Rectangle {
    width: 800
    height: 500
    color: "#2a2a2a"

    property int totalEpoch: TransferObject.totalEpoch
    property int epoch: TransferObject.epoch
    property int tlStatus: TransferObject.tlStatus
    // Hàm cập nhật nội dung log dựa theo trạng thái tlStatus
    function updateLogOnTlStatusChange(status) {
        if (status === true) {
            logArea.clear()
            logArea.append("Initial Training....")
        } else {
            // Khi chuyển sang false (Stop): xóa nội dung TextArea (reset về ban đầu)
            // logArea.clear()
            // progressTx.text = "0%"
            // progressBar.value = 0
            // totalEpoch = 0
            epoch = 0
        }
    }
    function calc(epoch, totalEpoch) {
        console.log("ABC",epoch, totalEpoch,Math.round((epoch / totalEpoch) * 100))
        return totalEpoch > 0 ? Math.round((epoch / totalEpoch) * 100) : 0
    }

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        // Tiêu đề ứng dụng
        Text {
            text: "Transfer Learning Monitor"
            font.pointSize: 24
            font.bold: true
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // Status & Progress Bar
        Rectangle {
            width: parent.width
            height: 80
            color: "#333333"
            radius: 15
            border.color: "#555555"

            Row {
                anchors.centerIn: parent
                spacing: 30

                Text {
                    text: "Status: " + (tlStatus ? "Idle" : "Not Running")
                    font.pointSize: 18
                    color: "#ffffff"
                }

                ProgressBar {
                    id: progressBar
                    width: 400
                    height: 25
                    from: 0
                    to: 100
                    value: totalEpoch > 0 ? Math.round((epoch / totalEpoch) * 100) : 0
                }

                Text {
                    id: progressTx
                    text: calc(epoch, totalEpoch) + "%"
                    font.pointSize: 18
                    color: "#ffffff"
                }
            }
        }

        // Log View (TextArea)
        Rectangle {
            width: parent.width
            height: 300
            color: "#1a1a1a"
            radius: 15
            border.color: "#555555"

            ScrollView {
                anchors.fill: parent
                anchors.margins: 10
                clip: true

                TextArea {
                    id: logArea
                    readOnly: true
                    wrapMode: TextArea.Wrap
                    textFormat: TextEdit.PlainText
                    font.pixelSize: 14
                    color: "#ffffff"
                    background: Rectangle { color: "transparent" }
                }
            }
        }
    }

    // Cập nhật log khi epoch thay đổi
    Connections {
        target: TransferObject
        onEpochChanged: {
            // Ví dụ: Append thêm dòng thông báo khi epoch thay đổi
            logArea.clear()
            logArea.append(TransferObject.logText)
            totalEpoch = TransferObject.totalEpoch
            epoch= TransferObject.epoch
        }
        onTlStatusChanged: {
            updateLogOnTlStatusChange(TransferObject.tlStatus);
        }
    }
}
