import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.folderlistmodel 2.6
import FileIO 1.0

Rectangle {
    width: 1024
    height: 460
    color: "#2a2a2a"

    property url currentFolder: LogFolderPath
    property string selectedFile: ""

    FileIO { id: fileio }

    RowLayout {
        anchors.fill: parent
        spacing: 8

        ListView {
            id: listView
            Layout.preferredWidth: 350
            Layout.fillHeight: true
            model: FolderListModel {
                id: folderModel
                folder: currentFolder
                showDirsFirst: true
            }
            delegate: Rectangle {
                width: listView.width
                height: 28
                color: fileIsDir ? "#394251" : "#272d37"
                Text { text: fileName; color: "white"; anchors.verticalCenter: parent.verticalCenter; anchors.left: parent.left; anchors.leftMargin: 8 }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (fileIsDir) {
                            currentFolder = fileURL
                            folderModel.folder = fileURL
                        } else {
                            selectedFile = fileURL
                            var p = selectedFile.toString().replace('file://','')
                            textArea.text = fileio.readFile(p)
                        }
                    }
                }
            }
        }

        TextArea {
            id: textArea
            Layout.fillWidth: true
            Layout.fillHeight: true
            readOnly: true
            wrapMode: Text.WrapAnywhere
        }
    }
}

