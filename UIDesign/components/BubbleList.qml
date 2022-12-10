import QtQuick 2.15
import "../styles.js" as Style

ListView {
    id: content

    property ListModel initialModel: undefined
    property ListModel bubbleModel: undefined
    property alias actualModel: actualModel
    property int bubbleCounter: 0

    anchors.topMargin: 20
    anchors.bottomMargin: 20

    function nextBubbleTriggered() {
        actualModel.append(bubbleModel.get(bubbleCounter++))
        actualModel.append(bubbleModel.get(bubbleCounter++))
    }

    function fin() {
        done()
    }

    ListModel {
        id: actualModel
    }

    Timer {
        id: firstBubbleTimer
        interval: 200
        repeat: false
        running: false
        onTriggered: actualModel.append(initialModel.get(0))
    }

    Timer {
        id: secondBubbleTimer
        interval: 1800
        repeat: false
        running: false
        onTriggered: {
            actualModel.append(initialModel.get(1))
            actualModel.append(initialModel.get(2))
        }
    }

   onVisibleChanged: {
        if (visible && actualModel.count === 0) {
            firstBubbleTimer.start()
            secondBubbleTimer.start()
        }
    }

    onCountChanged: content.currentIndex = count - 1
    anchors.fill: parent
    spacing: 20
    model: actualModel

    delegate: BubbleComponent {}

    add: Transition {
        NumberAnimation {
            property: "opacity"
            from: 0
            to: 1.0
            duration: Style.changeAnimationTime
        }
        NumberAnimation {
            property: "scale"
            from: 0
            to: 1.0
            duration: Style.changeAnimationTime
        }
    }
}
