import QtQuick 2.15
import "styles.js" as Style

Rectangle {
    id: root

    color: "transparent"

    signal finished

    ListModel {
        id: bubbleModel

        ListElement {
            isLeft: false
            isText: true
            isDropDown: false
            dropDownModel: ""
            isForm: false
            isPainLevel: false
            isButton: false
            isInput: false
            text: "Choose a Painlevel"
        }
        ListElement {
            isLeft: true
            isText: false
            isDropDown: false
            dropDownModel: ""
            isPainLevel: true
            isForm: false
            isInput: false
            isButton: false
            text: ""
        }

        ListElement {
            isLeft: false
            isText: true
            isDropDown: false
            dropDownModel: ""
            isForm: false
            isPainLevel: false
            isInput: false
            isButton: false
            text: "Please describe the injury."
        }
        ListElement {
            isLeft: true
            isText: false
            isDropDown: false
            dropDownModel: ""
            isPainLevel: false
            isForm: false
            isInput: true
            isButton: false
            text: ""
        }

        ListElement {
            isLeft: false
            isText: true
            isDropDown: false
            dropDownModel: ""
            isForm: false
            isPainLevel: false
            isInput: false
            text: "Thank you! Your examination will be reviewed."
            isButton: false
        }

        ListElement {
            isLeft: false
            isText: false
            isDropDown: false
            dropDownModel: ""
            isForm: false
            isPainLevel: false
            isInput: false
            text: "Okay"
            isButton: true
        }
    }

    ListModel {
        id: initialModel

        ListElement {
            isLeft: false
            isText: true
            isDropDown: false
            dropDownModel: ""
            isPainLevel: false
            isForm: false
            isInput: false
            isButton: false
            text: "Please choose the bodypart"
        }
        ListElement {
            isLeft: true
            isText: false
            isDropDown: true
            dropDownModel: "Head,Left Arm,Right Arm,Back,Stomach"
            isPainLevel: false
            isForm: false
            isInput: false
            isButton: false
            text: ""
        }
    }

    BubbleList {
        id: content

        initialModel: initialModel
        bubbleModel: bubbleModel
    }
}

