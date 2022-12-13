import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0
import "../components"
import "../icons"
import "../styles.js" as Style

BasePage {
    id: root

    property bool loggedIn: false

    footerVisible: false
    headerVisible: false

    background: "../images/background.webp"

    ListModel {
        id: model

        ListElement {
            name: "Login"
            color: "Style.blueBase"
        }

        ListElement {
            name: "Create Account"
            color: "Style.purpleBase"
        }
    }

    Image {
        id: logo

        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height / 4

        opacity: 0
        source: "../icons/logo.svg"
        fillMode: Image.PreserveAspectCrop
        scale: 1.5
    }

    ListView {
        id: buttonList

        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height / 2
        width: parent.width
        height: parent.height / 3

        model: model

        enabled: opacity
        interactive: false
        spacing: Style.buttonSpacing
        opacity: 0

        delegate: UiRoundButton {
            id: comp

            anchors.horizontalCenter: parent.horizontalCenter
            baseColor: eval(model.color)
            onClicked: buttonClicked(model.name)
            text: model.name
        }
    }

    NumberAnimation {
        id: buttonAnimation

        target: buttonList
        property: "opacity"
        duration: Style.startAnimationTime
        onFinished: {
            if (root.loggedIn) {
                done("loggedIn")
                homePage()
            }
        }
        from: root.loggedIn ? 1 : 0
        to: root.loggedIn ? 0 : 1
    }

    NumberAnimation {
        id: logoAnimation

        target: logo
        property: "opacity"
        duration: Style.startAnimationTime
        from: root.loggedIn ? 1 : 0
        to: root.loggedIn ? 0 : 1
    }

    Component.onCompleted: {
        buttonList.opacity = 1
        logo.opacity = 1
    }

    onVisibleChanged: {
        if (visible) {
            buttonList.opacity = 1
            logo.opacity = 1
        }
    }

    function buttonClicked(button) {
        if (button === "Login") {
            root.loggedIn = true
            logoAnimation.start()
            buttonAnimation.start()
        }
    }
}
