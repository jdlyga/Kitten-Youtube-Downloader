import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    width: 1280
    height: 800

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
}
