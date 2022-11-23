import QtQuick 2.15
import "styles.js" as Style

Rectangle {
    id: root

    color: "transparent"

    signal finished

    ListModel {
        id: bubbleModel

        ListElement {
            isLeft: false
            isText: true
            isButton: false
            text: "test"
        }
    }

    ListModel {
        id: initialModel

        ListElement {
            isText: true
            text: "Please choose the bodypart"
        }
        ListElement {
            isLeft: true
            isYesOrNo: true
        }
    }

    BubbleList {
        id: content

        initialModel: initialModel
        bubbleModel: bubbleModel
    }
}

