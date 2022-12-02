import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import "../styles.js" as Style
import "../components"

Rectangle {
    id: root

    signal done(button: string)

    property alias background: background.source
    property alias backgroundOpacity: background.opacity
    property alias headerVisible: header.visible
    property alias footerVisible: footer.visible
    default property alias contents: content.data

    color: "transparent"

    states: [
        State { when: root.visible;
                PropertyChanges {   target: root; opacity: 1.0 }},
        State { when: !root.visible;
                PropertyChanges {   target: root; opacity: 0.0 }}
    ]

    transitions: [ Transition { NumberAnimation { property: "opacity"; duration: Style.pageTransitionDuration}} ]

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

        Rectangle {
            anchors.left: header.left
            anchors.right: header.right
            anchors.top: header.bottom
            height: 1
            color: Style.lighterGray
        }
    }

    Item {
        id: content

        anchors.top: header.bottom
        anchors.bottom: footer.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    Rectangle {
        id: footer

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
                   checkable: true
                   width: parent.width / 5
                   height: parent.height
                   showBorder: false
                   source: "../icons/examination.svg"
                   underText: "Exam"
                   ButtonGroup.group: menuGrp
               }
               IconButton {
                   checkable: true
                   width: parent.width / 5
                   height: parent.height
                   showBorder: false
                   source: "../icons/medicine.svg"
                   underText: "Prescr."
                   ButtonGroup.group: menuGrp
               }
               IconButton {
                   checkable: true
                   width: parent.width / 5
                   height: parent.height
                   showBorder: false
                   source: "../icons/home.svg"
                   ButtonGroup.group: menuGrp
               }
               IconButton {
                   checkable: true
                   width: parent.width / 5
                   height: parent.height
                   showBorder: false
                   source: "../icons/appointment.png"
                   underText: "Appoint."
                   ButtonGroup.group: menuGrp
               }
               IconButton {
                   checkable: true
                   width: parent.width / 5
                   height: parent.height
                   showBorder: false
                   source: "../icons/account.svg"
                   underText: "Account"
                   ButtonGroup.group: menuGrp
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
