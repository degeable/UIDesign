QT += quick

SOURCES += \
        backend.cpp \
        main.cpp

resources.files = styles.js \
                  main.qml \
                  Backend.qml \
                  pages/LoginPage.qml \
                  pages/AccountPage.qml \
                  pages/HomePage.qml \
                  pages/ExaminationPage.qml \
                  pages/PrescriptionPage.qml \
                  pages/AppointmentPage.qml \
                  pages/ReportPage.qml \
                  components/UiButton.qml \
                  components/IconButton.qml \
                  components/UiRoundButton.qml \
                  components/BubbleComponent.qml \
                  components/SpeechBubble.qml \
                  components/BubbleList.qml \
                  components/Card.qml \
                  components/Toast.qml \
                  components/ToastManager.qml \
                  components/FormularLayout.qml \
                  dialogs/ExaminationDialog.qml \
                  dialogs/AppointmentDialog.qml \
                  dialogs/MedicationDialog.qml \
                  dialogs/BaseDialog.qml \
                  images/backgroundBlue.jpg \
                  images/backgroundGreen.jpg \
                  images/backgroundGreenHeavy.jpg \
                  images/backgroundPurple.jpg \
                  images/backgroundCircle.jpg \
                  images/background.webp \
                  images/chatGreen.jpg \
                  images/chatGreenLight.jpg \
                  images/chatBlue.jpg \
                  images/anon.svg \
                  icons/logo.svg \
                  icons/doctor.png \
                  icons/heart.svg \
                  icons/account.svg \
                  icons/medicine.svg \
                  icons/report.svg \
                  icons/pills.svg \
                  icons/examination.svg \
                  icons/appointment.png \
                  icons/bell.svg \
                  icons/bellAlert.svg \
                  icons/home.svg \
                  icons/news.svg \
                  icons/next.svg \
                  icons/doc.svg \
                  icons/darkLogo.svg \
                  icons/calendarRound.png \
                  $$files(qml/*.qml) \
                  $$files(pages/*.qml) \
                  $$files(images/*.png) \
                  $$files(components/*.png) \
                  $$files(components/*.svg) \
                  $$files(icons/*.png)

resources.prefix = /$${TARGET}

RESOURCES += resources

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# CONFIG += app_bundle

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    backend.h

DISTFILES += \
    components/UiButton.qml \
    components/UiRoundButton.qml \
    icons/blueCard.png \
    icons/greenCard.png \
    icons/logo.png \
    icons/logo.svg \
    icons/pinkCard.png \
    icons/yellowCard.png \
    images/background.webp \
    images/meds.png \
    main.qml \
    pages/AppointmentPage.qml \
    pages/BookedAppointmentsPage.qml \
    pages/BasePage.qml \
    pages/ExaminationPage.qml \
    pages/LoginPage.qml \
    pages/AccountPage.qml \
    pages/PrescriptionPage.qml \
    pages/ReportPage.qml \
    styles.js
