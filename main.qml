import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15
import QtQuick.Window 2.12

import com.zikime.updatemanager 1.0
import com.zikime.gpsmanager 1.0

ApplicationWindow {
    id: idWindow
    width: 960
    height: 640
    visible: true
    title: qsTr("ZIKIME")

    Material.theme: Material.Light
    Material.accent: Material.Blue

    property int deviceId: 0
    property string serial: ''
    property string gpsInfo: ''
    property string cameraInfo: ''
    property int stateId: 0

    property string latitude: ''
    property string longitude: ''
    property string altitude: ''
    property bool power: false
    property string mode: ''
    property string ipAddress: ''
    property string updateDate: ''
    
    property UpdateManager updateManager: UpdateManager{}
    property GPSManager gpsManager: GPSManager{}

    property double current_latitude: 0.0
    property double current_longitude: 0.0
    
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
                    MouseArea {
                        anchors.fill: parent
                        onClicked: pushView("WifiList.qml")
                        //onClicked: idWindow.get_device_info("10000000a6f28908")
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
                            idWindow.regist()
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
                    MouseArea {
                        anchors.fill: parent
                        onClicked: idWindow.updateManager.send_sos()
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
                id: idRegistText
                Layout.alignment: Qt.AlignHCenter
                text: ""
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
    
    function getDeviceInfo(serial)
    {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "http://localhost:9999/device/" + serial)
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var json = xhr.responseText

                var jsonObject = JSON.parse(json)
                idWindow.deviceId = jsonObject["id"]
                idWindow.serial = jsonObject["serial"]
                idWindow.gpsInfo = jsonObject["gps_info"]
                idWindow.cameraInfo = jsonObject["camera_info"]
                idWindow.stateId = jsonObject["state_id"]
            }
        }
        xhr.send()
    }

    function recvState(stateId)
    {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "http://www.zikime.com:9999/state/" + stateId, true)
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var json = xhr.responseText

                var jsonObject = JSON.parse(json)

                idWindow.latitude = jsonObject["latitude"]
                idWindow.longitude = jsonObject["longitude"]
                idWindow.altitude = jsonObject["altitude"]
                idWindow.power = jsonObject["power"]
                idWindow.mode = jsonObject["mode"]
                idWindow.ipAddress = jsonObject["ip_address"]
                idWindow.updateDate = jsonObject["update_date"]
            }
        }
        xhr.send()
    }

    function updateState(stateId)
    {
        var xhr = new XMLHttpRequest;
        xhr.open("PUT", "http://www.zikime.com:9999/state/" + idWindow.stateId, true)
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var json = xhr.responseText
                var jsonObject = JSON.parse(json)

                console.log(json)
            }
        }

        var body_data = {
            "latitude": idWindow.current_latitude.toString(),
            "longitude": idWindow.current_longitude.toString(),
            "altitude": "42.1326",
            "power": true,
            "ip_address": "192.168.0.1",
            "mode": "NORMAL"
        };

        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(JSON.stringify(body_data))
    }

    Timer {
        id: idTimer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            gpsManager.update_gps()
            idWindow.current_latitude = gpsManager.latitude
            idWindow.current_longitude = gpsManager.longitude

            idWindow.getDeviceInfo("10000000a6f28908")
            idWindow.updateState(idWindow.deviceId)
        }
    }
}