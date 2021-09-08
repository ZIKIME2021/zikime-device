import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Window 2.4
import QtQuick.Layouts 1.0

import CmdLauncher 1.0

ApplicationWindow {
    id: idWindow
    width: 720
    height: 480
    visible: true
    title: qsTr("지키ME")
	visibility: "FullScreen"
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
                        interval: 1000
                        running: false
                        repeat: true
                        onTriggered: {
                            if(!idAutoDecline.remaining)
                            {
                                idPopup.close()
                                //idAutoDecline.remainTime = 10
                            }
                            else
                                idAutoDecline.remainTime -= 1
                        }
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
                        text: "A streaming request has arrived from your guardian"
                        font.pixelSize: 20
                        font.bold: true
                    }
                    Text {
                        id: idAutoDecline
                        Layout.alignment: Qt.AlignHCenter
                        text: remainTime.toFixed(0) + "초 후에 자동으로 수락됩니다."
                        font.pixelSize: 20

                        property int remainTime: 10
                        property bool remaining: remainTime > 0 ? true : false
                    }

                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 150
                        Button {
                            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
                            text: "   Accept   "
                            font.pixelSize: 14

                            onClicked: {
                                idPopup.close()
                                idReqTimer.stop()
                                idCmdLauncher.setProgram("mousepad")
                                idCmdLauncher.setArgs("test.txt")
                                idCmdLauncher.start()
                            }
                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                radius: 2
                                color: idAutoDecline.remaining ? "#EEEEEE" : "#81D4FA"
                            }
                        }
                        Button {
                            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
                            text: "   Decline   "
                            font.pixelSize: 14
                            onClicked: {
                                idPopup.close()
                                idReqTimer.stop()
                            }
                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                radius: 2
                                color: idAutoDecline.remaining ? "#81D4FA" : "#EEEEEE"
                            }
                        }
                    }
                }
            }
        }
    }

    Timer {
        id: idReqTimer
        interval: 6000
        running: true
        repeat: true
        onTriggered: refresh()
    }

    Component.onCompleted: {
        idReqTimer.start()
    }

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
                    idReqTimer.stop();
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
