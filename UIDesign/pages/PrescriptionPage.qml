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

    background: "../images/backgroundBlue.jpg"

    onVisibleChanged: {
        if (visible)
            prescriptionButton.checked = true
    }


    property bool renewed: false

    headerButton.source: "../icons/next.svg"
    headerButton.rotation: 180
    headerButton.visible: dialog.visible && !doneScreen.visible
    headerText: dialog.visible || doneScreen.visible ? "" : "Prescriptions"
    headerColor: Style.headerColor//dialog.visible ? "transparent": Style.headerColor
    centerImageSorce: "../images/meds.png"
    centerImageVisible: false

    onBack:{
        dialog.visible = false
        centerImageVisible = false
    }

    Rectangle {
        id: doneScreen

        anchors.fill: parent
        visible: false

        Image {
            id: exitImg
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 30

            antialiasing: true

            fillMode: Image.PreserveAspectFit

            width: 150
            height: 150
            source: "../images/meds.png"
        }

        ColorOverlay {
            id: overlay

            anchors.fill: exitImg
            source:exitImg
            color: Style.purpleBase
            antialiasing: true
            visible: exitImg.visible
        }

        Text {
            anchors.centerIn: parent
            elide: Text.ElideMiddle
            horizontalAlignment: Text.AlignHCenter
            text: "Thank you!\nYour medication has been renewed!"
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
                renewed = true
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
            dialog.reset()
            dialog.visible = false
            doneScreen.visible = true
            centerImageVisible = false
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
                horizontalAlignment: Text.AlignHCenter
                text: "Are you finished? \nYou can review your input and change it again."
            }
        }
    }

    MedicationDialog {
        id: dialog
        anchors.fill: parent
        visible: false
        onDone: {
            exitDialog.open()
            centerImageVisible = false
        }
        z: 3
    }


    Card {
        id: painkiller

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 20

        visible: !dialog.visible && !exitDialog.visible && !doneScreen.visible

        height: root.height / 3
        headerColor: Style.lightPurple
        headerHeight: Style.roundButtonHeight

        headerTextColor: Style.darkTextColor
        headerIconColor: "black"
        headerIcon: "../icons/pills.svg"

        headerText: "Painkiller XYZ"
        headerFont.bold: true
        headerFont.pointSize: 20

        Image {
            id: painkillerImg
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: Style.baseMargin * 2
            anchors.verticalCenter: parent.verticalCenter

            width: parent.width / 3 - 30
            height: parent.height - 10
            source: "../icons/greenCard.png"

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: painkillerImg.width
                    height: painkillerImg.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: painkillerImg.width

                        height: painkillerImg.height
                        radius: 30
                    }
                }
            }
        }
        Text {
            id: painkillerText

            anchors.left: painkillerImg.right
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 30

            font.pointSize: Style.fontSizeNormal
            font.bold: true
            color: Style.lightTextColor
            text: "Codeine Phosphate\n30mg Tablets BP for Oral Administration."
            wrapMode: Text.Wrap
        }
    }

    Card {
        id: ibuprofen

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: painkiller.bottom
        anchors.margins: 20

        visible: !dialog.visible && !exitDialog.visible && !doneScreen.visible
        height: root.height / 3
        headerColor: Style.lightPurple
        headerHeight: Style.roundButtonHeight

        headerTextColor: Style.darkTextColor
        headerIconColor: "black"
        headerIcon: "../icons/medicine.svg"

        headerText: "Ibuprofen"
        headerFont.bold: true
        headerFont.pointSize: 20

        mouseArea.enabled: false
        Image {
            id: ibuImage

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: Style.baseMargin * 2
            anchors.verticalCenter: parent.verticalCenter

            width: parent.width / 3 - 30
            height: parent.height - 10
            source: "../icons/pinkCard.png"

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: ibuImage.width
                    height: ibuImage.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: ibuImage.width

                        height: ibuImage.height
                        radius: 30
                    }
                }
            }
        }

        Text {
            id: ibuText

            anchors.left: ibuImage.right
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 30

            font.pointSize: Style.fontSizeNormal
            font.bold: true
            color: Style.lightTextColor
            text: "Advil Ibuprofen Tablets.\n200mg Pain Reliever Fever Reduceer (NSAID)."
            wrapMode: Text.Wrap
        }

        Text {
            id: expiredText

            anchors.top: ibuText.bottom
            anchors.left: ibuImage.right
            anchors.right: parent.right
            anchors.leftMargin: 30

            visible: !renewed

            font.bold: true
            font.pointSize: 18

            color: "red"
            text: "Expires In 3 Days!"
        }

        UiButton {
            anchors.top: expiredText.bottom
            anchors.left: ibuImage.right
            anchors.right: parent.right
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 10

            visible: !renewed

            baseColor: Style.darkBlue
            text: "Renew here"
            onClicked: {
                dialog.visible = true
                centerImageVisible = true
            }
        }
    }
}
