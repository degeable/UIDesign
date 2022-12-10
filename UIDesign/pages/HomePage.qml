import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.settings 1.0
import Qt5Compat.GraphicalEffects
import "../components"
import "../icons"
import "../styles.js" as Style

BasePage {
    id: root

    property bool newNotification: notificationModel.count > 0 // get length of model
    property ListModel notificationModel: undefined
    property bool openNotifications: false

    signal examResultNotificationClicked
    signal medicationNotificationClicked

    background: "../images/backgroundPurple.jpg"

    headerVisible: false

    onOpenNotificationsChanged: {
        if (visible) {
            if (openNotifications) {
                notificationDialog.open()
                openNotifications = false
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            homeButton.checked = true
            if (openNotifications) {
                notificationDialog.open()
                openNotifications = false
            }
        }
    }

    Timer {
        id: notTimer
        interval: 50
        running: false
        onTriggered: {
            notificationDialog.open()
        }
    }

    Dialog {
        id: notificationDialog

        modal: true

        anchors.centerIn: parent
        width: parent.width - Style.baseMargin * 10
        height: parent.height - Style.baseMargin * 30
        standardButtons: Dialog.Ok

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
            text: "Notifications"
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

        footer: DialogButtonBox {
            palette.buttonText: "black"
            alignment: Qt.AlignHCenter
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
            ListView {
                anchors.fill: parent
                anchors.topMargin: dialogHeader.height
                spacing: 15

                model: notificationModel
                delegate: Rectangle {
                    color: model.type === "examination" ? Style.darkBlue : Style.blueBase
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 50
                    anchors.rightMargin: 50

                    height: 50
                    radius: 10
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            model.type === "examination" ? examResultNotificationClicked() : medicationNotificationClicked()
                            notificationDialog.close()
                            notificationModel.remove(index)
                        }
                    }

                    Row {
                        id: row
                        anchors.centerIn: parent
                        spacing: 20
                        Image {
                            source: model.type === "examination" ? "../icons/examination.svg" : "../icons/pills.svg"
                            width: Style.buttonIconSize
                            height: Style.buttonIconSize
                        }
                        Column {
                            width: row.width / 2
                            Text {
                                text: ""
                            }
                            Text {
                                text: model.text
                            }
                        }
                        Image {
                            source: "../icons/next.svg"
                            width: Style.buttonIconSize
                            height: Style.buttonIconSize
                        }
                    }
                }
            }
        }
    }

    IconImage {
        id: icon

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: -40
        anchors.topMargin: -icon.height / 2 + 40

        scale: 0.5
        source: "../icons/darkLogo.svg"
    }

    IconButton {
        id: notificationButton

        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: Style.baseMargin
        anchors.topMargin: -notificationButton.height / 1.8 + 40
        anchors.rightMargin: 30

        width: Style.buttonIconSize * 2.3
        baseColor: Style.lightPurple
        source: root.newNotification ? "../icons/bellAlert.svg" : "../icons/bell.svg"

        onClicked: notificationDialog.open()
    }

    Row {
        id: greeting

        spacing: 30
        height: 20
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 50
        anchors.bottomMargin: news.height + 125

        Image {
            source: "../icons/doc.svg"
            width: Style.buttonIconSize * 3
            height: Style.buttonIconSize * 3
        }

        Text {
            anchors.topMargin: 30
            text: "Welcome\nback!"
            color: Style.darkGray
            font.bold: true
            font.pointSize: 30
        }
    }

    Card {
        id: news

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20

        height: root.height / 2
        headerHeight: Style.roundButtonHeight

        headerColor: Style.darkBlue
        headerTextColor: Style.lightGray
        headerIconColor: "white"
        headerIcon: "../icons/news.svg"

        headerText: "News"
        headerFont.bold: true
        headerFont.pointSize: 20

        ListModel {
            id: newsModel

            ListElement {
                iconLeft: "../icons/news.svg"
                iconRight: "../icons/next.svg"
                headerText: "News1"
                text: "Some news in detail"
            }
            ListElement {
                iconLeft: "../icons/news.svg"
                iconRight: "../icons/next.svg"
                headerText: "News2"
                text: "Some news in detail"
            }
            ListElement {
                iconLeft: "../icons/news.svg"
                iconRight: "../icons/next.svg"
                headerText: "News4"
                text: "Some news in detail"
            }
            ListElement {
                iconLeft: "../icons/news.svg"
                iconRight: "../icons/next.svg"
                headerText: "News4"
                text: "Some news in detail"
            }
            ListElement {
                iconLeft: "../icons/news.svg"
                iconRight: "../icons/next.svg"
                headerText: "News5"
                text: "Some neasfasws in detail"
            }
        }

        ListView {
            id: newsList

            spacing: Style.buttonSpacing

            anchors.fill: parent
            anchors.leftMargin: Style.baseMargin * 3
            anchors.rightMargin: Style.baseMargin * 3
            anchors.topMargin: 30
            anchors.bottomMargin: 50

            interactive: true

            model: newsModel
            delegate: Rectangle {
                color: Style.lightPurple
                anchors.left: parent.left
                anchors.right: parent.right

                height: 50
                radius: 30
                Row {
                    id: newsItemRow
                    anchors.centerIn: parent
                    spacing: 30
                    Image {
                        source: model.iconLeft
                        width: Style.buttonIconSize
                        height: Style.buttonIconSize
                    }
                    Column {
                        width: newsItemRow.width / 2
                        Text {
                            text: model.headerText
                        }
                        Text {
                            text: model.text
                        }
                    }
                    Image {
                        source: model.iconRight
                        width: Style.buttonIconSize
                        height: Style.buttonIconSize
                    }
                }
            }
        }
    }
}
