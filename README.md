# device_application

### 1. Introduction
ZIMIKE 서비스를 사용하는 피보호자가 지니고 다닐 디바이스에 적용될 애플리케이션

![zikime_device](https://user-images.githubusercontent.com/14028864/132512455-bebfe749-5a74-4351-bc92-f353815c4162.gif)
### 2. Requirements
```
$ sudo apt-get update
```

```
$ sudo apt-get install qt5-default qtbase5-dev qtdeclarative5-dev qt5-qmake qtcreator libqt5gui5  qtscript5-dev qtmultimedia5-dev libqt5multimedia5-plugins qtquickcontrols2-5-dev libqt5network5 cmake build-essential 
```

QTQuick.Controls version 2.12 is not found 에러 발생 시
```
sudo apt install qml-module-qtquick-controls2
```

# arduino.py
### 1. Introduction
ZIKIME 디바이스 프로토타입 모듈 추가를 위해 arduino nano 보드 사용

### 2. Requirements
- Upload arduino sketch example code [Firmata]-[StandardFirmata]

```
$ sudo apt-get update
```

```
$ sudo apt-get install python-serial
$ sudo apt-get install git
$ git clone https://github.com/tino/pyFirmata.git
$ cd pyFirmata
$ sudo python setup.py install
```
or
```
$ pip3 install pyfirmata
```