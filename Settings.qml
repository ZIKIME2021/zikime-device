import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQml.Models 2.15

import com.zikime.settings 1.0
import com.zikime.const 1.0

Item {
    id: idSettings
    property Settings settings: Settings{}
    property Const notify: Const{}

    RowLayout {
        anchors.fill: parent
        Rectangle {
            Layout.preferredWidth: 3
            Layout.fillHeight: true
            color: "white"
        }
        ColumnLayout {
            Pane {
                Layout.fillWidth: true
                Layout.preferredHeight: 485
                Material.elevation: 0
                Item {
                    id: idWifiConnection
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 100
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 1
                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.topMargin: 10
                            text: "Settings"
                            font.family: "Arial"
                            font.pixelSize: 24
                            font.bold: true
                        }
                        Image {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.topMargin: 10
                            Layout.preferredHeight: 24
                            Layout.preferredWidth: 24
                            source: "./res/settings.png"
                        }
                        Text {
                            id: idSoundMode
                            Layout.alignment: Qt.AlignHCenter
                            Layout.topMargin: 50
                            text: "None"
                            font.family: "Arial"
                            font.pixelSize: 20
                        }
                        Item {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                        }
                    }
                }
                Item {
                    id: idBackButton
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 40
                    anchors.top: idWifiConnection.bottom

                    Item {
                        width: 40
                        height: 40
                        anchors.left: parent.lef
                        Image {
                            anchors.fill: parent
                            source: "./res/arrow_back.png"
                            fillMode: Image.PreserveAspectFit
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: popView()
                        }
                    }
                }
                Item {
                    RowLayout {
                        anchors.fill: parent
                        Button {
                            text: "SILENT"
                            onClicked: idSoundMode.text = text
                        }
                        Button {
                            text: "VIBRATE"
                            onClicked: idSoundMode.text = text
                        }
                        Button {
                            text: "SOUND"
                            onClicked: idSoundMode.text = text
                        }
                    }
                }
            }
        }
    }
}
