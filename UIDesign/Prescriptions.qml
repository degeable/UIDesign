import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0
import Qt5Compat.GraphicalEffects
import "styles.js" as Style

Rectangle {
    id: root

    signal buttonClicked(button: string)

    anchors.fill: parent
    color: "transparent"

    Card {
        id: painkiller
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 30

        headerText: "Painkiller XYZ"
        cardText: "500mg"
        bottomText: "EXPIRES SOON"

        mouseArea.onClicked: buttonClicked("Painkiller")
    }

    DropShadow {
        anchors.fill: painkiller
        horizontalOffset: 3
        verticalOffset: 3
        transparentBorder: true
        radius: 8.0

        color: Style.darkGray
        source: painkiller
    }

    Card {
        id: ibuprofen

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: painkiller.bottom

        anchors.margins: 30

        headerText: "Ibuprofen"
        cardText: "200mg"

        mouseArea.onClicked: buttonClicked("Ibuprofen")
    }

    DropShadow {
        anchors.fill: ibuprofen
        horizontalOffset: 3
        verticalOffset: 3
        transparentBorder: true
        radius: 8.0

        color: Style.darkGray
        source: ibuprofen
    }
}

