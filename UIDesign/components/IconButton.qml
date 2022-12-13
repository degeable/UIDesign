import QtQuick 6.2
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import "../styles.js" as Style

Button {
    id: button

    property color baseColor: "transparent"
    property color pressedColor: Style.purpleBase
    property alias source: image.source
    property alias image: image
    property alias underText: text.text
    property alias underTextFont: text.font
    property alias backgroundColor: backRec.color
    property bool showBorder: true

    palette.buttonText: Style.darkTextColor

    font.family: Style.buttonFont
    font.pointSize: Style.fontSizeNormal

    width: Style.buttonIconSize
    height: Style.buttonIconSize


    background: Rectangle {
        id: backRec

        color: button.baseColor
        radius: 10

        border.width: button.showBorder
        border.color: overlay.color

        Image {
            id: image

            anchors.centerIn: parent

            visible: false
        }

        ColorOverlay {
            id: overlay

            anchors.fill: image
            source:image
            color: button.pressed || button.checked ? button.pressedColor : Style.darkGray
            antialiasing: true
            visible: image.source
        }

        Text {
            id: text

            anchors.top: overlay.bottom
            anchors.topMargin: -3
            anchors.horizontalCenter: overlay.horizontalCenter

            color: overlay.color
            font.pointSize: Style.fontSizeSmall
        }
    }
}
