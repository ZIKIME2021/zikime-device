import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQml.Models 2.15

Item {
    id: idWifiList

    ListModel {
        id:model
        ListElement {
            name: "SK_WIFIGIGA5555_5G"
        }
        ListElement {
            name: "SK_WIFIGIGA1111_2.4G"
        }
        ListElement {
            name: "SK_WIFIGIGA2222_2.4G"
        }
        ListElement {
            name: "SK_WIFIGIGA3333_5G"
        }
        ListElement {
            name: "SK_WIFIGIGA4444_5G"
        }
    }
    Component {
        id: contactDelegate
        Item {
            width: 300
            height: 100
            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 20
                Item {
                    id: idWifiImg
                    width: 24
                    height: 24
                    Image {
                        anchors.fill: parent
                        source: "./res/wifi.png"
                    }
                }
                Text {
                    text: name
                    font.family: "Arial"
                    font.pixelSize: 18
                }
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        ListView {
            id: idListView
            Layout.preferredWidth: 300
            Layout.fillHeight: true
            model: model
            delegate: contactDelegate
            focus: true
        }
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
                            text: "SK_WIFIGIGA5555_5G"
                            font.family: "Arial"
                            font.pixelSize: 24
                            font.bold: true
                        }
                        Image {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.topMargin: 10
                            Layout.preferredHeight: 24
                            Layout.preferredWidth: 24
                            source: "./res/wifi.png"
                        }
                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.topMargin: 5
                            text: "연결됨"
                            font.family: "맑은 고딕"
                            font.pixelSize: 12
                            font.bold: true
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
                Rectangle {
                    id: idWifiInfo
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 120
                    anchors.rightMargin: 120
                    anchors.top: idBackButton.bottom
                    color: "White"
                    radius: 20
                    height: 150
                    ColumnLayout {
                        anchors.fill: parent
                        Item {
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height / 3
                            Layout.topMargin: 15
                            Text {
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                text: "네트워크 속도"
                                font.family: "맑은 고딕"
                                font.pixelSize: 12
                            }
                            Text {
                                anchors.right: parent.right
                                anchors.rightMargin: 20
                                text: "780Mbps"
                                font.family: "맑은 고딕"
                                font.pixelSize: 14
                            }
                        }
                        Item {
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height / 3
                            Layout.topMargin: -10
                            Text {
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                text: "보안"
                                font.family: "맑은 고딕"
                                font.pixelSize: 12
                            }
                            Text {
                                anchors.right: parent.right
                                anchors.rightMargin: 20
                                text: "WPA2 PSK"
                                font.family: "맑은 고딕"
                                font.pixelSize: 14
                            }
                        }
                        Item {
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height / 3
                            Layout.topMargin: -10
                            Text {
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                text: "IP 주소"
                                font.family: "맑은 고딕"
                                font.pixelSize: 12
                            }
                            Text {
                                anchors.right: parent.right
                                anchors.rightMargin: 20
                                text: "192.168.0.2\nfe80::70ca:8aff:fefc:297"
                                horizontalAlignment: Text.AlignRight
                                font.family: "맑은 고딕"
                                font.pixelSize: 14
                            }
                        }
                    }
                }
                Rectangle {
                    id: idWifiAdvanced
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 120
                    anchors.rightMargin: 120
                    anchors.top: idWifiInfo.bottom
                    anchors.topMargin: 20
                    color: "White"
                    radius: 20
                    height: 100
                    ColumnLayout {
                        anchors.fill: parent
                        Item {
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height / 2
                            RowLayout {
                                anchors.fill: parent
                                Text {
                                    Layout.alignment: Qt.AlignLeft
                                    Layout.leftMargin: 20
                                    text: "자동으로 다시 연결"
                                    font.family: "맑은 고딕"
                                    font.pixelSize: 12
                                }
                                Switch {
                                    Layout.alignment: Qt.AlignRight
                                    Layout.rightMargin: 20
                                    anchors.topMargin: -10
                                }
                            }
                        }
                        Item {
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height / 2
                            Text {
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                text: "보안"
                                font.family: "맑은 고딕"
                                font.pixelSize: 12
                            }
                            Text {
                                anchors.right: parent.right
                                anchors.rightMargin: 20
                                text: "WPA2 PSK"
                                font.family: "맑은 고딕"
                                font.pixelSize: 14
                            }
                        }
                    }
                }
            }
        }
    }
}
