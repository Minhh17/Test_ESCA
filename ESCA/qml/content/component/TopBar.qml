import QtQuick 2.15
import QtQuick.Controls 2.15
import ProjectImport 1.0 // Import component: Constants, Animation, ...
import "../component"

Rectangle {
    width: 1024
    height: 50
    color: "#000000"
    anchors.top: parent.top

	    property bool recStatus: RecordingObject.recStatus
    property bool infStatus: AIObject.inferenceStatus
    property bool tlStatus: TransferObject.tlStatus

    function getStatusText() {
        if (tlStatus) return qsTr("Transfer Learning");
        if (infStatus) return qsTr("Inferencing");
        if (recStatus) return qsTr("Recording");
        return "Feel Free!";
    }
	
    Text {
        id: textMinh
        color: "#00DFFE"
        text: qsTr("NHM-20214006")
        anchors.fill: parent
        font.pixelSize: 36
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Oxanium"
    }

Rectangle {
        x: 820
        y: 9
        width: 269
        height: 33
        color: "#000000"

        StatusLight {
            id: statusLight
            x: 0
            y: 3
            width: 23
            height: 25
        }

        Text {
            id: text1
            x: 23
            y: 0
            width: 238
            height: 34
            color: "#ffffff"
            text: getStatusText()
            font.pixelSize: 20
        }
    }

}
