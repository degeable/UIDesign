import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import "styles.js" as Style

Rectangle {
    id: root

    signal buttonClicked(button: string)

    color: "transparent"

    ListModel {
        id: model

        ListElement {
            name: "Book Appointment"
        }

        ListElement {
            name: "Get Prescription"
        }

        ListElement {
            name: "Get Sick Note"
        }
    }

    Component.onCompleted: {
        buttonsAnimation.start();
    }

    NumberAnimation {
        id: buttonsAnimation

        target: listView
        property: "opacity"
        from: 0
        to: 1
        easing.type: Easing.InOutQuad
        duration: Style.startAnimationTime
    }

    Card {
        id: description

        headerText: "Examination Results"
        cardText: "Placeholder for examination results"
        headerColor: Style.backgroundDark
        color: Style.backgroundLight
        headerTextColor: Style.darkTextColor
        cardTextColor: Style.darkTextColor
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 30

    }

    DropShadow {
        anchors.fill: description
        horizontalOffset: 3
        verticalOffset: 3
        transparentBorder: true
        radius: 8.0
        color: Style.darkGray
        source: description
    }


    ListView {
        id: listView

        anchors.left: parent.left
        anchors.right: parent.right
       // anchors.bottom: parent.bottom
        anchors.top: description.bottom
       // anchors.bottomMargin: 60
        anchors.leftMargin: 100
        anchors.rightMargin: 100
        anchors.topMargin: 50

        interactive: false
        spacing: Style.buttonSpacing

        width: parent.width
        height: parent.height / 3

        delegate: UiRoundButton {
            id: comp
            width: parent.width
            height: Style.roundButtonHeight

            onClicked: buttonClicked(model.name)
            text: model.name
            highlighted: false
            flat: false
        }

        populate: Transition {
            NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: Style.changeAnimationTime }
            NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: Style.changeAnimationTime }
        }

        model: model
    }
}
