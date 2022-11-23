import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0
import "styles.js" as Style

Rectangle {
    id: root

    signal buttonClicked(string button)
    // change this because of bug in UI. Change later when I use bottom nav bar
    property bool loggedIn: false
    onLoggedInChanged: console.log(loggedIn, " Changed")
    Component.onCompleted: {
        if (loggedIn) {
            login()
        }
        buttonsAnimation.start()
        logoAnimation.start()
    }
    onButtonClicked: button => {
                         if (button === "Login") {
                             root.loggedIn = true
                             login()
                         }
                     }

    function login() {
        loggedOutModel.clear()
        loggedOutModel.append({
                                  "name": "Account"
                              })
        loggedOutModel.append({
                                  "name": "Start Examination"
                              })
        loggedOutModel.append({
                                  "name": "Book Appointment"
                              })
        loggedOutModel.append({
                                  "name": "Prescriptions"
                              })
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
            id: comp
            width: parent.width
            height: Style.roundButtonHeight

            onClicked: buttonClicked(model.name)
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

        model: /*root.loggedIn ? loggedInModel :*/ loggedOutModel
    }
}
