import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3 // Sửa từ 1.0 sang 1.3
// Import folder list
import Qt.labs.folderlistmodel 2.6
// Import for play Audio
import QtMultimedia 5.15
// Import for delete file
import FileIO 1.0
import Qt.labs.settings 1.1

Rectangle {
    id: frame_1
    width: 800
    height: 440
    color: "#2a2a2a"

    FileIO {
        id: fileIO
    }

    // tool Bar
    Rectangle {
        id: rectangle_55
        x: 0
        y: 0
        width: 801
        height: 480
        color: "#2a2a2a"

        // ListView Folder and File
        Rectangle {
            id: mainRect
            x: 16
            y: 95
            width: 768
            height: 290
            color: "#272d37"
            ListView {
                id: listView
                property int selectedItemIndex: -1
                property string selectedFileName: ""
                x: 0
                y: 17
                width: parent.width
                height: parent.height
                clip: true
                model: FolderListModel {
                    id: folderListModel
                    showDirsFirst: true
                    // folder: "file:///home"
                    folder: appSettings.defaultFolder || "file:///home"
                    property var folderStack: []
                    onFolderChanged: {
                        folderStack.push(folder)
                    }
                    function popFolderFromStack() {
                        if (folderStack.length > 1) {
                            folderStack.pop();
                            folder = folderStack[folderStack.length - 1];
                        }
                    }
                }
                delegate: Rectangle {
                    id: rectangle
                    width: parent.width
                    height: 60
                    border.color: "black"
                    Text {
                        id: text1
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        width: 158
                        height: 22
                        text: fileName
                        color: "#ffffff"
                        font.pixelSize: 20
                    }
                    Text {
                        id: text2
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        width: 158
                        height: 22
                        text: fileIsDir ? "" : ((fileSize / 1024).toFixed(2) + " KB")
                        color: "#ffffff"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignRight
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(fileIsDir){
                                folderListModel.folder = fileURL
                                text3.text = folderListModel.folder
                            }
                            listView.selectedItemIndex = index;
                            listView.selectedFileName = fileName;
                        }
                    }
                    color: listView.selectedItemIndex === index ? "#aaddff" : (fileIsDir ? "#e3e3e3" : "#272d37")
                }

                MouseArea {
                    id: mouseArea
                    x: 652
                    y: 325
                    width: 91
                    height: 29
                }

                MouseArea {
                    id: mouseArea1
                    x: 652
                    y: 292
                    width: 81
                    height: 27
                }
            }
        }

        Settings {
            id: appSettings
            property alias defaultFolder: folderListModel.folder
        }

        Rectangle {
            id: rectangle1
            x: 16
            y: 55
            width: 768
            height: 50
            color: "#394251"

            // backward feature
            Image {
                id: image
                x: 15
                y: 6
                width: 40
                height: 40
                source: "../images/icons8-back-50.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        folderListModel.folder = folderListModel.parentFolder
                        text3.text = folderListModel.folder
                    }
                }
            }
            // forward feature
            Image {
                id: image1
                x: 60
                y: 6
                width: 40
                height: 40
                source: "../images/icons8-right-50.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        folderListModel.popFolderFromStack();
                        text3.text = folderListModel.folder;
                    }
                }
            }

            // choose folder feature
            Rectangle {
                id: rectangle2
                x: 110
                y: 7
                border.color: "black"
                width: 612
                height: 36
                radius: 10
                color: "#ffffff"
                TextField {
                    id: text3
                    x: 8
                    y: 0
                    width: 600
                    height: 36
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    placeholderText: "Choose folder to open"
                    maximumLength: 100
                    background: Rectangle {
                        border.width: 0
                        color: "transparent"
                    }
                    text: folderListModel.folder
                }
                FileDialog { // Thay thế FolderDialog bằng FileDialog
                    id: fileDialog
                    // currentFolder: StandardPaths.writableLocation(StandardPaths.PicturesLocation)
                    title: "Choose a folder"
                    selectFolder: true // Thêm thuộc tính để chọn thư mục
                    onAccepted: {
                        text3.text = fileDialog.fileUrl
                        folderListModel.folder = fileDialog.fileUrl
                    }
                    onRejected: {
                        console.log("Canceled")
                    }
                }
                Rectangle {
                    id: rectangle_82
                    x: 619
                    y: 0
                    width: 32
                    height: 36
                    color: "#ffffff"
                    radius: 8

                    Image {
                        id: folderopenregular
                        x: 4
                        y: 8
                        width: 24
                        height: 23
                        source: "../images/folder-open-regular.svg"
                        fillMode: Image.PreserveAspectFit
                    }

                    MouseArea {
                        anchors.centerIn: parent
                        anchors.fill: parent
                        onClicked: {
                            fileDialog.open();
                        }
                    }
                }
            }
        }

        Rectangle {
            id: feature_rectangle
            x: 16
            y: 400
            width: 768
            height: 36
            color: "#394251"

            // delete feature
            Rectangle {
                id: rectangle4
                x: 650
                width: 84
                height: 28
                color: "#ffffff"
                radius: 10
                border.color: "#000000"
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    id: text5
                    color: "#000000"
                    text: qsTr("Delete")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (listView.selectedFileName !== "") {
                            var filePath = folderListModel.folder + "/" + listView.selectedFileName;
                            filePath = filePath.replace("file://", "");
                            console.log("Trying delete file:", filePath);

                            if (fileIO.fileExists(filePath)) {
                                var success = fileIO.removeFile(filePath);
                                if (success) {
                                    console.log("Delete done:", filePath);
                                    folderListModel.refresh(); // Lam moi danh sach sau khi xoa
                                } else {
                                    console.log("Failed to delete file:", filePath);
                                }
                            } else {
                                console.log("File doesn't exist: ", filePath);
                            }
                        } else {
                            console.log("No file is selected");
                        }

                    }
                }

            }

            // import feature
            Rectangle {
                id: rectangle5
                x: 100
                width: 80
                height: 28
                color: "#ffffff"
                radius: 10
                border.color: "#000000"
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    id: text6
                    text: qsTr("Import")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            // share feature
            Rectangle {
                id: rectangle6
                x: 200
                width: 80
                height: 28
                color: "#ffffff"
                radius: 10
                border.color: "#000000"
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    id: text7
                    text: qsTr("Share")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            // play audio feature
            Rectangle {
                id: rectangle7
                x: 495
                width: 67
                height: 28
                color: "#ffffff"
                radius: 10
                border.color: "#000000"
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    id: text8
                    text: qsTr("Play")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (listView.selectedItemIndex !== -1) {
                            audioPlayer.source = folderListModel.get(listView.selectedItemIndex,"fileURL")
                            audioPlayer.play()
                        }
                    }
                }
            }

            // stop audio feature
            Rectangle {
                id: rectangle3
                x: 575
                width: 67
                height: 28
                color: "#ffffff"
                radius: 10
                border.color: "black"
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    id: text4
                    text: qsTr("Stop")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        audioPlayer.stop()
                    }
                }
            }
        }
    }

    // header
    Rectangle {
        id: rectangle_76
        x: 237
        y: 14
        width: 326
        height: 40
        color: "#69000822"
        radius: 8
        Text {
            color: "#ffffff"
            text: qsTr("File manager")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.Normal
            font.underline: false
            font.italic: false
            font.family: "Itim"
            font.bold: false
        }
        // anchors.horizontalCenter: rectLayout.horizontalCenter
    }

    // Khai báo MediaPlayer
    MediaPlayer {
        id: audioPlayer
        source: ""
    }

}
