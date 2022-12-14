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

        headerColor: Style.backgroundDark
        headerHeight: Style.roundButtonHeight
        headerTextColor: Style.lightTextColor
        headerIconColor: Style.lightTextColor
        headerText: "Appointments"
        headerFont.bold: true
        headerFont.pointSize: 20

        visible: true

        mouseArea.enabled: false

        ListView {
            anchors.fill: parent
            anchors.margins: 10
            model: appointmentModel

            interactive: false

            spacing: 15

            delegate: Card {
                id: examDelegate

                width: parent.width

                visible: true

                height: root.height / 4
                headerColor: Style.blueBase
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
            }
        }
    }
}
