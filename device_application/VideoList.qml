import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQml.Models 2.15

Item {
    id: idVideoList

    ListModel {
        id:model
        ListElement {
            date: "2021-07-01"
        }
        ListElement {
            date: "2021-07-02"
        }
        ListElement {
            date: "2021-07-03"
        }
        ListElement {
            date: "2021-07-04"
        }
        ListElement {
            date: "2021-07-05"
        }
        ListElement {
            date: "2021-07-06"
        }
    }
    Popup {
        id: asd
    }
    Component {
        id: contactDelegate
        Item {
            width: 300
            height: 100
            ColumnLayout {
                Text {
                    text: 'Date: ' + date
                    font.family: "Arial"
                    font.pixelSize: 24
                }
                RowLayout {
                    Button {
                        text: '재생'
                        font.family: "맑은 고딕"
                    }
                    Button {
                        text: '삭제'
                    }
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
            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            focus: true
        }
        Rectangle {
            Layout.preferredWidth: 3
            Layout.fillHeight: true
            color: "white"
        }
        ColumnLayout {
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 40

                Item {
                    width: 40
                    height: 40
                    anchors.left: parent.lef
                    Image {
                        anchors.fill: parent
                        source: "../res/arrow_back.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: popView()
                    }
                }
            }

            Pane {
                Layout.fillWidth: true
                Layout.preferredHeight: idPlayingVideo.height + 25
                //Layout.fillHeight: true

                Material.elevation: 5
                Item {
                    id: idVideoArea
                    anchors.fill: parent

                    Image {
                        id: idPlayingVideo
                        width: parent.width
                        //height: parent.height
                        source: "../res/road.jpg"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
            Item {
                id: idPlayBar
                Layout.fillWidth: true
                Layout.preferredHeight: 40

                Item {
                    id: idPlayButton
                    width: 40
                    height: 40
                    anchors.horizontalCenter: idPlayBar.horizontalCenter
                    Image {
                        anchors.fill: parent
                        source: "../res/play2.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
        }
    }
}
