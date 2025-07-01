import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.1      // File dialog trên mọi HĐH
import QtQuick.Dialogs 1.3

Rectangle {
    id: realtimeConfigWindow
    width: 1024
    height: 560
    color: "#151515"
    border.color: "#414141"

    // ===== Thông số giao diện dùng chung =====
    property int fieldHeight : 32         // chiều cao các ô nhập
    property int labelWidth  : 160        // chiều rộng cột nhãn

    /*--------------------------------------------------------------------
     *  Bộ cuộn bao toàn bộ nội dung – nếu cửa sổ thấp hơn nội dung sẽ
     *  tự cuộn.  Giả sử ứng dụng nhúng trên thiết bị có màn hình nhỏ.
     *-------------------------------------------------------------------*/
    Flickable {
        anchors.fill: parent
        contentHeight: contentColumn.implicitHeight
        clip: true

        /*----------------------------------------------------------------
         *  Cột chính chứa lần lượt: tiêu đề, khối đường dẫn, khối tham số.
         *----------------------------------------------------------------*/
        ColumnLayout {
            id: contentColumn
            anchors.margins: 24
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 48  // giữ lề 24 px hai bên
            spacing: 24

            // ===== Tiêu đề =====
            Label {
                text: "REALTIME Configuration"
                font.pixelSize: 26
                font.family: "Oxanium"
                font.bold: true
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }

            /*------------------------------------------------------------
             *  KHỐI 1 – CÁC ĐƯỜNG DẪN FILE/FOLDER (chiếm toàn bộ chiều rộng)
             *-----------------------------------------------------------*/
            GridLayout {
                id: pathGrid
                columns: 3                       // nhãn – ô nhập – nút duyệt
                columnSpacing: 12
                rowSpacing: 12
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter

                /*---------------- Import Folder Path ----------------*/
                Text {
                    text: "Import Folder Path:";
                    color: "#FFFFFF";
                    Layout.preferredWidth: labelWidth;
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                }
                Rectangle {
                    Layout.fillWidth: true
                    height: fieldHeight
                    radius: 6
                    color: "#222222"
                    border.color: "#FFFFFF"
                    TextInput {
                        id: folderPathInput
                        anchors.fill: parent
                        anchors.margins: 6
                        enabled: !AIObject.inferenceStatus
                        text: ConfigManager.folderPath
                        color: "#FFFFFF"
                        wrapMode: Text.NoWrap
                        onTextChanged: {
                            if (ConfigManager.folderPath !== text) {
                                ConfigManager.folderPath = text;
                                ConfigManager.saveConfig();
                            }
                        }
                    }
                }
                Rectangle {
                    width: fieldHeight; height: fieldHeight; radius: 4; color: "#cccccc"
                    MouseArea { anchors.fill: parent; onClicked: fileDialogFolder.open() }
                }

                /*---------------- Model Path ----------------*/
                Text {
                    text: "Model:";
                    color: "#FFFFFF";
                    Layout.preferredWidth: labelWidth;
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                }
                Rectangle {
                    Layout.fillWidth: true
                    height: fieldHeight
                    radius: 6
                    color: "#222222"
                    border.color: "#FFFFFF"
                    TextInput {
                        id: modelPathInput
                        anchors.fill: parent
                        anchors.margins: 6
                        enabled: !AIObject.inferenceStatus
                        text: ConfigManager.modelPath
                        color: "#FFFFFF"
                        wrapMode: Text.NoWrap
                        onTextChanged: {
                            if (ConfigManager.modelPath !== text) {
                                ConfigManager.modelPath = text;
                                ConfigManager.saveConfig();
                            }
                        }
                    }
                }
                Rectangle {
                    width: fieldHeight; height: fieldHeight; radius: 4; color: "#cccccc"
                    MouseArea { anchors.fill: parent; onClicked: fileDialogModel.open() }
                }

                /*---------------- Log Path ----------------*/
                Text {
                    text: "Log Path:";
                    color: "#FFFFFF";
                    Layout.preferredWidth: labelWidth;
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                }
                Rectangle {
                    Layout.fillWidth: true
                    height: fieldHeight
                    radius: 6
                    color: "#222222"
                    border.color: "#FFFFFF"
                    TextInput {
                        id: logPathInput
                        anchors.fill: parent
                        anchors.margins: 6
                        enabled: !AIObject.inferenceStatus
                        text: ConfigManager.logPath
                        color: "#FFFFFF"
                        wrapMode: Text.NoWrap
                        onTextChanged: {
                            if (ConfigManager.logPath !== text) {
                                ConfigManager.logPath = text;
                                ConfigManager.saveConfig();
                            }
                        }
                    }
                }
                Rectangle {
                    width: fieldHeight; height: fieldHeight; radius: 4; color: "#cccccc"
                    MouseArea { anchors.fill: parent; onClicked: fileDialogLog.open() }
                }
            }

            /*------------------------------------------------------------
             *  KHỐI 2 – CÁC THAM SỐ NHỎ (chia cột 4, gọn gàng)
             *-----------------------------------------------------------*/
            GridLayout {
                id: paramGrid
                columns: 4                      // nhãn – input | nhãn – input
                columnSpacing: 12
                rowSpacing: 12
                //Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter

                /*----- Hàng 1: Manual Threshold & Sample Size -----*/
                Text { text: "Manual Threshold:"; color: "#FFFFFF" }
                Rectangle {
                    Layout.minimumWidth: 200;
                    Layout.preferredWidth: 220
                    Layout.maximumWidth: 220
                    height: fieldHeight; radius: 6; color: "#222222"; border.color: "#FFFFFF"
                    TextInput {
                        id: manualThresholdInput; anchors.fill: parent; anchors.margins: 6
                        enabled: !AIObject.inferenceStatus
                        text: ConfigManager.manualThreshold.toString(); color: "#FFFFFF"
                        validator: DoubleValidator { bottom: 0; top: 1 }
                        onTextChanged: {
                            var v = parseFloat(text); if (!isNaN(v)) { ConfigManager.manualThreshold = v; ConfigManager.saveConfig(); }
                        }
                    }
                }
                Text { text: "Sample Size (bit):"; color: "#FFFFFF" }
                Rectangle {
                    Layout.minimumWidth: 200;
                    Layout.preferredWidth: 220
                    Layout.maximumWidth: 220
                    height: fieldHeight; radius: 6; color: "#222222"; border.color: "#FFFFFF"
                    TextInput {
                        id: sampleSizeInput; anchors.fill: parent; anchors.margins: 6
                        enabled: !AIObject.inferenceStatus
                        text: ConfigManager.sampleSize.toString(); color: "#FFFFFF"
                        validator: IntValidator { bottom: 100; top: 10000 }
                        onTextChanged: {
                            var v = parseInt(text); if (!isNaN(v)) { ConfigManager.sampleSize = v; ConfigManager.saveConfig(); }
                        }
                    }
                }

                /*----- Hàng 2: Channels & Sampling Rate -----*/
                Text { text: "Channels:"; color: "#FFFFFF" }
                Rectangle {
                    Layout.minimumWidth: 200;
                    Layout.preferredWidth: 220
                    Layout.maximumWidth: 220
                    height: fieldHeight; radius: 6; color: "#222222"; border.color: "#FFFFFF"
                    TextInput {
                        id: channelsInput; anchors.fill: parent; anchors.margins: 6
                        enabled: !AIObject.inferenceStatus
                        text: ConfigManager.channels.toString(); color: "#FFFFFF"
                        validator: IntValidator { bottom: 1; top: 8 }
                        onTextChanged: {
                            var v = parseInt(text); if (!isNaN(v)) { ConfigManager.channels = v; ConfigManager.saveConfig(); }
                        }
                    }
                }
                Text { text: "Sampling Rate:"; color: "#FFFFFF" }
                Rectangle {
                    Layout.minimumWidth: 200;
                    Layout.preferredWidth: 220
                    Layout.maximumWidth: 220
                    height: fieldHeight; radius: 6; color: "#222222"; border.color: "#FFFFFF"
                    TextInput {
                        id: samplingRateInput; anchors.fill: parent; anchors.margins: 6
                        enabled: !AIObject.inferenceStatus
                        text: ConfigManager.samplingRate.toString(); color: "#FFFFFF"
                        validator: IntValidator { bottom: 8000; top: 96000 }
                        onTextChanged: {
                            var v = parseInt(text); if (!isNaN(v)) { ConfigManager.samplingRate = v; ConfigManager.saveConfig(); }
                        }
                    }
                }

                /*----- Hàng 3: Second & Import File -----*/
                Text { text: "Second:"; color: "#FFFFFF" }
                Rectangle {
                    Layout.minimumWidth: 200;
                    Layout.preferredWidth: 220
                    Layout.maximumWidth: 220
                    height: fieldHeight; radius: 6; color: "#222222"; border.color: "#FFFFFF"
                    TextInput {
                        id: secondInput; anchors.fill: parent; anchors.margins: 6
                        enabled: !AIObject.inferenceStatus
                        text: ConfigManager.second.toString(); color: "#FFFFFF"
                        validator: DoubleValidator { bottom: 0.0; top: 10.0; decimals:1 }
                        onTextChanged: {
                            var v = parseFloat(text); if (!isNaN(v)) { ConfigManager.second = v; ConfigManager.saveConfig(); }
                        }
                    }
                }
                Text { text: "Import File:"; color: "#FFFFFF" }
                CheckBox {
                    id: importFileCheckbox
                    enabled: !AIObject.inferenceStatus
                    checked: ConfigManager.importFile
                    onCheckedChanged: { ConfigManager.importFile = checked; ConfigManager.saveConfig(); }
                }

                /*----- Hàng 4: Use TensorRT & Threshold -----*/
                Text { text: "Use TensorRT:"; color: "#FFFFFF" }
                CheckBox {
                    id: trtCheckbox
                    enabled: !AIObject.inferenceStatus
                    checked: ConfigManager.useTensorRT
                    onCheckedChanged: { ConfigManager.useTensorRT = checked; ConfigManager.saveConfig(); }
                }
                Text { text: "Threshold:"; color: "#FFFFFF" }
                Label { text: ConfigManager.threshold.toFixed(6); color: "#FFFFFF" }

                /*----- Hàng 5: TRT Model Path (chỉ hiện khi dùng TensorRT) -----*/
                Text {
                    text: "TRT Model Path:";
                    color: "#FFFFFF";
                    visible: trtCheckbox.checked
                }
                RowLayout {
                    visible: trtCheckbox.checked
                    Layout.columnSpan: 3
                    Layout.fillWidth: true
                    spacing: 8

                    Rectangle {
                        Layout.fillWidth: true
                        height: fieldHeight
                        radius: 6
                        color: "#222222"
                        border.color: "#FFFFFF"
                        TextInput {
                            id: trtModelPathInput
                            anchors.fill: parent
                            anchors.margins: 6
                            enabled: !AIObject.inferenceStatus
                            text: ConfigManager.trtModelPath
                            color: "#FFFFFF"
                            wrapMode: Text.NoWrap
                            onTextChanged: {
                                if (ConfigManager.trtModelPath !== text) {
                                    ConfigManager.trtModelPath = text;
                                    ConfigManager.saveConfig();
                                }
                            }
                        }
                    }
                    Rectangle {
                        width: fieldHeight; height: fieldHeight; radius: 4; color: "#cccccc"
                        MouseArea { anchors.fill: parent; onClicked: fileDialogTrt.open() }
                    }

                }
            }
        }
    }

    Button {
            text: qsTr("Back")
            onClicked: screenLoader.source = "./realTimeInference_data.qml"
    }

    /*--------------------------------------------------------------------
     *  FileDialog – đặt bên ngoài Flickable để tránh bị thu hồi khi cuộn
     *-------------------------------------------------------------------*/
    FileDialog {
        id: fileDialogFolder
        title: "Choose Folder"
	selectFolder: true
	selectExisting: true
        onAccepted: folderPathInput.text = fileUrl
    }
    FileDialog {
        id: fileDialogModel
        title: "Choose Model File"
	selectFolder: true
	selectExisting: true
        onAccepted: modelPathInput.text = fileUrl
    }
    FileDialog {
        id: fileDialogLog
        title: "Choose Log Folder"
	selectFolder: true
	selectExisting: true
        onAccepted: logPathInput.text = fileUrl
    }
    FileDialog {
        id: fileDialogTrt
        title: "Choose TRT Model"
	selectFolder: true
	selectExisting: true
        onAccepted: trtPathInput.text = fileDialogTrt.fileUrl
    }
}
