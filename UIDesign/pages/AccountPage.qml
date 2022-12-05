import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0
import "../styles.js" as Style
import "../components"

BasePage {
    id: root

    background: "../images/backgroundGreen.jpg"

    onVisibleChanged: {
        if (visible)
            accountButton.checked = true
    }

    ListModel {
        id: model

        ListElement {
            name: "Examination Results"
        }

        ListElement {
            name: "Personal Information"
        }

        ListElement {
            name: "Prescriptions"
        }
        ListElement {
            name: "Prescriptions"
        }
        ListElement {
            name: "Prescriptions"
        }
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

    ListView {
        id: listView

        anchors.fill: parent
        anchors.bottomMargin: 60
        anchors.leftMargin: 100
        anchors.rightMargin: 100

        interactive: false
        spacing: Style.buttonSpacing

        width: parent.width
        height: parent.height / 2

        delegate: UiRoundButton {
            id: comp
            width: parent.width
            height: Style.roundButtonHeight * 2

            onClicked: done(model.name)
            text: model.name
            highlighted: false
            flat: false
        }

        populate: Transition {
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

        model: model
    }

    Component.onCompleted: {
        buttonsAnimation.start()
     //   checkButton(4)
    }
}
