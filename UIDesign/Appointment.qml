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
            formModel: ""
            isPainLevel: false
            isButton: false
            isInput: false
            dateMode: ""
            isDate: false
            text: "Please provide insurance information"
        }
        ListElement {
            isLeft: true
            isText: false
            isDropDown: false
            dropDownModel: ""
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
            text: "Please select a data and time"
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
            dateModel: "Mo. Dec. 12th 4pm,Th. Dec 15th 10pm"
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
            text: "Dr Robert Jr. Blake st. 10 is booked"
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
            isForm: false
            isInput: false
            isButton: false
            isDate: false
            dateModel: ""
            text: "Please provide personal information"
        }
        ListElement {
            isLeft: true
            isText: false
            isDropDown: false
            dropDownModel: ""
            formModel: "Name,Surname,Address,Phone,Email"
            isPainLevel: false
            isForm: true
            isInput: false
            isButton: false
            isDate: false
            dateModel: ""
            text: ""
        }
    }

    BubbleList {
        id: content

        initialModel: initialModel
        bubbleModel: bubbleModel
    }
}

