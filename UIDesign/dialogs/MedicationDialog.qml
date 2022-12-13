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
            isText: true
            text: "Please add or review your insurance information."
        }
        ListElement {
            isLeft: true
            isText: false
            isDropDown: false
            dropDownModel: ""
            insuranceForm: true
            formModel: "SSN,Company"
            isPainLevel: false
            isForm: true
            isInput: false
            isButton: false
            isDate: false
            dateModel: ""
            text: ""
        }

        ListElement {
            isText: true
            text: "Do you want your medication for delivery or pickup?"
        }
        ListElement {
            isLeft: true
            isYesOrNo: true
            yesText: "Pickup"
            noText: "Delivery"
        }

        ListElement {
            isText: true
            text: "Please add or review your personal information."
        }
        ListElement {
            isLeft: true
            isText: false
            isDropDown: false
            dropDownModel: ""
            personalForm: true
            insuranceForm: false
            // TODO remove this
            formModel: "0:Name,1:Surname,2:Address,3:Phone,4:Email"
            isPainLevel: false
            isForm: true
            isInput: false
            isButton: false
            isDate: false
            dateModel: ""
            text: ""
        }


        ListElement {
            isText: true
            text: "Anvil Ibuprofen 200 for delivery.\nPlease confirm"
        }

        ListElement {
            isLeft: false
            text: "Confirm"
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
            formModel: ""
            isPainLevel: false
            insuranceForm: false
            personalForm: false
            isForm: false
            isInput: false
            isButton: false
            isDate: false
            dateModel: ""
            text: "I am going to ask you some questions to renew your prescription."
        }

        ListElement {
            isText: true
            text: "Are you taking any other medications?"
            formModel: ""
            insuranceForm: false
            personalForm: false
            isForm: false
            isYesOrNo: false
            yesText: ""
            noText: ""
            isButton: false
        }
        ListElement {
            isLeft: true
            isYesOrNo: true
            insuranceForm: false
            personalForm: false
            formModel: ""
            isForm: false
            yesText: "Yes"
            noText: "No"
            isButton: false
        }
    }
}

