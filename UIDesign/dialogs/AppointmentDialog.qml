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
            isLeft: false
            isText: true
            isDropDown: false
            dropDownModel: ""
            isForm: false
            formModel: ""
            isPainLevel: false
            isButton: false
            isInput: false
            dateMode: ""
            isDate: false
            text: "Thank you! Now please add or review your insurance information"
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
            isLeft: false
            isText: true
            isDropDown: false
            dropDownModel: ""
            isForm: false
            isPainLevel: false
            dateModel: ""
            isInput: false
            isButton: false
            isDate: false
            text: "Please select one of the following date and time for Dr. Blake"
        }
        ListElement {
            isLeft: true
            isText: false
            isDropDown: false
            dropDownModel: ""
            isPainLevel: false
            isForm: false
            isInput: false
            isButton: false
            dateModel: "Th. Dec 15th 10pm, Mo. Dec. 19th 4pm, Tu. Dec. 20th 9am"
            isDate: true
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
            text: "Booking an appointment at Boston Medical Center Pl, Boston, MA 02118"
            isButton: false
            isDate: false
            dateModel: ""
        }

        ListElement {
            isLeft: false
            isText: false
            isDropDown: false
            dropDownModel: "test,test2"
            isForm: false
            isPainLevel: false
            isInput: false
            text: "Okay"
            dateModel: ""
            isDate: false
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
            text: "I am going to ask you some questions to set you up for an appointment."
        }

        ListElement {
            isLeft: false
            isText: true
            isDropDown: false
            dropDownModel: ""
            formModel: ""
            insuranceForm: false
            personalForm: false
            isPainLevel: false
            isForm: false
            isInput: false
            isButton: false
            isDate: false
            dateModel: ""
            text: "At first, please add or review your personal information."
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
    }
}

