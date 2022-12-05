import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import "../styles.js" as Style

Rectangle {
    id: card

    property alias headerText: headerText.text
    property alias headerFont: headerText.font
    property alias textFont: text.font
    property alias headerTextColor: headerText.color
    property alias cardTextColor: text.color
    property alias cardText: text.text
    property alias bottomText: bottomText.text
    property alias headerColor: header.color
    property alias mouseArea: mouseArea
    property alias headerHeight: header.height
    property alias headerIcon: headerIcon.source
    property alias headerIconColor: overlay.color
    default property alias contents: content.data


    height: Style.bubbleMinHeight

    color: Style.backgroundDark
    radius: 30

    Rectangle {
        id: header

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        radius: 30

        z: 2

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

        Image {
            id: headerIcon

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: Style.baseMargin
            anchors.leftMargin: 15

            width: Style.buttonIconSize
            height: Style.buttonIconSize
        }

        ColorOverlay {
            id: overlay

            anchors.fill: headerIcon
            source:headerIcon
            color: "black"
            antialiasing: true
            visible: true
        }
    }

    Item {
        id: content

        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
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

