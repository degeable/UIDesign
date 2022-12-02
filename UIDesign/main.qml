import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtQml.StateMachine 1.12 as SM
import "styles.js" as Style
import "pages"
import "dialogs"

Window {
    id: root
    width: 380
    height: 620

    visible: true
    title: "UntitledProject"

    StackLayout {
        id: layout

        anchors.fill: parent
       Behavior on currentIndex {
            NumberAnimation { property: "opacity"; to: 1.0; duration: 500 }
        }

        LoginPage {id: loginPage}
        HomePage {id: homePage}
        AccountPage {id: accountPage}
        ExaminationDialog { id: examDialog }

    }

    SM.StateMachine {
        id: stateMachine

        initialState: loginState
        running: true

        SM.State {
            id: loginState

            onEntered: layout.currentIndex = 0
            SM.SignalTransition { targetState: homeState; signal: loginPage.done }
        }

        SM.State {
            id: homeState

            onEntered: layout.currentIndex = 1
            SM.SignalTransition { targetState: examState; signal: homePage.done }
        }

        SM.State {
            id: examState

            onEntered: layout.currentIndex = 2
            SM.SignalTransition { targetState: loginState; signal: examDialog.done }
        }
    }
}

