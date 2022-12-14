import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../styles.js" as Style

Rectangle {
    id: bubble

    // TODO this needs major rewrite. Historically grown.

    property alias text: text.text
    property alias dropModel: dropDown.model
    property var formModel: undefined
    property var dateModel: undefined
    property bool leftSide: true
    property bool textBubble: false
    property bool dropDownBubble: false
    property bool formBubble: false
    property bool personalForm: false
    property bool insuranceForm: false
    property bool painLevelBubble: false
    property bool textInputBubble: false
    property bool isButton: false
    property bool isDate: false
    property bool isYesOrNo: false
    property alias dropDown: dropDown
    property bool showCorners: true
    property alias yesText: yes.text
    property alias noText: no.text

    width: root.width / 1.5
    height: isButton
            || isYesOrNo ? 40 : Math.max(
                               Style.bubbleMinHeight,
                               painRect.visible ? painRect.implicitHeight + 20 : formular.visible ? formular.implicitHeight : 0)

    color: isButton
           || isYesOrNo ? "transparent" : leftSide ? Style.blueBase : Style.lightGray

    radius: 30

    signal addNextBubble
    signal finished

    Rectangle {
        id: corner

        color: bubble.color
        visible: !bubble.leftSide && bubble.showCorners
        width: 50
        height: 50
        anchors.left: bubble.left
        anchors.top: bubble.top
    }

    Rectangle {
        id: corner2

        color: bubble.color

        visible: bubble.leftSide && bubble.showCorners
        width: 50
        height: 50

        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }

    UiButton {
        id: button

        visible: bubble.isButton

        palette.buttonText: Style.darkTextColor
        anchors.fill: parent
        anchors.margins: 5
        text: bubble.text
        onClicked: {
            finished()
        }
    }

    Text {
        id: text

        visible: bubble.textBubble
        color: Style.darkTextColor
        text: ""
        width: parent.width
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 8
        font.bold: true
        font.pointSize: Style.fontSizeNormal
        wrapMode: Text.Wrap
        elide: Text.ElideRight
    }

    ComboBox {
        id: dropDown

        model: undefined
        visible: bubble.dropDownBubble
        contentItem: Text {
            leftPadding: 0
            rightPadding: 0

            text: dropDown.displayText
            font.pointSize: Style.fontSizeNormal
            font.bold: true
            color: Style.darkTextColor
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
    }

    TextField {
        id: textInput

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20

        focus: true
        height: parent.height / 2 - 10
        width: parent.width - okButton.width
        color: Style.darkTextColor
        visible: bubble.textInputBubble
        placeholderText: "Please describe the injury..."
        placeholderTextColor: Qt.lighter(Style.darkTextColor, 1.8)
        font.bold: true
        font.pointSize: Style.fontSizeNormal
        wrapMode: Text.Wrap
    }

    Rectangle {
        id: painRect
        anchors.fill: parent
        implicitHeight: childrenRect.height
        anchors.margins: 10
        color: "transparent"
        visible: bubble.painLevelBubble
        Text {
            id: painText
            text: "Pain level: " + slider.value
            anchors.top: parent.top
            anchors.left: parent.left
            color: Style.darkTextColor
            font.pointSize: Style.fontSizeNormal
            font.bold: true
        }
        Slider {
            id: slider
            anchors.left: parent.left
            anchors.top: painText.bottom
            anchors.topMargin: 15
            from: 1
            to: 10
            snapMode: Slider.SnapAlways
            stepSize: 1.0
            background: Rectangle {
                x: slider.leftPadding
                y: slider.topPadding + slider.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 4
                width: slider.availableWidth
                height: implicitHeight
                radius: 2
                color: Style.lightGray

                Rectangle {
                    width: slider.visualPosition * parent.width
                    height: parent.height
                    color: Style.darkGray
                    radius: 2
                }
            }
            handle: Rectangle {
                x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
                y: slider.topPadding + slider.availableHeight / 2 - height / 2
                implicitWidth: 26
                implicitHeight: 26
                radius: 13
                color: slider.pressed ? "#f0f0f0" : "#f6f6f6"
                border.color: "#bdbebf"
            }
        }

        ButtonGroup {
            id: buttonGrp
        }

        RadioButton {
            id: internalBtn
            anchors.left: parent.left
            anchors.top: slider.bottom
            anchors.topMargin: 15
            checked: true
            text: "Internal"
            contentItem: Text {
                text: internalBtn.text
                color: Style.darkTextColor
                font.pointSize: Style.fontSizeNormal
                font.bold: true
                leftPadding: internalBtn.indicator.width + internalBtn.spacing
                verticalAlignment: Text.AlignVCenter
            }
            ButtonGroup.group: buttonGrp
        }

        RadioButton {
            id: externalBtn
            anchors.left: parent.left
            anchors.top: internalBtn.bottom
            anchors.topMargin: 15
            checked: false
            text: "External"
            contentItem: Text {
                text: externalBtn.text
                font.pointSize: Style.fontSizeNormal
                font.bold: true
                color: Style.darkTextColor
                leftPadding: internalBtn.indicator.width + internalBtn.spacing
                verticalAlignment: Text.AlignVCenter
            }
            ButtonGroup.group: buttonGrp
        }
    }

    // TODO remove
    ListModel {
        id: formModel
    }

    Rectangle {
        color: "transparent"
        anchors.fill: parent
        anchors.rightMargin: Style.baseMargin
        id: formular
        implicitHeight: childrenRect.height + formModel.count * 18 + 25
        visible: bubble.formBubble
        // TODO remove
        Component.onCompleted: {
            for (var i = 0; i < bubble.formModel.length; i++) {
                formModel.append({
                                     "index": bubble.formModel[i].split(":")[0],
                                     "text": bubble.formModel[i].split(":")[1]
                                 })
            }
        }

        FormularLayout {
            id: formlayout

            visible: formBubble

            model: personalForm ? personalModel : insuranceModel //? insuranceModel : undefined
        }
    }

    ListModel {
        id: dateModel
    }

    ButtonGroup {
        id: dateBtnGrp
    }

    Rectangle {
        id: date

        property var model: bubble.dateModel

        anchors.fill: parent

        color: "transparent"
        visible: bubble.isDate

        Component.onCompleted: {
            for (var i = 0; i < model.length; i++) {
                dateModel.append({
                                     "text": bubble.dateModel[i]
                                 })
            }
        }

        GridLayout {
            anchors.fill: parent
            anchors.leftMargin: 18
            columns: 1
            rows: 1
            Repeater {
                id: dateRepeater
                model: dateModel
                RadioButton {
                    id: dateBtn
                    checked: false
                    text: model.text
                    contentItem: Text {
                        text: dateBtn.text
                        color: Style.darkTextColor
                        font.pointSize: Style.fontSizeNormal
                        font.bold: true
                        leftPadding: dateBtn.indicator.width + dateBtn.spacing
                        verticalAlignment: Text.AlignVCenter
                    }
                    ButtonGroup.group: dateBtnGrp
                }
            }
        }
    }

    UiButton {
        id: okButton

        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 5
        anchors.bottomMargin: 5

        width: 60
        height: 25

        enabled: true//bubble.formBubble ? formlayout.correctInput : true

        text: "Next"
        palette.buttonText: Style.darkTextColor
        visible: leftSide && !bubble.isYesOrNo
        onClicked: {
            for (var i = 0; i < dateRepeater.count; i++){
                if (dateRepeater.itemAt(i).checked) {
                    appointmentModel.append(dateRepeater.itemAt(i).text, "Appointment at the Boston Medical Center")
                }
            }
            addNextBubble()
        }
    }

    Row {
        anchors.centerIn: parent
        anchors.margins: 50
        visible: bubble.isYesOrNo

        spacing: 10
        UiButton {
            id: yes
            // TODO make this redoable this somehow
            palette.buttonText: Style.darkTextColor
            width: 100
            height: 40
            onClicked: {
                addNextBubble()
                enabled = false
                no.enabled = false
                checked = true
            }
        }
        UiButton {
            id: no
            // TODO make this redoable this somehow
            palette.buttonText: Style.darkTextColor
            width: 100
            height: 40

            onClicked: {
                addNextBubble()
                enabled = false
                yes.enabled = false
            }
        }
    }
}
