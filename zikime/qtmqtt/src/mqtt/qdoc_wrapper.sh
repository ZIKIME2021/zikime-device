#!/bin/sh
QT_VERSION=5.15.2
export QT_VERSION
QT_VER=5.15
export QT_VER
QT_VERSION_TAG=5152
export QT_VERSION_TAG
QT_INSTALL_DOCS=/usr/share/qt5/doc
export QT_INSTALL_DOCS
<<<<<<< HEAD
BUILDDIR=/home/pi/qtmqtt/src/mqtt
=======
BUILDDIR=/mnt/d/gitclone/zikime-device/zikime/qtmqtt/src/mqtt
>>>>>>> 26df9891d7ee4d57ff638aa2eaa489a2b603f219
export BUILDDIR
exec /usr/lib/qt5/bin/qdoc "$@"
