import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "styles.js" as Style

Rectangle {

    property alias headerText: headerText.text
    property alias headerTextColor: headerText.color
    property alias cardTextColor: text.color
    property alias cardText: text.text
    property alias bottomText: bottomText.text
    property alias headerColor: header.color
    property alias color: card.color
    property alias mouseArea: mouseArea

    width: root.width / 1.5
    height: Style.bubbleMinHeight

    id: card

    color: Style.backgroundDark
    radius: 30

    Rectangle {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        radius: 30

        height: parent.height / 3

        color: Style.greenBase

        Rectangle {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height / 2
            color: parent.color
        }

        Text {
            id: headerText

            color: Style.darkTextColor
            anchors.centerIn: parent

            elide: Text.ElideRight
        }
    }

    Text {
        id: text

        color: Style.lightTextColor
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10

        elide: Text.ElideRight
    }

    Text {
        id: bottomText

        color: "red"

        anchors.top: text.top
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.topMargin: 30
        anchors.leftMargin: 10

        elide: Text.ElideRight
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
    }
}

