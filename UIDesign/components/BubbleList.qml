import QtQuick 2.15
import "../styles.js" as Style

ListView {
    id: content

    property ListModel initialModel: undefined
    property ListModel bubbleModel: undefined
    property int bubbleCounter: 0

    anchors.topMargin: 20
    anchors.bottomMargin: 20

    function nextBubbleTriggered() {
        initialModel.append(bubbleModel.get(bubbleCounter++))
        initialModel.append(bubbleModel.get(bubbleCounter++))
    }

    function fin(){
        done()
    }

    onCountChanged: content.currentIndex = count - 1
    anchors.fill: parent
    spacing: 20
    model: initialModel

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
