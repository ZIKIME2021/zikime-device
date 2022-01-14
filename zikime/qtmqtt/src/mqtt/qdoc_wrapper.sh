#!/bin/sh
QT_VERSION=5.12.8
export QT_VERSION
QT_VER=5.12
export QT_VER
QT_VERSION_TAG=5128
export QT_VERSION_TAG
QT_INSTALL_DOCS=C:/Qt/Docs/Qt-5.15.2
export QT_INSTALL_DOCS
BUILDDIR=D:/gitclone/zikime-device/zikime/qtmqtt/src/mqtt
export BUILDDIR
exec 'C:\Qt\5.15.2\mingw81_64\bin\qdoc.exe' "$@"
