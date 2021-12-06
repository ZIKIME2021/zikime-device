import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15
import QtQuick.Window 2.12

ApplicationWindow {
    id: idWindow
    width: 960
    height: 640
    visible: true
    title: qsTr("ZIKIME")

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
                        source: "./res/wifi.png"
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
                    id: idVideoList
                    Layout.preferredHeight: 200
                    Layout.fillWidth: true
                    Image {
                        anchors.fill: parent
                        source: "./res/regist.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            idPopup.open()
                            //idWindow.regist()
                        }
                    }
                }
                Item {
                    id: idSos
                    Layout.preferredHeight: 200
                    Layout.fillWidth: true
                    Image {
                        anchors.fill: parent
                        source: "./res/sos.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
                Item {
                    id: idSettings
                    Layout.preferredHeight: 200
                    Layout.fillWidth: true
                    Image {
                        anchors.fill: parent
                        source: "./res/settings.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: pushView("Settings.qml")
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

            ColumnLayout {
                anchors.fill: parent
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "Regist Number"
                font.family: "Arial"
                font.pixelSize: 24
                font.bold: true
            }
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "1234"
                font.family: "Arial"
                font.pixelSize: 20
                font.bold: true
            }
            }
            Button {
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                text: "close"
                onClicked: {
                    idPopup.close()
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

    function regist()
    {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "http://www.zikime.com:9999/device/1")
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var json = xhr.responseText

                var jsonObject = JSON.parse(json)
                console.log(jsonObject.id)
            }
        }
        xhr.send()
    }
}