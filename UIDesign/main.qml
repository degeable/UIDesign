import QtQuick
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id: background

        anchors.fill: parent
        anchors.margins: 10

        color: "blue"

        Button {
            anchors.centerIn: parent
            text: "Test"

            onClicked: background.color.a = background.color.a / 2

        }


    }

    }
