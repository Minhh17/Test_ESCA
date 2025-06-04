import QtQuick 2.15
import QtQuick.Controls 2.15
import ProjectImport 1.0

Rectangle {
    width: Constants.width
    height: 50
    anchors.bottom: parent.bottom
    color: Constants.darkColor

    property int selectedIndex: 0

    ListModel {
        id: buttonModel
        ListElement { name: "Record"; screenPath: "../RecordModule/RecordModule.qml" }
        ListElement { name: "Manipulation"; screenPath: "../AudioManipulation/processData.qml" }
        ListElement { name: "BaseTraining"; screenPath: "../BaseTraining/baseLearning.qml" }
        ListElement { name: "SystemInfo"; screenPath: "../SystemInformation/SysInfoModule.qml" }
        ListElement { name: "Inference"; screenPath: "../Inference/realTimeInference_data.qml" }
        ListElement { name: "TransferLearning"; screenPath: "../TransferLearning/transferLearning.qml" }
        ListElement { name: "Help"; screenPath: "../RecordModule/RecordModule.qml" }
    }

    Row {
        width: parent.width
        height: 50
        anchors.centerIn: parent
        spacing: 8

        Repeater {
            model: buttonModel
            delegate: ButtonWithEffect {}
        }
    }
}
