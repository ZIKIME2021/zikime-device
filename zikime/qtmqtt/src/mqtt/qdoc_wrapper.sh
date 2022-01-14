#!/bin/sh
QT_VERSION=5.12.8
export QT_VERSION
QT_VER=5.12
export QT_VER
QT_VERSION_TAG=5128
export QT_VERSION_TAG
QT_INSTALL_DOCS=/usr/share/qt5/doc
export QT_INSTALL_DOCS
BUILDDIR=/home/pi/qtmqtt/src/mqtt
export BUILDDIR
exec /usr/lib/qt5/bin/qdoc "$@"
