import QtQuick 6.2
import QtQuick.Window 6.2
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.settings 1.0
import "../components"
import "../icons"
import "../dialogs"
import "../styles.js" as Style

BasePage {
    id: root

    background: "../images/chatBlue.jpg"

    onVisibleChanged: {
        if (visible)
            examinationButton.checked = true
    }

   ExaminationDialog {
       anchors.fill: parent
    }
}
