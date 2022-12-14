import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.settings 1.0
import Qt5Compat.GraphicalEffects
import "../components"
import "../icons"
import "../dialogs"
import "../styles.js" as Style

BasePage {
    id: root

    background: "../images/backgroundGreenHeavy.jpg"

    onVisibleChanged: {
        if (visible)
            appointmentButton.checked = true
    }

    homeButton.pressedColor: Style.purpleBase

    headerButton.source: "../icons/next.svg"
    headerButton.rotation: 180
    headerButton.visible: !welcomeScreen.visible && !doneScreen.visible
    headerText: welcomeScreen.visible
                || doneScreen.visible ? "Appointment" : ""
    headerColor: Style.headerColor// welcomeScreen.visible
                 //|| doneScreen.visible ? Style.headerColor : "transparent"
    onBack: welcomeScreen.visible = true

    centerImageSorce: "../icons/calendarRound.png"
    centerImageVisible: appointmentDialog.visible
    overlayVisible: true

    Rectangle {
        id: welcomeScreen

        anchors.fill: parent

        Image {
            id: icon2
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 30

            fillMode: Image.PreserveAspectFit

            width: 150
            height: 150
            source: "../icons/calendarRound.png"
        }
        ColorOverlay {
            id: overlay

            anchors.fill: icon2
            source: icon2
            color: Style.purpleBase
            antialiasing: true
            visible: true
        }

        Text {
            anchors.centerIn: parent
            elide: Text.ElideMiddle
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
            text: "Hello! \nPlease follow the next steps \nto book an appointment."
            font.pointSize: 20
        }

        UiButton {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 75

            width: Style.buttonWidth
            height: Style.roundButtonHeight
            baseColor: Style.purpleBase

            text: "Continue"

            onClicked: welcomeScreen.visible = false
        }
    }

    Rectangle {
        id: doneScreen

        anchors.fill: parent
        visible: false

        Image {
            id: icon
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 40

            fillMode: Image.PreserveAspectFit

            width: 150
            height: 150
            source: "../icons/calendarRound.png"
        }
        ColorOverlay {
            anchors.fill: icon
            source: icon
            color: Style.purpleBase
            antialiasing: true
            visible: true
        }

        Text {
            anchors.centerIn: parent
            elide: Text.ElideMiddle
            horizontalAlignment: Text.AlignHCenter

            wrapMode: Text.Wrap
            text: "Thank you!\n Your appointment is confirmed"
            font.pointSize: 20
        }

        UiButton {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 75

            width: Style.buttonWidth
            height: Style.roundButtonHeight

            baseColor: Style.purpleBase

            text: "Exit"

            onClicked: {
                doneScreen.visible = false
                welcomeScreen.visible = true
                appointmentDialog.reset()
                homePage()
            }
        }
    }

    Dialog {
        id: exitDialog

        modal: true

        anchors.centerIn: parent
        width: parent.width - Style.baseMargin * 10
        height: parent.height - Style.baseMargin * 50
        //standardButtons: Dialog.Fin | Dialog.Cancle

        onAccepted: {
            visible = false
            doneScreen.visible = true
        }
        onRejected: exitDialog.close

        Overlay.modal: FastBlur {
            source: ShaderEffectSource {
                sourceItem: root
                live: false
            }
            radius: 20
        }

        header: Label {
            id: dialogHeader

            z: 2
            text: "Confirm"
            elide: Label.ElideMiddle
            horizontalAlignment: Label.AlignHCenter
            font.bold: true
            font.pointSize: 20
            color: Style.darkTextColor
            padding: 12
            background: Rectangle {
                anchors.fill: parent
                anchors.margins: 3
                color: "white"
                radius: 30
            }
        }


        DialogButtonBox {
            id: buttons
            anchors.left: parent.left
           anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 75
            anchors.bottomMargin: 15
            alignment: Qt.AlignCenter
            height: Style.roundButtonHeight
            UiButton {
                text: "Confirm"

                palette.buttonText: Style.darkTextColor
                width: Style.buttonWidth / 2
                height: Style.roundButtonHeight

                onClicked: exitDialog.accept()
            }
            UiButton {
                text: "Back"

                palette.buttonText: Style.darkTextColor
                width: Style.buttonWidth / 2
                height: Style.roundButtonHeight

                onClicked: exitDialog.reject()
            }

            background: Rectangle {
                anchors.fill: parent
                anchors.margins: 4
                radius: 30
                color: "white"
            }
        }

        background: Rectangle {
            color: "transparent"
            border.color: "black"

            radius: 30
        }
        contentItem: Rectangle {
            anchors.fill: parent
            anchors.margins: 2
            color: "white"
            radius: 30
            Text {
                id: confirmText

                wrapMode: Text.Wrap
                width: parent.width - 10
                anchors.centerIn: parent
                anchors.margins: 10
                font.bold: true
                font.pointSize: Style.fontSizeNormal
                text: "Are you finished? You can review your input and change it again."
            }
        }
    }

    AppointmentDialog {
        id: appointmentDialog


        onAddAppointment: console.log("appointment Triggered")
        anchors.fill: parent
        visible: !welcomeScreen.visible && !doneScreen.visible

        onDone: {
            exitDialog.open()
            centerImageVisible = false
        }
    }
}


