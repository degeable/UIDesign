import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.settings 1.0
import Qt5Compat.GraphicalEffects
import "../styles.js" as Style
import "../components"
import "../images"

BasePage {
    id: root

    background: "../images/backgroundGreen.jpg"

    onVisibleChanged: {
        if (visible)
            accountButton.checked = true
    }

    function open(name) {
        if(name === "Personal Information") {
            personalInfo.visible = true
        } else if (name === "Insurance Information") {
            insuranceInfo.visible = true
        } else if (name === "Examination Results") {
            examinationResults.visible = true
        }
    }

    headerButton.source: "../icons/next.svg"
    headerButton.rotation: 180
    headerButton.visible: !listView.visible
    headerVisible: true//!listView.visible
    headerText: "Account"
    headerColor: "transparent"

    Card {
        id: examinationResults

        anchors.fill: parent
        anchors.margins: 60
        anchors.topMargin: 100
        anchors.bottomMargin: 60

        headerColor: Style.blueBase
        headerHeight: Style.roundButtonHeight
        headerText: "Examination Results"
        headerTextColor: Style.lightTextColor
        headerIconColor: Style.lightTextColor
        headerFont.bold: true
        headerFont.pointSize: 20

        visible: false

        mouseArea.enabled: false

        ListView {
            anchors.centerIn: parent

            model: examinationModel
            delegate: Rectangle {
                color: Style.lightTextColor
                Text {
                    id: keyText
                    anchors.centerIn: parent
                    text: model.key
                }
                Text {
                    anchors.right: parent.right
                    anchors.left: keyText.right
                    text: model.value
                }
            }
        }

        UiButton {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            text: "Okay"

            onClicked:{
                examinationResults.visible = false
            }
        }
    }

    Card {
        id: personalInfo

        anchors.fill: parent
        anchors.margins: 60
        anchors.topMargin: 100
        anchors.bottomMargin: 60

        headerColor: Style.blueBase
        headerHeight: Style.roundButtonHeight
        headerText: "Personal Information"
        headerTextColor: Style.lightTextColor
        headerIconColor: Style.lightTextColor
        headerFont.bold: true
        headerFont.pointSize: 20

        visible: false

        mouseArea.enabled: false

        FormularLayout {
            id: form

            model: personalModel
        }

        UiButton {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            text: "Okay"

            onClicked: {
                personalInfo.visible = false
            }
        }


    }

    Card {
        id: insuranceInfo

        anchors.fill: parent
        anchors.margins: 60
        anchors.topMargin: 150
        anchors.bottomMargin: 150

        visible: false

        headerColor: Style.blueBase
        headerHeight: Style.roundButtonHeight
        headerText: "Insurance Information"
        headerTextColor: Style.lightTextColor
        headerIconColor: Style.lightTextColor
        headerFont.bold: true
        headerFont.pointSize: 20

        mouseArea.enabled: false

        FormularLayout {
            id: insuranceLayout

            model: insuranceModel
        }

        UiButton {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            text: "Okay"

            onClicked: {
                insuranceInfo.visible = false
            }
        }
    }


    Image {
        id: image
        anchors.topMargin: 70
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        visible: !personalInfo.visible && !insuranceInfo.visible && !examinationResults.visible

        fillMode: Image.PreserveAspectFit

        width: 50
        height: 50

        source: "../images/anon.svg"
    }

    Text {
        id: nameText
        visible: !personalInfo.visible && !insuranceInfo.visible && !examinationResults.visible

        anchors.top: image.bottom
        anchors.horizontalCenter: image.horizontalCenter
        font.pointSize: 18
        font.bold: true
        text: personalModel.data() === "" ? "Unknown User" : personalModel.data()

        Connections {
            target: personalModel
            onDataChanged: {
                console.log("changed", personalModel.data())
                nameText.text = personalModel.data()
            }
        }
    }

    ColorOverlay {
        id: overlay

        anchors.fill: image
        source:image
        color: Style.blueBase
        antialiasing: true
        visible: image.visible
    }

    ListModel {
        id: buttonModel

        ListElement {
            name: "Examination Results"
        }

        ListElement {
            name: "Personal Information"
        }

        ListElement {
            name: "Insurance Information"
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

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 60
        anchors.leftMargin: 70
        anchors.rightMargin: 70

        interactive: false
        spacing: Style.buttonSpacing

        width: parent.width
        height: parent.height / 2

        visible: !personalInfo.visible && !insuranceInfo.visible && !examinationResults.visible

        delegate: UiRoundButton {
            id: comp
            width: parent.width
            height: Style.roundButtonHeigh

            baseColor: Style.blueBase
            onClicked: open(model.name)
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

        model: buttonModel
    }

    UiButton {
        id: logout

        anchors.top: listView.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: parent.width / 3
        anchors.rightMargin: parent.width / 3

        visible: !personalInfo.visible && !insuranceInfo.visible && !examinationResults.visible
        text: "Logout"
        baseColor: Style.red
        onClicked: exitDialog.open()
    }

    Component.onCompleted: {
        buttonsAnimation.start()
      //  Backend.addReport("Sun Dec 11 16:27, Your head was hit too hard bro")
     //   checkButton(4)
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
            loginPage()
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

            horizontalAlignment: Label.AlignHCenter
            z: 2
            text: "Logout?"
            elide: Label.ElideMiddle
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
                palette.buttonText: Style.darkTextColor

                onClicked: exitDialog.accept()
            }
            UiButton {
                text: "Back"

                width: Style.buttonWidth / 2
                height: Style.roundButtonHeight
                palette.buttonText: Style.darkTextColor

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
                text: "Are you sure that you want to log out?"
            }
        }
    }
}
