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

    background: "../images/chatBlue.jpg"

    onVisibleChanged: {
        if (visible)
            examinationButton.checked = true
    }

    headerButton.source: "../icons/next.svg"
    headerButton.rotation: 180
    headerButton.visible: !welcomeScreen.visible && !doneScreen.visible
    headerText: welcomeScreen.visible
                || doneScreen.visible ? "Virtual Examination" : ""
    headerColor: welcomeScreen.visible
                 || doneScreen.visible ? Style.headerColor : "transparent"
    onBack: welcomeScreen.visible = true

    Rectangle {
        id: welcomeScreen

        anchors.fill: parent

        Image {
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 65

            fillMode: Image.PreserveAspectFit

            width: 150
            height: 150
            source: "../icons/doctor.png"
        }

        Text {
            anchors.centerIn: parent
            elide: Text.ElideMiddle
            text: "Hey I am doctor Rey!\nReady for your examination?"
            font.pointSize: 20
        }

        UiButton {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 75

            width: Style.buttonWidth
            height: Style.roundButtonHeight

            text: "Continue"

            onClicked: welcomeScreen.visible = false
        }
    }

    Rectangle {
        id: doneScreen

        anchors.fill: parent
        visible: false

        Image {
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 65

            fillMode: Image.PreserveAspectFit

            width: 150
            height: 150
            source: "../icons/doctor.png"
        }

        Text {
            anchors.centerIn: parent
            elide: Text.ElideMiddle
            text: "Thank you!\nYour examination will be reviewed"
            font.pointSize: 20
        }

        UiButton {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 75

            width: Style.buttonWidth
            height: Style.roundButtonHeight

            text: "Exit"

            onClicked: {
                doneScreen.visible = false
                welcomeScreen.visible = true
                examinationDialog.reset()
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
            elide: Label.ElideRight
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
                width: Style.buttonWidth / 2
                height: Style.roundButtonHeight
                onClicked: exitDialog.accept()
            }
            UiButton {
                text: "Back"

                width: Style.buttonWidth / 2
                height: Style.roundButtonHeight
                onClicked: exitDialog.reject()
            }

            palette.buttonText: "black"
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

    ExaminationDialog {
        id: examinationDialog
        anchors.fill: parent
        visible: !welcomeScreen.visible && !doneScreen.visible

        onDone: {
            exitDialog.open()
        }
    }
}
