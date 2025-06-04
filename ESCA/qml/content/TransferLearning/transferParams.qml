import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Rectangle {
    visible: true
    width: 800
    height: 500

    Rectangle {
        anchors.fill: parent
        color: "#2a2a2a"

        Column {
            anchors.centerIn: parent
            width: 600
            spacing: 15

            Text {
                text: "Transfer Learning Configuration"
                font.pointSize: 24
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                color: "#ffffff"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            GridLayout {
                columns: 2
                columnSpacing: 20
                rowSpacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Label {
                    text: "ANOM_BATCH_SIZE:"
                    color: "#ffffff"
                }
                SpinBox {
                    id: anomBatchSize
                    from: 1
                    to: 1024
                    stepSize: 1
                    value: TransferConfig.batchSize
                    width: 200
                }

                Label {
                    text: "BETA:"
                    color: "#ffffff"
                }
                SpinBox {
                    id: beta
                    from: 1
                    to: 10
                    stepSize: 1
                    value: TransferConfig.beta
                    width: 200
                }

                Label {
                    text: "EPOCH:"
                    color: "#ffffff"
                }
                SpinBox {
                    id: epoch
                    from: 1
                    to: 500
                    stepSize: 1
                    value: TransferConfig.epoch
                    width: 200
                }

                Label {
                    text: "LEARNING_RATE:"
                    color: "#ffffff"
                }
                TextField {
                    id: learningRate
                    text: TransferConfig.learningRate + ""
                    // placeholderText: "0.001"
                    width: 200
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                }
            }

            Button {
                text: "Save Configuration"
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: 40
                font.pointSize: 16
                background: Rectangle {
                    color: "#0055ff"
                    radius: 10
                }
                onClicked: {
                    TransferConfig.beta = beta.value
                    TransferConfig.batchSize = anomBatchSize.value
                    TransferConfig.epoch = epoch.value
                    TransferConfig.learningRate = parseFloat(learningRate.text)

                    TransferConfig.saveConfig()
                    notificationCenter.showNotification("Transfer Learning Params saved.", "success", 1);
                    console.log("ANOM_BATCH_SIZE:", anomBatchSize.value)
                    console.log("BETA:", beta.value)
                    console.log("EPOCH:", epoch.value)
                    console.log("LEARNING_RATE:", learningRate.text)
                    // Add logic to save these configurations to a JSON file
                }
            }
        }
    }
}
