import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.settings 1.0
import "../components"
import "../icons"
import "../styles.js" as Style

BasePage {
    id: root

    property bool newNotification: true

    background: "../images/backgroundPurple.jpg"

    headerVisible: false

    IconImage {
        id: icon

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: -icon.width / 3
        anchors.topMargin: -icon.height / 1.8

        scale: 0.5
        source: "../icons/heart.svg"
    }

    IconButton {
        id: notificationButton

        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: Style.baseMargin
        anchors.topMargin: -notificationButton.height / 1.8
        anchors.rightMargin: 30

        width: Style.buttonIconSize * 2.3
        baseColor: Style.lightPurple
        source: root.newNotification ? "../icons/bellAlert.svg" : "../icons/bell.svg"
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
        headerIcon: "../icons/news.svg"
        color: "white"

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
                radius: 10
                Row {
                    id: row
                    anchors.centerIn: parent
                    spacing: 30
                    Image {
                        source: model.iconLeft
                        width: Style.buttonIconSize
                        height: Style.buttonIconSize
                    }
                    Column {
                        width: row.width / 2
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
