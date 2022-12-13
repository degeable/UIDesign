import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes 1.4
import "../styles.js" as Style

    Rectangle {
        color: "transparent"

        height: bubble.height
        width: parent === null ? 0 : parent.width
        radius: 30

     //   property alias formRepeater: bubble.formRepeater

        SpeechBubble {
            id: bubble

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: model.isButton || model.isYesOrNo ? parent.width / 2  - 50 : model.isLeft ? parent.width / 3 : 10
            anchors.rightMargin: model.isButton || model.isYesOrNo ? parent.width / 2  - 50 : model.isLeft ? 10 : parent.width / 3

            // TODO cleanup this historical grown mess
            leftSide: model.isLeft ? model.isLeft : false
            textBubble: model.isText ? model.isText : false
            dropDownBubble: model.isDropDown ? model.isDropDown  : false
            formBubble: model.isForm ? model.isForm : false
            text: model.text ? model.text : ""
            dropModel: model.dropDownModel ? model.dropDownModel.split(",") : ""
            formModel: model.formModel ? model.formModel.split(",") : ""
            personalForm: model.personalForm ? model.personalForm : false
            insuranceForm: model.insuranceForm ? model.insuranceForm : false
            painLevelBubble: model.isPainLevel ? model.isPainLevel  : false
            textInputBubble: model.isInput ? model.isInput : false
            dateModel: model.dateModel ? model.dateModel.split(",") : ""
            isButton: model.isButton ? model.isButton  : false
            isDate: model.isDate ? model.isDate : false
            isYesOrNo: model.isYesOrNo ? model.isYesOrNo : false
            yesText: model.yesText ? model.yesText : "Yes"
            noText: model.noText ? model.noText : "No"
            onAddNextBubble: nextBubbleTriggered()
            onFinished: fin()
           // https://stackoverflow.com/questions/26717068/qml-define-function-in-listelement-called-in-listview
        }

        DropShadow {
            anchors.fill: bubble
            horizontalOffset: 3
            verticalOffset: 3
            transparentBorder: true
            radius: 8.0
            color: Style.darkGray
            source: bubble
            visible:!bubble.isYesOrNo
        }
    }

