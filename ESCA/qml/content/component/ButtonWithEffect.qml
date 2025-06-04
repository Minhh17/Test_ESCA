import QtQuick 2.15

Rectangle {
    id: recordRec
    width: 140
    height: 50
    color: "#000000"
    radius: 1000

    Text {
        id: buttonTx
        anchors.centerIn: parent
        text: model.name
        font.pointSize: 14
        font.styleName: "Regular"
        font.family: "Oxanium"
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 3
        color: model.index === selectedIndex ? "#00DFFE" : "#7F7E8C"
    }

    FontLoader {
        id: oxanimuFont
        source: "../fonts/Oxanium-Regular.ttf"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            selectedIndex = model.index
            screenLoader.source = model.screenPath
            scaleAnim.start()
        }
    }

    // Scale animation for the click effect
    SequentialAnimation {
        id: scaleAnim
        NumberAnimation {
            target: recordRec
            property: "scale"
            from: 1.0
            to: 1.2
            duration: 100
        }
        NumberAnimation {
            target: recordRec
            property: "scale"
            from: 1.2
            to: 1.0
            duration: 100
        }
    }
}
