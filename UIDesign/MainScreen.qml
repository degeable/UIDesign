import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0
import "styles.js" as Style

Rectangle {
    id: root

    signal buttonClicked(button: string)
    property bool loggedIn: false
    onLoggedInChanged: console.log(loggedIn, " Changed")

    onButtonClicked: button => {
        if (button === "Login") {
            root.loggedIn = true
        }
    }

    Settings {
        id: mainSettings

        property alias login: root.loggedIn
    }


    color: "transparent"

    ListModel {
        id: loggedOutModel

        ListElement {
            name: "Login"
        }

        ListElement {
            name: "Create Account"
        }
    }

    ListModel {
        id: loggedInModel

        ListElement {
            name: "Account"
        }

        ListElement {
            name: "Start Examination"
        }
    }

    Component.onCompleted: {
        buttonsAnimation.start();
        logoAnimation.start();
    }

    Image {
        id: logo
        source: "logo.png"

        fillMode: Image.PreserveAspectCrop

        anchors.top: parent.top
        anchors.topMargin: Style.logoTopMargin
        anchors.horizontalCenter: parent.horizontalCenter
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

    NumberAnimation {
        id: logoAnimation

        target: logo
        property: "anchors.topMargin"
        duration: Style.startAnimationTime
        easing.type: Easing.InOutQuad
        from: root.height / 2
        to: Style.logoTopMargin
    }

    ListView {
        id: listView

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 60
        anchors.leftMargin: 100
        anchors.rightMargin: 100

        interactive: false
        spacing: Style.buttonSpacing

        width: parent.width
        height: parent.height / 3

        delegate: UiRoundButton {
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

        model: root.loggedIn ? loggedInModel : loggedOutModel
    }
}
