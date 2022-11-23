import QtQuick 2.15
import "styles.js" as Style

Rectangle {
    id: root

    color: "transparent"

    signal finished

    ListModel {
        id: bubbleModel

        ListElement {
            isText: true
            text: "Do you want to update financial information? \n (only no in the prototype)"
        }
        ListElement {
            isLeft: true
            isYesOrNo: true
        }


        ListElement {
            isText: true
            text: "Do you want your medication for delivery or pickup?\n (only delevery in prototype)"
        }
        ListElement {
            isLeft: true
            isYesOrNo: true
            yesText: "Pickup"
            noText: "Delivery"
        }


        ListElement {
            isText: true
            text: "Do you need to update your shipping address? \n (only yes in the prototype)"
        }
        ListElement {
            isLeft: true
            isYesOrNo: true
        }

        ListElement {
            isText: true
            text: "Please provide your shipping address."
        }
        ListElement {
            isLeft: true
            isForm: true
            formModel: "Street,City,State,Postcode"
        }

        ListElement {
            isText: true
            text: "Painkiller XYZ for delivery. Please confirm. \n (only confirm in the prototype)"
        }

        ListElement {
            isLeft: false
            text: "Okay"
            isButton: true
        }
    }

    ListModel {
        id: initialModel

        ListElement {
            isText: true
            text: "Are your incompabilities still valid? \n (only yes in the prototype)"
            formModel: ""
            isForm: false
            isYesOrNo: false
            yesText: ""
            noText: ""
            isButton: false
        }
        ListElement {
            isLeft: true
            isYesOrNo: true
            formModel: ""
            isForm: false
            yesText: "Yes"
            noText: "No"
            isButton: false
        }
    }


    BubbleList {
        id: content

        initialModel: initialModel
        bubbleModel: bubbleModel
    }
}

