QT += quick

SOURCES += \
        main.cpp

resources.files = styles.js \
                  main.qml \
                  pages/LoginPage.qml \
                  pages/AccountPage.qml \
                  pages/HomePage.qml \
                  components/UiButton.qml \
                  components/IconButton.qml \
                  components/UiRoundButton.qml \
                  components/BubbleComponent.qml \
                  components/SpeechBubble.qml \
                  components/BubbleList.qml \
                  components/Card.qml \
                  dialogs/ExaminationDialog.qml \
                  dialogs/BaseDialog.qml \
                  images/backgroundBlue.jpg \
                  images/backgroundGreen.jpg \
                  images/backgroundGreenHeavy.jpg \
                  images/backgroundPurple.jpg \
                  images/backgroundCircle.jpg \
                  images/background.webp \
                  icons/logo.svg \
                  icons/heart.svg \
                  icons/account.svg \
                  icons/medicine.svg \
                  icons/report.svg \
                  icons/pills.svg \
                  icons/examination.svg \
                  icons/appointment.svg \
                  icons/appointment.png \
                  icons/bell.svg \
                  icons/bellAlert.svg \
                  icons/home.svg \
                  icons/news.svg \
                  icons/next.svg \
                  icons/doc.svg \
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

HEADERS +=

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
    main.qml \
    pages/BasePage.qml \
    pages/LoginPage.qml \
    styles.js
