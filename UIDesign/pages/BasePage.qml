import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import "../styles.js" as Style
import "../components"

Rectangle {
    id: root

    signal done(string button)

    signal homePage
    signal accountPage
    signal loginPage
    signal examinationPage
    signal appointmentPage
    signal prescriptionPage
    signal bookedAppointmentsPage
    signal reportPage
    signal back

    property int buttonId
    property alias background: background.source
    property alias backgroundOpacity: background.opacity
    property alias headerVisible: header.visible
    property alias headerColor: header.color
    property alias footerVisible: footer.visible
    property alias headerButton: headerButton
    property alias headerText: headerText.text
    property alias centerImageSorce: centerImage.source
    property alias centerImageVisible: centerImage.visible
    property alias centerImageColor: overlay.color
    property bool overlayVisible: true

    default property alias contents: content.data

    property alias buttonColor: footer.buttonColor
    property alias homeButton: homeButton
    property alias examinationButton: examinationButton
    property alias accountButton: accountButton
    property alias prescriptionButton: prescriptionButton
    property alias appointmentButton: appointmentButton
    color: "transparent"

    Behavior on width {
        NumberAnimation {
            duration: Style.loaderAnimationTime
        }
    }

    states: [
        State {
            when: root.visible
            PropertyChanges {
                target: content
                opacity: 1.0
            }
        },
        State {
            when: !root.visible
            PropertyChanges {
                target: content
                opacity: 0.0
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation {
                property: "opacity"
                duration: Style.pageTransitionDuration
            }
        }
    ]

    Image {
        id: background

        anchors.fill: parent

        z: -2
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        id: header

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        height: Style.headerHeight
        color: Style.headerColor
        z: 2

        IconButton {
            id: headerButton

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: Style.baseMargin
            anchors.topMargin: Style.baseMargin * 2

            showBorder: false

            image.width: Style.roundButtonHeight - Style.baseMargin
            image.height: Style.roundButtonHeight - Style.baseMargin

            onClicked: back()
        }

        Text {
            id: headerText

            anchors.centerIn: parent
            anchors.margins: Style.baseMargin


            font.bold: false
            font.pointSize: 35

            color: Style.darkTextColor
            opacity: 0.9
        }

        Image {
            id: centerImage

            visible: false
            width: header.height - 5
            height: header.height - 5

            anchors.topMargin: 5

            fillMode: Image.PreserveAspectFit

            anchors.centerIn: parent
            anchors.margins: Style.baseMargin
        }

        ColorOverlay {
            id: overlay

            anchors.fill: centerImage
            source:centerImage
            color: Style.blueBase
            antialiasing: true
            visible: root.overlayVisible && centerImage.visible
        }
    }

    Item {
        id: content

        anchors.top: header.visible ? header.bottom : root.top
        anchors.bottom: footer.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    Rectangle {
        id: footer

        property color buttonColor: Style.purpleBase

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        height: Style.footerHeight
        color: Style.footerColor

        ButtonGroup {
            id: menuGrp
        }
        Row {
            anchors.fill: parent
            IconButton {
                id: examinationButton

                pressedColor: Style.blueBase
                checkable: true
                width: parent.width / 5
                height: parent.height
                showBorder: false
                source: "../icons/examination.svg"
                underText: "Exam"
                ButtonGroup.group: menuGrp

                onClicked: examinationPage()
            }
            IconButton {
                id: prescriptionButton

                pressedColor: footer.buttonColor
                checkable: true
                width: parent.width / 5
                height: parent.height
                showBorder: false
                source: "../icons/medicine.svg"
                underText: "Prescr."
                ButtonGroup.group: menuGrp

                onClicked: prescriptionPage()
            }
            IconButton {
                id: homeButton

                pressedColor: Style.darkBlue
                checked: true
                checkable: true
                width: parent.width / 5
                height: parent.height
                showBorder: false
                source: "../icons/home.svg"
                ButtonGroup.group: menuGrp

                onClicked: homePage()
            }
            IconButton {
                id: appointmentButton

                pressedColor: footer.buttonColor
                checked: false
                checkable: true
                width: parent.width / 5
                height: parent.height
                showBorder: false
                source: "../icons/appointment.png"
                underText: "Appoint."
                ButtonGroup.group: menuGrp

                onClicked: appointmentPage()
            }
            IconButton {
                id: accountButton

                pressedColor: Style.blueBase
                checkable: true
                width: parent.width / 5
                height: parent.height
                showBorder: false
                source: "../icons/account.svg"
                underText: "Account"
                ButtonGroup.group: menuGrp

                onClicked: accountPage()
            }
        }

        Rectangle {
            anchors.left: footer.left
            anchors.right: footer.right
            anchors.bottom: footer.top
            height: 1
            color: Style.lighterGray
        }
    }
}
