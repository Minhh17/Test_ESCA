/****************************************************************************
** Meta object code from reading C++ file 'transfercontroller.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/transferlearning/transfercontroller.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'transfercontroller.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_TransferController_t {
    QByteArrayData data[16];
    char stringdata0[185];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_TransferController_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_TransferController_t qt_meta_stringdata_TransferController = {
    {
QT_MOC_LITERAL(0, 0, 18), // "TransferController"
QT_MOC_LITERAL(1, 19, 15), // "tlStatusChanged"
QT_MOC_LITERAL(2, 35, 0), // ""
QT_MOC_LITERAL(3, 36, 12), // "epochChanged"
QT_MOC_LITERAL(4, 49, 17), // "totalEpochChanged"
QT_MOC_LITERAL(5, 67, 14), // "logTextChanged"
QT_MOC_LITERAL(6, 82, 19), // "updateEpochProgress"
QT_MOC_LITERAL(7, 102, 12), // "currentEpoch"
QT_MOC_LITERAL(8, 115, 10), // "totalEpoch"
QT_MOC_LITERAL(9, 126, 16), // "updateLogSummary"
QT_MOC_LITERAL(10, 143, 7), // "summary"
QT_MOC_LITERAL(11, 151, 5), // "start"
QT_MOC_LITERAL(12, 157, 4), // "stop"
QT_MOC_LITERAL(13, 162, 8), // "tlStatus"
QT_MOC_LITERAL(14, 171, 5), // "epoch"
QT_MOC_LITERAL(15, 177, 7) // "logText"

    },
    "TransferController\0tlStatusChanged\0\0"
    "epochChanged\0totalEpochChanged\0"
    "logTextChanged\0updateEpochProgress\0"
    "currentEpoch\0totalEpoch\0updateLogSummary\0"
    "summary\0start\0stop\0tlStatus\0epoch\0"
    "logText"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TransferController[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       4,   68, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   54,    2, 0x06 /* Public */,
       3,    0,   55,    2, 0x06 /* Public */,
       4,    0,   56,    2, 0x06 /* Public */,
       5,    0,   57,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       6,    2,   58,    2, 0x0a /* Public */,
       9,    1,   63,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
      11,    0,   66,    2, 0x02 /* Public */,
      12,    0,   67,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::Int, QMetaType::Int,    7,    8,
    QMetaType::Void, QMetaType::QString,   10,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
      13, QMetaType::Bool, 0x00495903,
      14, QMetaType::Int, 0x00495103,
       8, QMetaType::Int, 0x00495103,
      15, QMetaType::QString, 0x00495103,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,

       0        // eod
};

void TransferController::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<TransferController *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->tlStatusChanged(); break;
        case 1: _t->epochChanged(); break;
        case 2: _t->totalEpochChanged(); break;
        case 3: _t->logTextChanged(); break;
        case 4: _t->updateEpochProgress((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 5: _t->updateLogSummary((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 6: _t->start(); break;
        case 7: _t->stop(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (TransferController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferController::tlStatusChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (TransferController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferController::epochChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (TransferController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferController::totalEpochChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (TransferController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferController::logTextChanged)) {
                *result = 3;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<TransferController *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = _t->tlStatus(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->epoch(); break;
        case 2: *reinterpret_cast< int*>(_v) = _t->totalEpoch(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->logText(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<TransferController *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setTlStatus(*reinterpret_cast< bool*>(_v)); break;
        case 1: _t->setEpoch(*reinterpret_cast< int*>(_v)); break;
        case 2: _t->setTotalEpoch(*reinterpret_cast< int*>(_v)); break;
        case 3: _t->setLogText(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject TransferController::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_TransferController.data,
    qt_meta_data_TransferController,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *TransferController::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TransferController::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_TransferController.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int TransferController::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 8;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void TransferController::tlStatusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void TransferController::epochChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void TransferController::totalEpochChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void TransferController::logTextChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
