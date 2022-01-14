#!/bin/sh
QT_VERSION=5.15.2
export QT_VERSION
QT_VER=5.15
export QT_VER
QT_VERSION_TAG=5152
export QT_VERSION_TAG
QT_INSTALL_DOCS=C:/Qt/Docs/Qt-5.15.2
export QT_INSTALL_DOCS
BUILDDIR=D:/gitclone/zikime-device/zikime/build-qtmqtt-Desktop_Qt_5_15_2_MinGW_64_bit-Debug/src/mqtt
export BUILDDIR
exec 'C:\Qt\5.15.2\mingw81_64\bin\qdoc.exe' "$@"
