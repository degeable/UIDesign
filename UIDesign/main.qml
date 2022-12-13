import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtQml.StateMachine 1.12 as SM
import "styles.js" as Style
import "pages"
import "dialogs"
import "components"

Window {
    id: root
    width: 380
    height: 620

    visible: true
    title: "UiDesign"

    function addNotification(text, type) {
        globalNotificationModel.append({
                                           "text": text,
                                           "type": type,
                                       })
    }

    signal showNotifications

    ListModel {
        id: globalNotificationModel

        onRowsInserted: toast.show(get(count - 1).text)
    }

    ToastManager {
        id: toast

        anchors.topMargin: 10
        onClicked: showNotifications()
    }

    StackLayout {
        id: layout

        anchors.fill: parent

        Behavior on currentIndex {
            NumberAnimation {
                property: "opacity"
                to: 1.0
                duration: 500
            }
        }

        LoginPage {
            id: loginPage
        }
        HomePage {
            id: homePage
            notificationModel: globalNotificationModel
        }
        AccountPage {
            id: accountPage
        }
        ExaminationPage {
            id: examPage
        }
        PrescriptionPage {
            id: prescriptionPage
        }
        AppointmentPage {
            id: appointmentPage
        }
        ReportPage {
            id: reportPage
        }
    }

    SM.StateMachine {
        id: stateMachine

        initialState: loginState
        running: true

        SM.State {
            id: loginState

            onEntered: layout.currentIndex = 0

            SM.SignalTransition {
                targetState: homeState
                signal: loginPage.homePage
            }
            SM.SignalTransition {
                targetState: examState
                signal: loginPage.examinationPage
            }
            SM.SignalTransition {
                targetState: loginState
                signal: loginPage.loginPage
            }
            SM.SignalTransition {
                targetState: accountState
                signal: loginPage.accountPage
            }
            SM.SignalTransition {
                targetState: prescriptionState
                signal: loginPage.prescriptionPage
            }
            SM.SignalTransition {
                targetState: appointmentState
                signal: loginPage.appointmentPage
            }
            SM.SignalTransition {
                targetState: homeState
                signal: root.showNotifications
                guard: {
                    homePage.openNotifications = true
                    return true
                }
            }
        }

        SM.State {
            id: homeState

            onEntered: layout.currentIndex = 1
            SM.SignalTransition {
                targetState: homeState
                signal: homePage.homePage
            }
            SM.SignalTransition {
                targetState: examState
                signal: homePage.examinationPage
            }
            SM.SignalTransition {
                targetState: loginState
                signal: homePage.loginPage
            }
            SM.SignalTransition {
                targetState: accountState
                signal: homePage.accountPage
            }
            SM.SignalTransition {
                targetState: prescriptionState
                signal: homePage.prescriptionPage
            }
            SM.SignalTransition {
                targetState: appointmentState
                signal: homePage.appointmentPage
            }
            SM.SignalTransition {
                targetState: prescriptionState
                signal: homePage.medicationNotificationClicked
            }
            SM.SignalTransition {
                targetState: reportState
                signal: homePage.examResultNotificationClicked
            }
            SM.SignalTransition {
                targetState: homeState
                signal: root.showNotifications
                guard: {
                    homePage.openNotifications = true
                    return true
                }
            }
            SM.SignalTransition {
                targetState: reportState
                signal: homePage.reportPage
            }
        }

        SM.State {
            id: accountState

            onEntered: layout.currentIndex = 2
            SM.SignalTransition {
                targetState: homeState
                signal: accountPage.homePage
            }
            SM.SignalTransition {
                targetState: examState
                signal: accountPage.examinationPage
            }
            SM.SignalTransition {
                targetState: loginState
                signal: accountPage.loginPage
            }
            SM.SignalTransition {
                targetState: accountState
                signal: accountPage.accountPage
            }
            SM.SignalTransition {
                targetState: prescriptionState
                signal: accountPage.prescriptionPage
            }
            SM.SignalTransition {
                targetState: appointmentState
                signal: accountPage.appointmentPage
            }
            SM.SignalTransition {
                targetState: homeState
                signal: root.showNotifications
                guard: {
                    homePage.openNotifications = true
                    return true
                }
            }
            SM.SignalTransition {
                targetState: reportState
                signal: accountPage.reportPage
            }
        }

        SM.State {
            id: examState

            onEntered: layout.currentIndex = 3
            SM.SignalTransition {
                targetState: homeState
                signal: examPage.homePage
            }
            SM.SignalTransition {
                targetState: examState
                signal: examPage.examinationPage
            }
            SM.SignalTransition {
                targetState: loginState
                signal: examPage.loginPage
            }
            SM.SignalTransition {
                targetState: accountState
                signal: examPage.accountPage
            }
            SM.SignalTransition {
                targetState: prescriptionState
                signal: examPage.prescriptionPage
            }
            SM.SignalTransition {
                targetState: appointmentState
                signal: examPage.appointmentPage
            }
            SM.SignalTransition {
                targetState: homeState
                signal: root.showNotifications
                guard: {
                    homePage.openNotifications = true
                    return true
                }
            }
        }
        SM.State {
            id: prescriptionState

            onEntered: layout.currentIndex = 4
            SM.SignalTransition {
                targetState: homeState
                signal: prescriptionPage.homePage
            }
            SM.SignalTransition {
                targetState: examState
                signal: prescriptionPage.examinationPage
            }
            SM.SignalTransition {
                targetState: loginState
                signal: prescriptionPage.loginPage
            }
            SM.SignalTransition {
                targetState: accountState
                signal: prescriptionPage.accountPage
            }
            SM.SignalTransition {
                targetState: prescriptionState
                signal: prescriptionPage.prescriptionPage
            }
            SM.SignalTransition {
                targetState: appointmentState
                signal: prescriptionPage.appointmentPage
            }
            SM.SignalTransition {
                targetState: homeState
                signal: root.showNotifications
                guard: {
                    homePage.openNotifications = true
                    return true
                }
            }
        }
        SM.State {
            id: appointmentState

            onEntered: layout.currentIndex = 5
            SM.SignalTransition {
                targetState: homeState
                signal: appointmentPage.homePage
            }
            SM.SignalTransition {
                targetState: examState
                signal: appointmentPage.examinationPage
            }
            SM.SignalTransition {
                targetState: loginState
                signal: appointmentPage.loginPage
            }
            SM.SignalTransition {
                targetState: accountState
                signal: appointmentPage.accountPage
            }
            SM.SignalTransition {
                targetState: prescriptionState
                signal: appointmentPage.prescriptionPage
            }
            SM.SignalTransition {
                targetState: appointmentState
                signal: appointmentPage.appointmentPage
            }
            SM.SignalTransition {
                targetState: homeState
                signal: root.showNotifications
                guard: {
                    homePage.openNotifications = true
                    return true
                }
            }
        }

        SM.State {
            id: reportState

            onEntered: layout.currentIndex = 6
            SM.SignalTransition {
                targetState: homeState
                signal: reportPage.homePage
            }
            SM.SignalTransition {
                targetState: examState
                signal: reportPage.examinationPage
            }
            SM.SignalTransition {
                targetState: loginState
                signal: reportPage.loginPage
            }
            SM.SignalTransition {
                targetState: accountState
                signal: reportPage.accountPage
            }
            SM.SignalTransition {
                targetState: prescriptionState
                signal: reportPage.prescriptionPage
            }
            SM.SignalTransition {
                targetState: appointmentState
                signal: reportPage.appointmentPage
            }
            SM.SignalTransition {
                targetState: homeState
                signal: root.showNotifications
                guard: {
                    homePage.openNotifications = true
                    return true
                }
            }
        }
    }
}
