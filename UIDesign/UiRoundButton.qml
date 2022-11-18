import QtQuick 6.2
import QtQuick.Controls 2.15
import "styles.js" as Style

RoundButton {
    id: button

    palette.buttonText: Style.darkTextColor
    property color baseColor: Style.blueBase

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
}
