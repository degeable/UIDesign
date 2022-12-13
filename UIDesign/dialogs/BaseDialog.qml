import QtQuick 2.15
import "../components"
import "../styles.js" as Style

Rectangle {
    id: root

    color: "transparent"

    signal done

    onDone: {
        console.log("doneTriggerd")
    }

    property ListModel bubbleModel: undefined
    property ListModel initialModel: undefined
    property alias actualModel: content.actualModel
    property alias bubbleCounter: content.bubbleCounter

    BubbleList {
        id: content

        anchors.fill: parent

        initialModel: root.initialModel
        bubbleModel: root.bubbleModel
    }
}

