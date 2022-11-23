import QtQuick 6.2
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import "styles.js" as Style

RoundButton {
    id: button

    palette.buttonText: Style.darkTextColor
    property color baseColor: Style.blueBase

    radius: 10

    background: Rectangle {
        width: button.width
        height: button.height
        border.width: button.activeFocus ? 2 : 1
        border.color: "transparent"// Style.borderColor
        opacity: 0.9
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
