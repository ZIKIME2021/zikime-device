import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15
import QtQuick.Window 2.12

import MqttClient 1.0
import Firmata 1.0

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

    property string latitude: '0.0'
    property string longitude: '0.0'
    property string altitude: '0.0'
    property bool power: true
    property string mode: "NORMAL"
    property string ipAddress: "127.0.0.1"
    property string updateDate: ''

    property bool registered: false
    property bool validSerial: true

    property double currentLatitude: 0.0
    property double currentLongitude: 0.0

    property int registerNumber: 0
    property var emailList: []

    property bool sosCheck: false

    Component.onCompleted: {
        serial = DeviceManager.getSerial()
        gpsInfo = DeviceManager.getGPSInfo()
        cameraInfo = DeviceManager.getCameraInfo()
        registered = isRegistered(serial)
        console.log("serial: " + idWindow.serial)
    }

    Component.onDestruction: {
        console.log("Disconnected!!")
        console.log(idMqttClient.hostname)
        idMqttClient.publish("device/connect", "Disconnect")
        idMqttClient.disconnectFromHost();
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
                    visible: idWindow.registered ? true : false

                    Layout.preferredHeight: 200
                    Layout.fillWidth: true

                    Image {
                        anchors.fill: parent
                        source: "../images/wifi.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: pushView("WifiList.qml")
                    }
                }
                Item {
                    id: idSos
                    visible: idWindow.registered ? true : false

                    Layout.preferredHeight: 200
                    Layout.fillWidth: true
                    Image {
                        anchors.fill: parent
                        source: "../images/sos.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    Item {
                        Rectangle{
                            anchors.fill: parent
                            opacity: 0.4
                            color: "black"
                        }
                        BusyIndicator {
                            id: idSosIndicator
                            running: false
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            idWindow.mode = "EMERGENCY"
                            idSosPopup.open()
                            sosCheck = true
                            //DeviceManager.sendSOS()
                        }
                    }
                }
                Item {
                    id: idRegist
                    visible: !idWindow.registered ? true : false

                    Layout.preferredHeight: 200
                    Layout.fillWidth: true
                    Image {
                        anchors.fill: parent
                        source: "../images/regist.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            idWindow.isValidSerial(idWindow.serial)
                            idWindow.getRegisterNumber(idWindow.serial)
                            //idMqttClient.publish("device/register", "")
                            idRegisterPopup.open()
                        }
                    }
                }
                Item {
                    id: idSettings
                    visible: idWindow.registered ? true : false

                    Layout.preferredHeight: 200
                    Layout.fillWidth: true
                    Image {
                        anchors.fill: parent
                        source: "../images/settings.png"
                        fillMode: Image.PreserveAspectFit
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: pushView("Settings.qml")
                    }
                }

                Firmata {
                    backend: SerialFirmata {
                        device: SERIAL_PORT
                    }
                    DigitalPin {
                        id: idLedPin
                        output: true
                        pin: 8
                        value: sosCheck ? 1 : 0
                    }
                    DigitalPin {
                        id: idVibratorPin
                        output: true
                        pin: 9
                        value: sosCheck ? 200 : 0
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
            id: idRegisterPopup
            width: parent.width
            height: parent.height
            modal: true
            focus: true

            ColumnLayout {
                anchors.fill: parent
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: idWindow.validSerial ? "Regist Number" : "유효하지 않는 기기입니다."
                    font.family: "Arial"
                    font.pixelSize: 24
                    font.bold: true
                }
                Text {
                    id: idRegisterText
                    Layout.alignment: Qt.AlignHCenter
                    text: idWindow.registerNumber
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
                    idRegisterPopup.close()
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
            id: idSosPopup
            width: parent.width
            height: parent.height
            modal: true
            focus: true

            ColumnLayout {
                anchors.fill: parent
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "SOS 요청 중입니다."
                    font.family: "Arial"
                    font.pixelSize: 24
                    font.bold: true
                }
            }
            Button {
                //anchors.left: parent.left
                anchors.bottom: parent.bottom
                text: "close"
                onClicked: {
                    sosCheck = false
                    idSosPopup.close()
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

    function isRegistered(serial)
    {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", API_SERVER + "/device/" + serial, false)
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var json = xhr.responseText
                var jsonObject = JSON.parse(json)

                if(jsonObject)
                {
                    idWindow.deviceId = jsonObject["id"]
                    idWindow.gpsInfo = jsonObject["gps_info"]
                    idWindow.cameraInfo = jsonObject["camera_info"]
                }
            }
        }
        xhr.send()

        if(deviceId)
            return true;

        return false;
    }

    function isValidSerial(serial)
    {
        var create_at;
        var expire_at;

        var xhr = new XMLHttpRequest;
        xhr.open("GET", API_SERVER + "/serial/" + serial, false)
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var json = xhr.responseText
                var jsonObject = JSON.parse(json)

                if(jsonObject)
                {
                    create_at = new Date(jsonObject["create_at"])
                    expire_at = new Date(jsonObject["expire_at"])

                    if(expire_at - Date.now() < 0)
                        idWindow.validSerial = false
                }
                else
                    idWindow.validSerial = false;
            }
        }

        xhr.send()
    }

    MqttClient {
        id: idMqttClient
        clientId: "zikime-client"
        hostname: MQTT_SERVER
        port: MQTT_PORT
    }

    Connections {
        target: idMqttClient
        function onStateChanged(state)
        {
            console.log(state)
            if(state === MqttClient.Connected)
            {
                console.log("Connected!!")
                console.log(idMqttClient.hostname)
                idMqttClient.publish("device/connect", "Connect")
            }
        }
    }

    function getRegisterNumber(serial)
    {
        var xhr = new XMLHttpRequest;
        var params = "?serial=" + serial + "&gps_info=" + idWindow.gpsInfo + "&camera_info=" + idWindow.cameraInfo;
        xhr.open("GET", API_SERVER + "/device-management/key-generator" + params, false)

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                idWindow.registerNumber = Number(xhr.responseText)
            }
        }

        xhr.send()
    }

    function getMasterEmail(serial)
    {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", WEB_SERVER + "/sos?device_id=" + idWindow.serial, false)

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                idWindow.emailList = xhr.responseText
            }
        }

        xhr.send()
    }

    Timer {
        id: idTimer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            if(idMqttClient.state === MqttClient.Disconnected)
            {
                idMqttClient.connectToHost()
                idTimer.running = false
            }
        }
    }

    Timer {
        id: idSendState
        interval: 1000
        running: idWindow.registered
        repeat: true
        onTriggered: {

        }
    }
}
