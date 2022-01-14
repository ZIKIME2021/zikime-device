#!/bin/sh
PATH=/D/gitclone/zikime-device/zikime/qtmqtt/bin:/C/Qt/5.15.2/mingw81_64/bin:$PATH
export PATH
QT_PLUGIN_PATH=/C/Qt/5.15.2/mingw81_64/plugins${QT_PLUGIN_PATH:+:$QT_PLUGIN_PATH}
export QT_PLUGIN_PATH
exec "$@"
