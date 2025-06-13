import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
    id: root
    property string message: ""
    property string note: ""
    signal responded(bool confirmed, string note)

    onOpened: {
        noteField.text = ""
        note = ""
    }

    modal: true
    focus: true
    width: 300
    height: 200
    anchors.centerIn: Overlay.overlay

    Rectangle {
        anchors.fill: parent
        radius: 8
        color: "#333"
        opacity: 0.95
    }

    Column {
        anchors.centerIn: parent
        spacing: 10
        width: parent.width - 40
        Text {
            text: root.message
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            color: "white"
        }
        TextArea {
            id: noteField
            width: parent.width
            placeholderText: qsTr("Nguyên nhân: ")
            onTextChanged: root.note = text
            color: "white"
        }
        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: qsTr("OK")
                onClicked: {
                    root.responded(true, noteField.text)
                    root.close()
                }
            }
            Button {
                text: qsTr("Không rõ")
                onClicked: {
                    root.responded(false, noteField.text)
                    root.close()
                }
            }
        }
    }
}
