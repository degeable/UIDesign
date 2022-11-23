import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import "styles.js" as Style

Window {
    id: root
    width: 480
    height: 620

    visible: true
    title: "UntitledProject"

    Component.onDestruction: {
                    if(contentContainer.source.toString() === "MainScreen.qml") {
                        contentContainer.item.loggedIn = false
                    }
    }

    Image {
        id: background
        source: "background.webp"
        z: -2
        anchors.fill: parent
        visible: true
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        id: gradientBackground

        z: -2
        anchors.fill: parent
        visible: false
        gradient: Gradient {
            GradientStop { position: 0 ; color: Style.backgroundDark }
            GradientStop { position: 1 ; color: Style.backgroundLight }
        }
    }

    Rectangle {
        id: headerBar

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        z:1
        height: 73

        color: "transparent"
        opacity: 0.5

        Text {
            id: headerText

            anchors.left: homeButton.right
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 20
        }

        UiButton {
            id: homeButton

            width: 73
            height: 73
            baseColor: Style.lightGray
            visible: contentContainer.source.toString() !== "MainScreen.qml"
            onClicked: {
                headerText.text = ""
                contentContainer.source = "MainScreen.qml"
            }

            Image {
                id: homeButtonImage

                scale: 2
                anchors.centerIn: parent
                source: "Home-icon.svg"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Loader {
        id: contentContainer

        anchors.top: headerBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        source: "MainScreen.qml"


        // TODO: see if this looks good later
   //     onSourceChanged: {
//            if(source.toString() === "MainScreen.qml") {
//                contentContainer.item.loggedIn = root.loggedIn
//                console.log("set to true")
//            }

  //      }
        //loaderAnimation.start()

        //        NumberAnimation {
        //            id: loaderAnimation
        //            target: contentContainer
        //            property: "scale"
        //            from: 0
        //            to: 1
        //            duration: Style.loaderAnimationTime
        //        }
    }

    Connections {
        target: contentContainer.item

        ignoreUnknownSignals: true
        function onButtonClicked(button) {
            console.log(button)
            switch (button) {
            case "Account":
                contentContainer.source = "Account.qml"
                headerText.text = "Account"
                break
            case "Start Examination":
                contentContainer.source = "Examination.qml"
                headerText.text = "Virtual Examination"
                break
            case "Examination Results":
                contentContainer.source = "Results.qml"
                headerText.text = "Examination Results"
                break
            case "Get Sick Note":
                contentContainer.source = "SickNote.qml"
                headerText.text = "Get Sick Note"
                break
            case "Okay":
                contentContainer.source = "MainScreen.qml"
                headerText.text = ""
                break
            case "Book Appointment":
                contentContainer.source = "Appointment.qml"
                headerText.text = "Appointment"
                break
            case "Prescriptions":
                contentContainer.source = "Prescriptions.qml"
                headerText.text = "Prescriptions"
                break
            case "Painkiller":
                contentContainer.source = "MedicationDialog.qml"
                headerText.text = "Prescriptions"
                break
            }
        }

        function onFinished() {
            headerText.text = ""
            contentContainer.source = "MainScreen.qml"
        }
    }
}

