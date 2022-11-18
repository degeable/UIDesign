import QtQuick 2.15
import QtQuick.Controls 2.15
//import QtQuick.Studio.Effects 1.0
//import QtQuick3D.Effects 6.0

Item {
    id: root

    width: 480
    height: 620
    layer.smooth: false
    layer.mipmap: false

    ListView {
        id: listView

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 60
        anchors.leftMargin: 120
        anchors.rightMargin: 120

        spacing: 5

        width: parent.width
        height: parent.height / 3

        delegate: RoundButton {
            width: parent.width

            text: model.name
            highlighted: false
            flat: false
        }

        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
    }

    Rectangle {
        id: rectangle1
        color: "#ffffff"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        z: -1
    }
}
