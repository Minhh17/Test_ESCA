import QtQuick 2.15
import QtQuick.Controls 2.15
import "../component"
// Import folder list
// import Qt.labs.folderlistmodel 2.6

Rectangle {
    width: 1024
    height: 500
    color: "#2a2a2a"

    Image {
        id: image1
        x: 142
        y: 119
        width: 248
        height: 103
        source: "../images/si-synergy-logo.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image2
        x: 444
        y: 104
        width: 137
        height: 135
        source: "../images/hust-logo.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image3
        x: 385
        y: 42
        width: 712
        height: 257
        source: "../images/sparc-lab-logo.png"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: text4
        x: 237
        y: 287
        color: "#ffffff"
        text: qsTr("Environmental Sound Collection and Analysis embedded applications")
        font.pixelSize: 20
        font.family: "Oxanium"
    }
    Text {
        id: text5
        x: 270
        y: 328
        color: "#ffffff"
        text: qsTr("HUST Industry-Academia Collaboration Project")
        font.pixelSize: 25
        font.family: "Oxanium"
    }

}
