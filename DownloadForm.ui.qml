import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.0

Item {
    width: 1280
    height: 800
    property alias button: button
    antialiasing: true

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.top: parent.top
    }

    Image {
        id: image1
        x: 206
        y: -24
        width: 905
        height: 233
        fillMode: Image.PreserveAspectFit
        source: "logo.png"
    }

    TextInput {
        id: urlInput
        x: 299
        y: 265
        width: 682
        height: 31
        text: qsTr("http://www.youtube.com/")
        antialiasing: true
        cursorVisible: true
        activeFocusOnPress: true
        font.weight: Font.Normal
        font.family: "Verdana"
        renderType: Text.NativeRendering
        font.pixelSize: 20
    }

    Rectangle {
        id: rectangle
        x: 292
        y: 258
        width: 697
        height: 42
        color: "#ffffff"
        z: -1
    }

    Button {
        id: button
        x: 1000
        y: 258
        width: 143
        height: 42
        text: qsTr("Paste URL")
        clip: false
        transformOrigin: Item.Center
        rotation: 0
        antialiasing: true
        font.capitalization: Font.MixedCase
        font.family: "Tahoma"
        autoExclusive: false
        autoRepeat: false
        onPressed: {
            urlInput.clear()
            urlInput.paste()
        }
    }

    ComboBox {
        id: outputFormatBox
        x: 299
        y: 329
        width: 171
        height: 48
        model: ListModel {
            id: outputFormats
            ListElement {
                text: "MP4 Video"
            }
            ListElement {
                text: "FLV Video"
            }
            ListElement {
                text: "WebM Video"
            }
            ListElement {
                text: "MKV Video"
            }
            ListElement {
                text: "AVI Video"
            }
            ListElement {
                text: "MP3 Audio"
            }
        }
    }

    Label {
        id: convertToLabel
        x: 184
        y: 340
        width: 94
        height: 23
        text: qsTr("Convert To:")
        font.pointSize: 14
        horizontalAlignment: Text.AlignRight
    }

    Label {
        id: saveToLabel
        x: 184
        y: 413
        width: 94
        height: 23
        text: qsTr("Save to:")
        font.pointSize: 14
        horizontalAlignment: Text.AlignRight
    }

    Button {
        id: browseButton
        x: 820
        y: 407
        width: 105
        height: 42
        text: "Browse"
        font.capitalization: Font.Capitalize
        font.family: "Tahoma"
        onPressed: folderDialog.open()
    }

    FolderDialog {
        id: folderDialog
        currentFolder: viewer.folder
        folder: StandardPaths.standardLocations(
                    StandardPaths.DesktopLocation)[0]
        onAccepted:
        {
            var path = folder.toString();
            // remove prefixed "file:///"
            path = path.replace(/^(file:\/{2})/,"");
            // unescape html codes like '%23' for '#'
            path = decodeURIComponent(path);
            pathInput.text = path;
        }
    }

    TextInput {
        id: pathInput
        x: 299
        y: 412
        width: 490
        height: 31
        font.weight: Font.Normal
        font.family: "Verdana"
        antialiasing: true
        renderType: Text.NativeRendering
        activeFocusOnPress: true
        font.pixelSize: 20
        cursorVisible: true
    }

    Rectangle {
        id: rectangle1
        x: 292
        y: 407
        width: 505
        height: 42
        color: "#ffffff"
        z: -1
    }

    Button {
        id: button2
        x: 292
        y: 493
        width: 239
        height: 101
        text: qsTr("Download")
        enabled: true
        checked: false
        checkable: false
        highlighted: false
        font.capitalization: Font.MixedCase
        clip: false
        autoExclusive: false
        font.family: "Tahoma"
        antialiasing: true
        autoRepeat: false
        rotation: 0
        transformOrigin: Item.Center
    }

    Label {
        id: label2
        x: 185
        y: 267
        width: 94
        height: 23
        text: qsTr("Video URL:")
        font.pointSize: 14
        horizontalAlignment: Text.AlignRight
    }
}
