import QtQuick 2.15
import QtQuick.Controls 2.15
import "../component"
import QtQuick.Dialogs 1.0

Rectangle {
    property bool connected: false
    Rectangle {
        id: frame_27
        width: 1024
        height: 500
        color: "#2a2a2a"
        property alias model_name_to_outputText: model_name_to_output.text
        property alias select_folder_to_storedText: select_folder_to_stored.text
        property alias executionText: execution.text

        Rectangle {
            id: rectangle
            x: 33
            y: 132
            width: 380
            height: 64
            color: "#061d33"
            border.color: "#e0a3339a"
        }

        Image {
            id: image_render
            x: 451
            y: 97
            fillMode: Image.PreserveAspectCrop
            source: "/ui/assets/defaultLearningImg.png"    // default img
        }

        Rectangle {
            id: rectangle_73
            x: 75
            y: 407
            width: 211
            height: 54
            color: "#6935416c"
            radius: 8

            Text {
                id: execution
                width: 154
                height: 35
                color: "#ffffff"
                text: connected ? qsTr("Stop") : qsTr("Execution")
                font.pixelSize: 26
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Bold
                anchors.centerIn: parent
                font.family: "Josefin Sans"
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent

                onClicked: {
                    connected = !connected;
                }
            }
        }

        Text {
            id: select_folder_to_stored
            x: 48
            y: 101
            width: 365
            height: 24
            color: "#ffffff"
            text: qsTr("Select folder to stored")
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Itim"
        }

        TextInput {
            id: folder_save_file
            width: 272
            height: 24
            color: "#ffffff"
            text: qsTr("home/data_after_training")
            font.pixelSize: 22
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap
            font.weight: Font.Light
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -88
            anchors.horizontalCenterOffset: -329
            font.family: "Josefin Sans"
        }

        Rectangle {
            id: rectangle_76
            x: 399
            y: 12
            width: 246
            height: 52
            color: "#69000822"
            radius: 8

            Text {
                id: base_learning_text
                x: 21
                y: 8
                color: "#ffffff"
                text: qsTr("Base Training")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: false
                font.pointSize: 24
            }
        }

        Text {
            id: model_name_to_output
            x: 47
            y: 227
            width: 298
            height: 23
            color: "#ffffff"
            text: qsTr("Model name to output")
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Itim"
        }

        Rectangle {
            id: rectangle_81
            x: 355
            y: 148
            width: 44
            height: 36
            color: "#6935416c"
            radius: 8

            MouseArea {
                id: mouseArea1
                anchors.fill: parent
                onClicked: {
                    choose_folder_save_file.open();
                }
            }
        }


        ComboBox {
            id: comboBox
            x: 33
            y: 262
            width: 380
            height: 64
            model: ["Model 1", "Model 2", "Model 3"]

            // Customizing the appearance of items in the ComboBox
            delegate: Item {
                width: comboBox.width
                height: 30

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "lightblue" // Background color
                    border.color: "#e0a3339a"

                    Text {
                        anchors.centerIn: parent
                        text: modelData
                        color: "white" // Set the text color
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            comboBox.currentIndex = index
                        }
                    }
                }
            }

            //            Signal handler for item selection change
            onCurrentIndexChanged: {
                var selectedItem = model[currentIndex] // Get the selected item
                console.log("Selected Item:", selectedItem)
                // Add logic here
            }
        }
    }
}
