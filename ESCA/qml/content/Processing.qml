import QtQuick 2.15
import QtQuick.Controls 2.15
import ProjectImport 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height - 140
    color: Constants.backgroundColor

    TextField {
        id: textfield
        anchors.centerIn: parent
        onFocusChanged: Constants.showKeyboardFunc(textfield)
        onAccepted: {
            console.log("Enter pressed: " + textfield.text)
            textfield.focus = false
        }
    }

    Button {
        id: button
        text: qsTr("Press me")
        checkable: true
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            animation.start()
            console.log("Hello")
        }
    }

    Text {
        id: label
        text: qsTr("Hello Minh")
        anchors.top: button.bottom
        font.styleName: "Regular"
        font.family: "Oxanium"
        anchors.topMargin: 45
        anchors.horizontalCenter: parent.horizontalCenter

        SequentialAnimation {
            id: animation
            ColorAnimation {
                id: colorAnimation1
                target: rectangle
                property: "color"
                to: "#2294c6"
                from: Constants.backgroundColor
            }
            ColorAnimation {
                id: colorAnimation2
                target: rectangle
                property: "color"
                to: Constants.backgroundColor
                from: "#2294c6"
            }
        }
    }
    states: [
        State {
            name: "clicked"
            when: button.checked
            PropertyChanges {
                target: label
                text: qsTr("Button Checked")
            }
        }
    ]
}
