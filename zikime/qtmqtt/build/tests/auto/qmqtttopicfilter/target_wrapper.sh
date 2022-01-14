#!/bin/sh
PATH=/D/gitclone/zikime-device/zikime/build-qtmqtt-Desktop_Qt_5_15_2_MinGW_64_bit-Debug/bin:/C/Qt/5.15.2/mingw81_64/bin:$PATH
export PATH
QT_PLUGIN_PATH=/C/Qt/5.15.2/mingw81_64/plugins${QT_PLUGIN_PATH:+:$QT_PLUGIN_PATH}
export QT_PLUGIN_PATH
exec "$@"
