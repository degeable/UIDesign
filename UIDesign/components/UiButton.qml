import QtQuick 6.2
import QtQuick.Controls 2.15
import "../styles.js" as Style
Button {
    id: button

    property color baseColor: Style.blueBase

    palette.buttonText: Style.darkTextColor

   // font.family : Style.buttonFont
    font.pointSize: Style.fontSizeNormal
    font.bold: true

    width: Style.buttonWidth
    background: Rectangle {
        radius: 4
        gradient: Gradient {
            GradientStop { position: 0 ; color: button.pressed ? Qt.darker(button.baseColor, 1.1) : button.baseColor }
            GradientStop { position: 1 ; color: button.pressed ? button.baseColor :  Qt.darker(button.baseColor, 1.1) }
        }
    }
}
