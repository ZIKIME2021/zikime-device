import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.15

import CmdLauncher 1.0

ApplicationWindow {
    id: idWindow
    width: 720
    height: 480
    visible: true
    title: qsTr("지키ME")

    Material.theme: Material.Light
    Material.accent: Material.Blue

    CmdLauncher {
        id: idCmdLauncher
    }

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
                        onClicked: pushView("WifiList.qml")
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
                        onClicked: pushView("VideoList.qml")
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
    Item {
        anchors.fill: parent
        anchors.leftMargin: 50
        anchors.rightMargin: 50
        anchors.topMargin: 50
        anchors.bottomMargin: 50
        Popup {
            id: idPopup
            width: parent.width
            height: parent.height
            modal: true
            focus: true
            onClosed: idTimer.stop()
            Item {
                anchors.fill: parent
                ColumnLayout {
                    anchors.fill: parent
                    Label {
                        Layout.alignment: Qt.AlignCenter
                        Layout.topMargin: 70
                        text: "보호자로부터 스트리밍 요청이 도착했습니다."
                        font.pixelSize: 24
                        font.bold: true
                    }
                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 150
                        Button {
                            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
                            text: "   수락   "
                            font.pixelSize: 14
                            onClicked: {
                                idPopup.close()
                                idReqTimer.stop()
                                idCmdLauncher.setProgram("notepad.exe")
                                idCmdLauncher.setArgs("test.cpp")
                                idCmdLauncher.start()
                            }
                        }
                        Button {
                            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
                            text: "   거절   "
                            font.pixelSize: 14
                            onClicked: {
                                idPopup.close()
                                idReqTimer.stop()
                            }
                        }
                    }
                }
            }
        }
    }

    Timer {
        id: idReqTimer
        interval: 3000
        running: true
        repeat: true
        onTriggered: refresh()
    }

    Component.onCompleted: idReqTimer.start()

    function refresh()
    {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "http://127.0.0.1:5000/test")
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var json = xhr.responseText

                var jsonObject = JSON.parse(json)
                if(jsonObject["test"] === "true")
                {
                    console.log("TRUE")
                    idPopup.open()
                    idTimer.start()
                }
                else
                    console.log("FALSE")
            }
        }
        xhr.send()
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
            for(var nCnt = 0; nCnt < arguments.length; nCnt++)
            {
                idStackView.pop(arguments[nCnt])
            }
        }
        else
        {
            if(idStackView.depth > 1)
            {
                idStackView.pop()
            }
        }
    }
}
