import QtQuick 6.2
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import "../styles.js" as Style

RoundButton {
    id: button

    property color baseColor: Style.purpleBase

   font.pointSize: Style.fontSizeNormal
   font.bold: true
   palette.buttonText: Style.lightTextColor

   width: Style.roundButtonWidth
   height: Style.roundButtonHeight

   radius: 10

    background: Rectangle {
        radius: button.radius
        gradient: Gradient {
            GradientStop { position: 0 ; color: button.pressed ? Qt.darker(button.baseColor, 1.1) : button.baseColor }
            GradientStop { position: 1 ; color: button.pressed ? button.baseColor :  Qt.darker(button.baseColor, 1.1) }
        }
    }

    DropShadow {
        anchors.fill: button.background
        horizontalOffset: 3
        verticalOffset: 3
        transparentBorder: true
        radius: 8.0
        color: Style.darkGray
        source: button.background
    }
}
