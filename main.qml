import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow
{
    visible: true
    width: 1280
    height: 800
    title: qsTr("Kitten Youtube Downloader")

    SwipeView
    {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Download
        {
        }

        Page
        {
            Label
            {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }
        }
    }

    footer: TabBar
    {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton
        {
            text: qsTr("Home")
        }
        TabButton
        {
            text: qsTr("Download")
        }
        TabButton
        {
            text: qsTr("Activity")
        }
        TabButton
        {
            text: qsTr("Kittens")
        }
    }
}
