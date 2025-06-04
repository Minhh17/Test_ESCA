import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.folderlistmodel 2.6
import Qt.labs.platform 1.1
import QtQuick.Dialogs 1.3

Rectangle {
    id: realtimeConfigWindow
    width: 1024
    height: 500
    color: "#151515"
    border.color: "#414141"

    // Bố cục chính
    ColumnLayout {
        x: 106
        y: 40
        width: 812
        height: 150
        spacing: 15

        // Tiêu đề
        Text {
            text: "REALTIME Configuration"
            font.pixelSize: 24
            font.family: "Oxanium"
            font.bold: true
            color: "#FFFFFF"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Import Folder Path:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 600
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: folderPathInput
                    enabled: !AIObject.inferenceStatus
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.folderPath
                    color: "#FFFFFF"

                    Connections {
                        target: ConfigManager
                        function onFolderPathChanged() {
                            if (folderPathInput.text !== ConfigManager.folderPath)
                                folderPathInput.text = ConfigManager.folderPath;
                        }
                    }

                    onTextChanged: {
                        if (ConfigManager.folderPath !== text) {
                            ConfigManager.folderPath = text;
                            ConfigManager.saveConfig();
                        }
                    }
                }
                Rectangle {
                    x: 566
                    y: 3
                    width: 25
                    height: 25
                    color: "#cccccc"

                    MouseArea {
                        id: mouseAreafolder
                        enabled: !AIObject.inferenceStatus
                        anchors.fill: parent
                        onClicked: {
                            fileDialogfolder.open()
                        }
                    }
                }
                FileDialog { // Thay thế FolderDialog bằng FileDialog
                    id: fileDialogfolder
                    // currentFolder: StandardPaths.writableLocation(StandardPaths.PicturesLocation)
                    title: "Choose a folder"
                   selectFolder: true // Thêm thuộc tính để chọn thư mục
                   selectExisting: true
                    onAccepted: {
                        folderPathInput.text = fileDialogfolder.fileUrl
                    }
                    onRejected: {
                        console.log("Canceled")
                    }
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Model:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 600
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: modelInput
                    enabled: !AIObject.inferenceStatus
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.modelPath
                    color: "#FFFFFF"
                    // Đảm bảo cập nhật khi giá trị thay đổi từ C++
                    Connections {
                        target: ConfigManager
                        function onModelPathChanged() {
                            if (modelInput.text !== ConfigManager.modelPath)
                                modelInput.text = ConfigManager.modelPath;
                        }
                    }

                    // Cập nhật khi người dùng nhập liệu, nhưng tránh vòng lặp
                    onTextChanged: {
                        if (ConfigManager.modelPath !== text) {
                            ConfigManager.modelPath = text;
                            ConfigManager.saveConfig();
                        }
                    }
                }
                Rectangle {
                    x: 566
                    y: 3
                    width: 25
                    height: 25
                    color: "#cccccc"

                    MouseArea {
                        id: mouseArea
                        enabled: !AIObject.inferenceStatus
                        anchors.fill: parent
                        onClicked: {
                            fileDialog.open()
                        }
                    }
                }
                FileDialog { // Thay thế FolderDialog bằng FileDialog
                    id: fileDialog
                    // currentFolder: StandardPaths.writableLocation(StandardPaths.PicturesLocation)
                    title: "Choose a folder"
                   selectFolder: true // Thêm thuộc tính để chọn thư mục
                   selectExisting: true
                    onAccepted: {
                        modelInput.text = fileDialog.fileUrl
                    }
                    onRejected: {
                        console.log("Canceled")
                    }
                }
            }
        }
    }

    ColumnLayout {
        x: 152
        y: 218
        spacing: 15

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Manual Threshold:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 100
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: manualThresholdInput
                    enabled: !AIObject.inferenceStatus
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.manualThreshold.toString()
                    color: "#FFFFFF"
                    onTextChanged: {
                        var value = parseFloat(text)
                        if (!isNaN(value) && value >= 0 && value <= 1) {
                            ConfigManager.manualThreshold = value
                            ConfigManager.saveConfig()
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Sample Size (bit):"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 100
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: sampleSizeInput
                    enabled: !AIObject.inferenceStatus
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.sampleSize.toString()
                    color: "#FFFFFF"
                    onTextChanged: {
                        var value = parseInt(text)
                        if (!isNaN(value) && value >= 100 && value <= 10000) {
                            ConfigManager.sampleSize = value
                            ConfigManager.saveConfig()
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Import File:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            CheckBox {
                id: importFileCheckbox
                enabled: !AIObject.inferenceStatus
                checked: ConfigManager.importFile
                onCheckedChanged: {
                    ConfigManager.importFile = checked
                    ConfigManager.saveConfig()
                }
            }
        }
    }

    ColumnLayout {
        x: 519
        y: 218
        spacing: 15

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Channels:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 100
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: channelsInput
                    enabled: !AIObject.inferenceStatus
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.channels.toString()
                    color: "#FFFFFF"
                    onTextChanged: {
                        var value = parseInt(text)
                        if (!isNaN(value) && value >= 1 && value <= 8) {
                            ConfigManager.channels = value
                            ConfigManager.saveConfig()
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Sampling Rate:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 100
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: samplingRateInput
                    enabled: !AIObject.inferenceStatus
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.samplingRate.toString()
                    color: "#FFFFFF"
                    onTextChanged: {
                        var value = parseInt(text)
                        if (!isNaN(value) && value >= 8000 && value <= 96000) {
                            ConfigManager.samplingRate = value
                            ConfigManager.saveConfig()
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Second:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 100
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: secondInput
                    enabled: !AIObject.inferenceStatus
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.second.toString()
                    color: "#FFFFFF"
                    onTextChanged: {
                        var value = parseInt(text)
                        if (!isNaN(value) && value >= 1 && value <= 60) {
                            ConfigManager.second = value
                            ConfigManager.saveConfig()
                        }
                    }
                }
            }
        }
    }

    Button {
        id: button
        x: 106
        y: 415
        text: qsTr("Inference Screen")

        onClicked: {
            screenLoader.source = "./realTimeInference_data.qml"
        }
    }
}
