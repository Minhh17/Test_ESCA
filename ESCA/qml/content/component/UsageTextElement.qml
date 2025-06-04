import QtQuick 2.8

Item {
    id: timerElement
    width: 176
    height: 121
    property alias _45Text: _45.text
    property alias minutesRemainingText: minutesRemaining.text

    Text {
        id: _45
        x: 0
        y: 0
        width: 176
        height: 75
        color: "#ffffff"
        text: "45"
        font.pixelSize: 60
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Oxanium"
        font.weight: Font.Normal
    }

    Text {
        id: minutesRemaining
        x: 0
        y: 75
        width: 176
        height: 46
        color: "#ffffff"
        text: "Minutes Remaining"
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Oxanium"
        font.weight: Font.Normal
    }
}
