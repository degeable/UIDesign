import QtQuick 6.2
import QtQuick.Controls 2.15
import "styles.js" as Style
Button {
    id: button

    palette.buttonText: Style.darkTextColor
    property color baseColor: Style.blueBase

    background: Rectangle {
        implicitWidth: button.width
        implicitHeight: button.height
        border.width: button.activeFocus ? 2 : 1
        border.color: Style.borderColor
        radius: 4
        gradient: Gradient {
            GradientStop { position: 0 ; color: button.pressed ? Qt.darker(button.baseColor, 1.1) : button.baseColor }
            GradientStop { position: 1 ; color: button.pressed ? button.baseColor :  Qt.darker(button.baseColor, 1.1) }
        }
    }
}
