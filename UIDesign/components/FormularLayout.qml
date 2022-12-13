import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../styles.js" as Style

GridLayout {
    id: root
    anchors.fill: parent
    anchors.leftMargin: 15
    anchors.rightMargin: 15
    anchors.bottomMargin: 35
    columns: 1
    rows: repeater.count

    property alias model: repeater.model

    Repeater {
        id: repeater

        Row {
            spacing: 5
          //  visible: currentIndex !== 0
            Column {
                width: root.width / 3

                // Filler
                Text {
                    font.pointSize: 12
                    text: "1"
                    color: "transparent"
                }

                Text {
                    id: lab
                    text: model.key
                    color: Style.darkTextColor
                    font.bold: true
                    font.pointSize: Style.fontSizeNormal
                    horizontalAlignment: Text.AlignLeft
                    width: root.width / 3 - 5
                    baselineOffset: field.baselineOffset
                }
            }
            Column {
                width: root.width - lab.width
                spacing: 2
                Text {
                    id: errorText

                    font.pointSize: 10
                    color: field.color.toString() === "#ff0000" ? "red" : "transparent"
                    visible: true
                    text: model.key === "Phone" ? "Invalid phone number" : model.key === "SSN" ? "Invalid social security number" : "Invalid email address"
                }
                TextField {
                    id: field

                    background: Rectangle {
                        color: Qt.lighter(Style.blueBase, 1.2)
                        border.color: field.color
                        radius: 10
                    } 

                    text: model.value

                    onTextChanged: model.value = text

                    color: Style.darkTextColor
                    inputMask: model.key === "Phone" ? "(999) 999-9999" : model.key === "SSN" ? "000-00-0000"  : ""
                    width: root.width - lab.width - 10

                    validator: RegularExpressionValidator {
                        regularExpression: model.key === "Email" ? /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/ : /.*/
                    }

                    onFocusChanged: {
                        field.color = activeFocus ? Style.darkTextColor : !acceptableInput && length !==0 ? "red" : Style.darkTextColor
                    }
                }
            }
        }
    }
}
