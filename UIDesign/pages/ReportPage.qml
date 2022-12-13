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

    onBack: accountPage()

    headerButton.source: "../icons/next.svg"
    headerButton.rotation: 180
    headerButton.visible: true
    headerVisible: true
    headerColor: "transparent"

    Card {
        id: examinationResults

        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.bottomMargin: 10

        headerColor: Style.blueBase
        headerHeight: Style.roundButtonHeight
        headerTextColor: Style.lightTextColor
        headerIconColor: Style.lightTextColor
        headerText: "Examination Results"
        headerFont.bold: true
        headerFont.pointSize: 20

        visible: true

        mouseArea.enabled: false

        ListView {
            anchors.fill: parent
            anchors.margins: 10
            model: examinationModel

            interactive: false

            spacing: 15

            delegate: Card {
                    id: examDelegate

                    width: parent.width

                    visible: true

                    height: root.height / 3
                    headerColor: Style.darkBlue
                    headerHeight: Style.roundButtonHeight

                    headerTextColor: Style.darkTextColor
                    headerIconColor: "black"
                    headerIcon: "../icons/report.svg"

                    backgroundColor: Style.backgroundLight

                    border.color: "black"

                    headerText: model.key
                    headerFont.bold: true
                    headerFont.pointSize: 20

                    mouseArea.enabled: false

                    Text {
                        id: painkillerText

                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.margins: 30

                        font.pointSize: Style.fontSizeNormal
                        font.bold: true
                        color: Style.darkTextColor
                        text: model.value
                        wrapMode: Text.Wrap
                    }

                    UiButton {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottomMargin: 15
                        anchors.leftMargin: 25
                        anchors.rightMargin: 25


                        visible: true

                        baseColor: Style.darkBlue
                        text: "Book Appointment"
                        onClicked: appointmentPage()
                    }
                }





                /*Rectangle {
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
            }*/
        }
    }


}
