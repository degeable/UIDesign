import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "styles.js" as Style

Rectangle {
    id: card

    property alias text: text.text

    width: root.width / 1.5
    height: Style.bubbleMinHeight

    color: isButton ? "transparent" : leftSide ? Style.blueBase : Style.lightGray
    radius: 30

    Text {
        id: text

        visible: bubble.textBubble
        color: Style.darkTextColor
        text: ""
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10

        elide: Text.ElideRight
    }
}
