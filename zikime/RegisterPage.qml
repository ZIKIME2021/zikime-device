import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQml.Models 2.15

import com.zikime.settings 1.0

Item {
    id: idRegister
    RowLayout {
        anchors.fill: parent

        Item {
            id: idSos
            Layout.preferredHeight: 200
            Layout.fillWidth: true
            Image {
                anchors.fill: parent
                source: "/images/regist.png"
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onClicked: idWindow.pushView("main.qml")
            }
        }
    }
}
