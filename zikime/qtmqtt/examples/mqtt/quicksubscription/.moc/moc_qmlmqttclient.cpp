/****************************************************************************
** Meta object code from reading C++ file 'qmlmqttclient.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qmlmqttclient.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'qmlmqttclient.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_QmlMqttSubscription_t {
    QByteArrayData data[10];
    char stringdata0[109];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_QmlMqttSubscription_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_QmlMqttSubscription_t qt_meta_stringdata_QmlMqttSubscription = {
    {
QT_MOC_LITERAL(0, 0, 19), // "QmlMqttSubscription"
QT_MOC_LITERAL(1, 20, 12), // "topicChanged"
QT_MOC_LITERAL(2, 33, 0), // ""
QT_MOC_LITERAL(3, 34, 15), // "messageReceived"
QT_MOC_LITERAL(4, 50, 3), // "msg"
QT_MOC_LITERAL(5, 54, 13), // "handleMessage"
QT_MOC_LITERAL(6, 68, 12), // "QMqttMessage"
QT_MOC_LITERAL(7, 81, 4), // "qmsg"
QT_MOC_LITERAL(8, 86, 5), // "topic"
QT_MOC_LITERAL(9, 92, 16) // "QMqttTopicFilter"

    },
    "QmlMqttSubscription\0topicChanged\0\0"
    "messageReceived\0msg\0handleMessage\0"
    "QMqttMessage\0qmsg\0topic\0QMqttTopicFilter"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_QmlMqttSubscription[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       1,   38, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   29,    2, 0x06 /* Public */,
       3,    1,   32,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       5,    1,   35,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, QMetaType::QString,    4,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 6,    7,

 // properties: name, type, flags
       8, 0x80000000 | 9, 0x0049500b,

 // properties: notify_signal_id
       0,

       0        // eod
};

void QmlMqttSubscription::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<QmlMqttSubscription *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->topicChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->messageReceived((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->handleMessage((*reinterpret_cast< const QMqttMessage(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 2:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QMqttMessage >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (QmlMqttSubscription::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMqttSubscription::topicChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (QmlMqttSubscription::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMqttSubscription::messageReceived)) {
                *result = 1;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QMqttTopicFilter >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<QmlMqttSubscription *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QMqttTopicFilter*>(_v) = _t->m_topic; break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<QmlMqttSubscription *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (_t->m_topic != *reinterpret_cast< QMqttTopicFilter*>(_v)) {
                _t->m_topic = *reinterpret_cast< QMqttTopicFilter*>(_v);
            }
            break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject QmlMqttSubscription::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_QmlMqttSubscription.data,
    qt_meta_data_QmlMqttSubscription,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *QmlMqttSubscription::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QmlMqttSubscription::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_QmlMqttSubscription.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int QmlMqttSubscription::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void QmlMqttSubscription::topicChanged(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void QmlMqttSubscription::messageReceived(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
struct qt_meta_stringdata_QmlMqttClient_t {
    QByteArrayData data[5];
    char stringdata0[52];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_QmlMqttClient_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_QmlMqttClient_t qt_meta_stringdata_QmlMqttClient = {
    {
QT_MOC_LITERAL(0, 0, 13), // "QmlMqttClient"
QT_MOC_LITERAL(1, 14, 9), // "subscribe"
QT_MOC_LITERAL(2, 24, 20), // "QmlMqttSubscription*"
QT_MOC_LITERAL(3, 45, 0), // ""
QT_MOC_LITERAL(4, 46, 5) // "topic"

    },
    "QmlMqttClient\0subscribe\0QmlMqttSubscription*\0"
    "\0topic"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_QmlMqttClient[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    1,   19,    3, 0x02 /* Public */,

 // methods: parameters
    0x80000000 | 2, QMetaType::QString,    4,

       0        // eod
};

void QmlMqttClient::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<QmlMqttClient *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QmlMqttSubscription* _r = _t->subscribe((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QmlMqttSubscription**>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject QmlMqttClient::staticMetaObject = { {
    QMetaObject::SuperData::link<QMqttClient::staticMetaObject>(),
    qt_meta_stringdata_QmlMqttClient.data,
    qt_meta_data_QmlMqttClient,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *QmlMqttClient::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QmlMqttClient::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_QmlMqttClient.stringdata0))
        return static_cast<void*>(this);
    return QMqttClient::qt_metacast(_clname);
}

int QmlMqttClient::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMqttClient::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 1;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
