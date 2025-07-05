import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

Rectangle {
    width: 800
    height: 500
    color: "#2a2a2a"

    property int fileNum: 0

    Column {
        anchors.centerIn: parent
        width: parent.width
        height: 400
        spacing: 40

        Text {
            text: "Dataset Configuration"
            font.pointSize: 24
            font.bold: true
            font.family: "Oxanium"
            horizontalAlignment: Text.AlignHCenter
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        GridLayout {
            width: 750
            columns: 4
            columnSpacing: 15
            rowSpacing: 30
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: "Base Weight Path:"
                font.pointSize: 13
                color: "#ffffff"
                font.family: "Oxanium"
                Layout.alignment: Qt.AlignCenter
            }
            TextField {
                id: baseWeightPath
                text: TransferConfig.baseWeightPath
                width: 150
                height: 35
                Layout.fillWidth: true  // Cho phép mở rộng theo chiều ngang
                font.family: "Oxanium"
                readOnly: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 13
                clip: true
                // Đảm bảo cập nhật khi giá trị thay đổi từ C++
                Connections {
                    target: TransferConfig
                    function onBaseWeightPathChanged() {
                        if (baseWeightPath.text !== TransferConfig.baseWeightPath)
                            baseWeightPath.text = TransferConfig.baseWeightPath;
                    }
                }
                // Cập nhật khi người dùng nhập liệu, nhưng tránh vòng lặp
                onTextChanged: {
                    if (TransferConfig.baseWeightPath !== text) {
                        TransferConfig.baseWeightPath = text;
                        // TransferConfig.saveConfig();
                    }
                }
            }

            Rectangle {
                id: rectangle
                width: 35
                height: 35
                color: "#ffffff"

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        folderDialog1.open();
                    }
                }
            }

		Item { width: 35; height: 35 }

            Label {
                text: "TFRecord Path (Used):"
                font.pointSize: 13
                color: "#ffffff"
                font.family: "Oxanium"
                Layout.alignment: Qt.AlignCenter
            }
            TextField {
                id: tfrecordUsedPath
                text: TransferConfig.tfrecordUsedPath
                width: 600
                height: 35
                Layout.fillWidth: true
                font.family: "Oxanium"
                readOnly: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 13
                clip: true
                // Đảm bảo cập nhật khi giá trị thay đổi từ C++
                Connections {
                    target: TransferConfig
                    function onTfrecordUsedPathChanged() {
                        if (tfrecordUsedPath.text !== TransferConfig.tfrecordUsedPath)
                            tfrecordUsedPath.text = TransferConfig.tfrecordUsedPath;
                    }
                }
                // Cập nhật khi người dùng nhập liệu, nhưng tránh vòng lặp
                onTextChanged: {
                    if (TransferConfig.tfrecordUsedPath !== text) {
                        TransferConfig.tfrecordUsedPath = text;
                        // TransferConfig.saveConfig();
                    }
                }
            }

            Rectangle {
                id: rectangle1
                width: 35
                height: 35
                color: "#ffffff"

                MouseArea {
                    id: mouseArea1
                    anchors.fill: parent
                    onClicked: {
                        folderDialog2.open();
                    }
                }
            }

		Rectangle {
            	id: clearUsedPath
            	width: 35
            	height: 35
            	color: "#ff5c5c"

            	MouseArea {
                	anchors.fill: parent
                	onClicked: {
                    	tfrecordUsedPath.text = ""
                	}
            	}
            	Text {
                	text: "X"
                	anchors.centerIn: parent
                	color: "#ffffff"
            	}
        	}


            Label {
                text: "TFRecord Path (New):"
                font.pointSize: 13
                color: "#ffffff"
                font.family: "Oxanium"
                Layout.alignment: Qt.AlignCenter
            }
            TextField {
                id: tfrecordNewPath
                width: 600
                height: 35
                Layout.fillWidth: true
                font.family: "Oxanium"
                text: TransferConfig.tfrecordNewPath
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 13
                clip: true
                Connections {
                    target: TransferConfig
                    function onTfrecordNewPathChanged() {
                        if (tfrecordNewPath.text !== TransferConfig.tfrecordNewPath)
                            tfrecordNewPath.text = TransferConfig.tfrecordNewPath;
                    }
                }
                // Cập nhật khi người dùng nhập liệu, nhưng tránh vòng lặp
                onTextChanged: {
                    if (TransferConfig.tfrecordNewPath !== text) {
                        TransferConfig.tfrecordNewPath = text;
                        // TransferConfig.saveConfig();
                    }
                }
            }

            Rectangle {
                id: rectangle2
                width: 35
                height: 35
                color: "#ffffff"

                MouseArea {
                    id: mouseArea2
                    anchors.fill: parent
                    onClicked: {
                        folderDialog3.open();
                    }
                }
            }

		Item { width: 35; height:35 }

            Label {
                text: "Save Path:"
                font.pointSize: 13
                color: "#ffffff"
                font.family: "Oxanium"
                Layout.alignment: Qt.AlignCenter
            }
            TextField {
                id: savePath
                text: TransferConfig.savePath
                width: 600
                height: 35
                Layout.fillWidth: true
                font.family: "Oxanium"
                readOnly: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 13
                clip: true
                Connections {
                    target: TransferConfig
                    function onSavePathChanged() {
                        if (savePath.text !== TransferConfig.savePath)
                            savePath.text = TransferConfig.savePath;
                    }
                }
                // Cập nhật khi người dùng nhập liệu, nhưng tránh vòng lặp
                onTextChanged: {
                    if (TransferConfig.savePath !== text) {
                        TransferConfig.savePath = text;
                        // TransferConfig.saveConfig();
                    }
                }
            }

            Rectangle {
                id: rectangle3
                width: 35
                height: 35
                color: "#ffffff"

                MouseArea {
                    id: mouseArea3
                    anchors.fill: parent
                    onClicked: {
                        folderDialog4.open();
                    }
                }
            }

		Item {width: 35; height: 35 }

        }

        FileDialog {
            id: folderDialog1
            title: "Choose a folder"
            selectFolder: true // This is the key to select folders instead of files
            selectExisting: true // Make sure we select an existing one
            nameFilters: ["*"] // Display all folders
            onAccepted: {
                baseWeightPath.text = folderDialog1.fileUrl // Update the text with the folder URL
                console.log("Selected folder: " + folderDialog1.fileUrl)
            }
            onRejected: {
                console.log("Folder1 selection cancelled")
            }
        }
        FileDialog {
            id: folderDialog2
            title: "Choose a folder"
            selectFolder: true // This is the key to select folders instead of files
            selectExisting: true // Make sure we select an existing one
            nameFilters: ["*"] // Display all folders
            onAccepted: {
                tfrecordUsedPath.text = folderDialog2.fileUrl // Update the text with the folder URL
                console.log("Selected folder: " + folderDialog2.fileUrl)
            }
            onRejected: {
                console.log("Folder1 selection cancelled")
            }
        }
        FileDialog {
            id: folderDialog3
            title: "Choose a folder"
            selectFolder: true // This is the key to select folders instead of files
            selectExisting: true // Make sure we select an existing one
            nameFilters: ["*"] // Display all folders
            onAccepted: {
                tfrecordNewPath.text = folderDialog3.fileUrl // Update the text with the folder URL
                console.log("Selected folder: " + folderDialog3.fileUrl)
            }
            onRejected: {
                console.log("Folder1 selection cancelled")
            }
        }
        FileDialog {
            id: folderDialog4
            title: "Choose a folder"
            selectFolder: true // This is the key to select folders instead of files
            selectExisting: true // Make sure we select an existing one
            nameFilters: ["*"] // Display all folders
            onAccepted: {
                savePath.text = folderDialog4.fileUrl // Update the text with the folder URL
                console.log("Selected folder: " + folderDialog4.fileUrl)
            }
            onRejected: {
                console.log("Folder1 selection cancelled")
            }
        }

        Button {
            text: "Save Configuration"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 45
            font.pointSize: 16
            font.family: "Oxanium"
            background: Rectangle {
                color: "#0055ff"
                radius: 10
            }
            onClicked: {
                console.log("Base Weight Path:", baseWeightPath.text)
                console.log("TFRecord Path (Used):", tfrecordUsedPath.text)
                console.log("TFRecord Path (New):", tfrecordNewPath.text)
                console.log("Save Path:", savePath.text)
                // Add logic to save these paths to a JSON file
                TransferConfig.saveConfig();
                notificationCenter.showNotification("Transfer Dataset saved", "success", 1);

            }
        }
    }
}
