pragma Singleton
import QtQuick 2.15

QtObject {
    readonly property int width: 1024
    readonly property int height: 600
    readonly property string darkColor: "#000000"
    readonly property color backgroundColor: "#2a2a2a"
    readonly property color defaultColor: "#7F7E8C"
    readonly property color focusColor: "#00DFFE"

    property string relativeFontDirectory: "fonts"

    property bool showKeyboard: false

    function showKeyboardFunc(textfield) {
        if (textfield.focus) {
            Constants.showKeyboard = true;
        } else {
            Constants.showKeyboard = false;
        }
    }

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: Qt.application.font.family,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: Qt.application.font.family,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })   


    property DirectoryFontLoader directoryFontLoader: DirectoryFontLoader {
        id: directoryFontLoader
    }
}
