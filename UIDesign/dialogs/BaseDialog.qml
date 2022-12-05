import QtQuick 2.15
import "../components"
import "../styles.js" as Style

Rectangle {
    id: root

    color: "transparent"

    signal done

    property ListModel bubbleModel: undefined
    property ListModel initialModel: undefined

    BubbleList {
        id: content

        anchors.fill: parent

        initialModel: root.initialModel
        bubbleModel: root.bubbleModel
    }
}

