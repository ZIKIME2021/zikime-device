import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: idWindow
    width: 960
    height: 640
    visible: true
    title: qsTr("지키ME")

    Material.theme: Material.Light
    Material.accent: Material.Blue

    StackView {
        id: idStackView
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 10

        initialItem: idMainLayout

        Item {
            id: idMainLayout
            RowLayout {
                anchors.fill: parent
                Item {
                    id: idWifi
                    Layout.preferredHeight: 200
                    Layout.fillWidth: true
                    Image {
                        anchors.fill: parent
                        source: "/res/wifi.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    Timer {
                        id: idTimer
                        interval: 3000
                        running: false
                        repeat: false
                        onTriggered: idPopup.close()
                    }

                    MouseArea {
                        anchors.fill: parent
                    }
                }
                Item {
                    id: idCellular
                    Layout.preferredHeight: 200
                    Layout.fillWidth: true
                    Image {
                        anchors.fill: parent
                        source: "/res/cellular.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
                Item {
                    id: idVideoList
                    Layout.preferredHeight: 200
                    Layout.fillWidth: true
                    Image {
                        anchors.fill: parent
                        source: "/res/video.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    MouseArea {
                        anchors.fill: parent
                    }
                }
                Item {
                    property bool isRecording: false
                    id: idRecord
                    Layout.preferredHeight: 200
                    Layout.fillWidth: true
                    Image{
                        anchors.fill: parent
                        source: !idRecord.isRecording ? "/res/play.png" : "/res/pause.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: idRecord.isRecording = !idRecord.isRecording
                    }
                }
                Item {
                    id: idSos
                    Layout.preferredHeight: 200
                    Layout.fillWidth: true
                    Image {
                        anchors.fill: parent
                        source: "/res/sos.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
        }
    }

    function pushView()
    {
        switch(arguments.length)
        {
        case 3:
            idStackView.push(arguments[0], arguments[1], arguments[2])
            break;
        case 2:
            var pushItem = idStackView.push(arguments[0], arguments[1])
            break;
        case 0:
        case 1:
        default:
            idStackView.push(arguments[0])
        }
    }

    function popView()
    {
        if(arguments.length > 0)
        {
            for(var nCnt = 0 ; nCnt < arguments.length ; nCnt++)
            {
                idStackView.pop(arguments[nCnt])
            }
        }else {
            if(idStackView.depth > 1)
            {
                idStackView.pop()
            }
        }
    }
}
