import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../styles.js" as Style

Rectangle {
    id: bubble

    property alias text: text.text
    property alias dropModel: dropDown.model
    property var formModel: undefined
    property var dateModel: undefined
    property bool leftSide: true
    property bool textBubble: false
    property bool dropDownBubble: false
    property bool formBubble: false
    property bool painLevelBubble: false
    property bool textInputBubble: false
    property bool isButton: false
    property bool isDate: false
    property bool isYesOrNo: false
    property alias dropDown: dropDown
    property bool showCorners: true
    property alias yesText:  yes.text
    property alias noText: no.text

    width: root.width / 1.5
    height: isButton
            || isYesOrNo ? 40 : Math.max(
                               Style.bubbleMinHeight,
                               painRect.visible ? painRect.implicitHeight + 20 : formular.visible ? formular.implicitHeight + 20 : 0)

    color: isButton
           || isYesOrNo ? "transparent" : leftSide ? Style.blueBase : Style.lightGray
    onColorChanged: console.log()
    radius: 30

    signal addNextBubble
    signal finished

    Component.onCompleted: console.log("bubbleHeight", height)

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
        anchors.fill: parent
        anchors.margins: 5
        text: bubble.text
        onClicked: finished()
    }

    Text {
        id: text

        visible: bubble.textBubble
        color: Style.darkTextColor
        text: ""
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10

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
            font: dropDown.font
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
        //color: Qt.lighter(Style.blueBase, 1.2)
        color: Style.darkTextColor
        visible: bubble.textInputBubble
        placeholderText: "Please describe the injury..."
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
                color: Style.darkTextColor
                leftPadding: internalBtn.indicator.width + internalBtn.spacing
                verticalAlignment: Text.AlignVCenter
            }
            ButtonGroup.group: buttonGrp
        }
    }

    ListModel {
        id: formModel
    }

    Rectangle {
        color: "transparent"
        anchors.fill: parent
        id: formular
        implicitHeight: childrenRect.height + formModel.count * 18
        visible: bubble.formBubble
        Component.onCompleted: {
            console.log("size", bubble.formModel)
            for (var i = 0; i < bubble.formModel.length; i++) {
                formModel.append({
                                     "text": bubble.formModel[i]
                                 })
            }
        }

        GridLayout {
            id: layout
            anchors.fill: parent
            anchors.margins: 20
            columns: 1
            rows: formModel.count
            Repeater {
                model: formModel
                Row {
                    visible: currentIndex !== 0
                    Label {
                        id: lab
                        text: model.text
                        color: Style.darkTextColor
                        rightPadding: 30
                        horizontalAlignment: Text.AlignLeft
                        //                        Component.onCompleted: {
                        //                            while (text.length < 10) {
                        //                                text = text + " "
                        //                            }
                        //                        }
                    }
                    TextField {
                        id: feld
                        color: Style.darkTextColor
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }

    ListModel {
        id: dateModel
    }

    ButtonGroup {
        id: dateBtnGrp
    }

    Rectangle {

        color: "transparent"
        anchors.fill: parent
        id: date

        visible: bubble.isDate

        property var model: bubble.dateModel
        Component.onCompleted: {
            console.log("visible", visible)
            for (var i = 0; i < model.length; i++) {
                dateModel.append({
                                     "text": bubble.dateModel[i]
                                 })
            }
        }

        GridLayout {
            anchors.fill: parent
            anchors.margins: 20
            columns: 1
            rows: 1 //formModel.count
            Repeater {
                model: dateModel
                RadioButton {
                    id: dateBtn
                    checked: currentIndex === 1 ? true : false
                    text: model.text
                    contentItem: Text {
                        text: dateBtn.text
                        color: Style.darkTextColor
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

        width: 50
        height: 25
        text: "Apply"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 15
        anchors.bottomMargin: 15
        visible: leftSide && !bubble.isYesOrNo
        onClicked: {
            visible = false
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
            width: 100
            height: 40
            onTextChanged: console.log("buttonText:", yes.text)
            onClicked: {
                addNextBubble()
                enabled = false
                no.enabled = false
            }
        }
        UiButton {
            id: no
            // TODO make this redoable this somehow
            width: 100
            height: 40
            onTextChanged: console.log("buttonText:", no.text)

            onClicked: {
                addNextBubble()
                enabled = false
                yes.enabled = false
            }
        }
    }
}
