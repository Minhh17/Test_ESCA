import QtQuick 2.15
import QtQuick.Controls 2.15
import "../component"
import QtQuick.Dialogs 1.2


Rectangle {
    id: frame_1
    width: 1024
    height: 500
    color: "#2a2a2a"

    property string chooseFile: ""
    property string targetFolder: ""

    // BACKGOUND
    Rectangle {
        id: rectangle_55
        x: 0
        y: 0
        width: 1024
        height: 500
        color: "#2a2a2a"
    }

    // HEADER
    Rectangle {
        id: rectangle_76
        x: 369
        y: 14
        width: 287
        height: 60
        color: "#69000822"
        radius: 8
        Text {
            color: "#ffffff"
            text: qsTr("Process Data")
            anchors.fill: parent
            font.pixelSize: 33
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            font.underline: false
            font.italic: false
            font.bold: false
            font.weight: Font.Normal
            font.family: "Itim"
        }
    }
    // filemanager


    Rectangle {
        id: mainRect
        x: 25
        y: 93
        width: 448
        height: 351
        //        border.color: "black"
        color: "#272d37"

        Label {
            x: 20
            y: 85
            text: "Choose Source"
            font.pointSize: 13
            color: "#ffffff"
            font.family: "Oxanium"
        }
        TextField {
            id: chooseSourceTx
            x: 8
            y: 117
            placeholderText: "Choose File/Folder to process"
            //            text: TransferConfig.baseWeightPath
            width: 432
            height: 45
            font.family: "Oxanium"
            readOnly: true
            font.pointSize: 13
            // Đảm bảo cập nhật khi giá trị thay đổi từ C++
            Connections {
                //                target: TransferConfig
                //                function onBaseWeightPathChanged() {
                //                    if (baseWeightPath.text !== TransferConfig.baseWeightPath)
                //                        baseWeightPath.text = TransferConfig.baseWeightPath;
                //                }
            }
            // Cập nhật khi người dùng nhập liệu, nhưng tránh vòng lặp
            onTextChanged: {
                //                if (TransferConfig.baseWeightPath !== text) {
                //                    TransferConfig.baseWeightPath = text;
                //                    // TransferConfig.saveConfig();
                //                }
            }
        }

        Rectangle {
            id: rectangle
            x: 207
            y: 76
            width: 35
            height: 35
            color: "#ffffff"

            MouseArea {
                id: chooseFileMa
                anchors.fill: parent
                anchors.centerIn: parent
                onClicked: {
                    folderDialog1.open();
                }
            }
        }

        TextField {
            id: chooseTargetTx
            x: 8
            y: 257
            width: 432
            height: 45
            font.pointSize: 13
            Connections {
            }
            placeholderText: "Choose File/Folder to process"
            readOnly: true
            font.family: "Oxanium"
        }

        Label {
            x: 20
            y: 229
            color: "#ffffff"
            text: "Choose Target Folder"
            font.pointSize: 13
            font.family: "Oxanium"
        }

        Rectangle {
            id: rectangle1
            x: 207
            y: 216
            width: 35
            height: 35
            color: "#ffffff"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    folderDialog2.open();
                }
                anchors.centerIn: parent
            }
        }

        FileDialog {
            id: folderDialog1
            title: "Choose a file"
            selectFolder: true // This is the key to select folders instead of files
            selectExisting: true // Make sure we select an existing one

            nameFilters: ["*"] // Display all folders
            onAccepted: {
                var urlStr = folderDialog1.fileUrl.toString()
                chooseSourceTx.text = urlStr.replace("file://", "");
                chooseFile = urlStr.replace("file:///", "");
                console.log("Selected file: " + chooseSourceTx.text)
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
                var urlStr = folderDialog2.fileUrl.toString()
                chooseTargetTx.text = urlStr.replace("file:///", "");
                chooseFile = urlStr.replace("file:///", "");
                console.log("Selected folder: " + chooseTargetTx.text)
            }
            onRejected: {
                console.log("Folder2 selection cancelled")
            }
        }
    }

    // menu
    Rectangle {
        id: rectangle5
        x: 96
        y: 101
        width: 306
        height: 43
        color: "#69000822"
        radius: 8
        Text {
            id: text5
            color: "#ffffff"
            text: qsTr("Select files to process")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    // ruler
    Rectangle {
        id: rectangleruler
        x: 514
        y: 101
        width: 2
        height: 373
        color: "#ffffff"
    }

    //Select processing feature
    Rectangle {
        id: rectangle6
        x: 627
        y: 101
        width: 306
        height: 43
        color: "#69000822"
        radius: 8
        Text {
            id: text6
            color: "#ffffff"
            text: qsTr("Select processing feature")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        id: rectangle7
        x: 540
        y: 178
        width: 150
        height: 63
        color: "#394251"
        radius: 8
        Text {
            id: text7
            color: "#ffffff"
            text: qsTr("Frequencies")
            anchors.fill: parent
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
            cursorShape: Qt.WaitCursor
            onClicked: {
                AudioManipulationObject.extractFrequency(chooseFile);
            }
        }
    }

    Rectangle {
        id: rectangle8
        x: 699
        y: 178
        width: 155
        height: 63
        color: "#394251"
        radius: 8
        Text {
            id: text8
            color: "#ffffff"
            text: qsTr("Spectrograms")
            anchors.fill: parent
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        id: rectangle9
        x: 863
        y: 178
        width: 150
        height: 63
        color: "#394251"
        radius: 8
        Text {
            id: text9
            color: "#ffffff"
            text: qsTr("Split to 2s")
            anchors.fill: parent
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
        }
        MouseArea {
            id: splitAuMa
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
            cursorShape: Qt.WaitCursor
            onClicked: {
                chooseFile = chooseSourceTx.text;
                targetFolder = chooseTargetTx.text;
                AudioManipulationObject.splitAudio(chooseFile, targetFolder, "2")
            }
        }

    }

    Rectangle {
        id: rectangle10
        x: 540
        y: 250
        width: 473
        height: 63
        color: "#394251"
        radius: 8
        Text {
            id: text10
            color: "#ffffff"
            text: qsTr("Gammatone Frequency Cepstral Coefﬁcients")
            anchors.fill: parent
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
            cursorShape: Qt.WaitCursor
            onClicked: {
                chooseFile = chooseSourceTx.text;
                AudioManipulationObject.extractGFCC(chooseFile);
            }
        }
    }

    Rectangle {
        id: rectangle11
        x: 540
        y: 327
        width: 473
        height: 63
        color: "#394251"
        radius: 8
        Text {
            id: text11
            color: "#ffffff"
            text: qsTr("Mel-Frequency Cepstral Coefﬁcients")
            anchors.fill: parent
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            id: mouseArea2
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
            cursorShape: Qt.WaitCursor
            onClicked: {
                chooseFile = chooseSourceTx.text;
                AudioManipulationObject.extractMFCC(chooseFile);
            }
        }
    }
}


