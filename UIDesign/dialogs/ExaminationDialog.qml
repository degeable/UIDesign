import QtQuick 2.15
import "../components"
import "../styles.js" as Style

BaseDialog {
    id: root

    color: "transparent"

    function reset() {
        actualModel.clear()
        bubbleCounter = 0
    }

    bubbleModel: bubbleModel
    initialModel: initialModel

    ListModel {
            id: bubbleModel

            ListElement {
                ilsLeft: false
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
                text: "Thank you! \nYour examination will be reviewed."
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
                text: "I am going to ask you some questions to gather information about your injury"
            }

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
}

