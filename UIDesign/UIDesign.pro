QT += quick

SOURCES += \
        main.cpp

resources.files = main.qml MainScreen.qml UiButton.qml \
                    UiRoundButton.qml Home-icon.svg styles.js \
                    background.webp logo.png Account.qml SpeechBubble.qml \
                    BubbleList.qml BubbleComponent.qml Examination.qml \
                    Results.qml SickNote.qml Appointment.qml Card.qml \
                    Prescriptions.qml MedicationDialog.qml
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

HEADERS +=

DISTFILES += \
    Account.qml \
    Card.qml \
    Examination.qml \
    Home-icon.svg \
    Prescriptions.qml \
    background.webp \
    logo.png \
    styles.js
