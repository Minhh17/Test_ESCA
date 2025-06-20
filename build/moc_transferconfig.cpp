/****************************************************************************
** Meta object code from reading C++ file 'transferconfig.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/transferlearning/transferconfig.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'transferconfig.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_TransferConfig_t {
    QByteArrayData data[20];
    char stringdata0[276];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_TransferConfig_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_TransferConfig_t qt_meta_stringdata_TransferConfig = {
    {
QT_MOC_LITERAL(0, 0, 14), // "TransferConfig"
QT_MOC_LITERAL(1, 15, 21), // "baseWeightPathChanged"
QT_MOC_LITERAL(2, 37, 0), // ""
QT_MOC_LITERAL(3, 38, 23), // "tfrecordUsedPathChanged"
QT_MOC_LITERAL(4, 62, 22), // "tfrecordNewPathChanged"
QT_MOC_LITERAL(5, 85, 15), // "savePathChanged"
QT_MOC_LITERAL(6, 101, 16), // "batchSizeChanged"
QT_MOC_LITERAL(7, 118, 19), // "learningRateChanged"
QT_MOC_LITERAL(8, 138, 12), // "epochChanged"
QT_MOC_LITERAL(9, 151, 11), // "betaChanged"
QT_MOC_LITERAL(10, 163, 10), // "saveConfig"
QT_MOC_LITERAL(11, 174, 10), // "loadConfig"
QT_MOC_LITERAL(12, 185, 14), // "baseWeightPath"
QT_MOC_LITERAL(13, 200, 16), // "tfrecordUsedPath"
QT_MOC_LITERAL(14, 217, 15), // "tfrecordNewPath"
QT_MOC_LITERAL(15, 233, 8), // "savePath"
QT_MOC_LITERAL(16, 242, 9), // "batchSize"
QT_MOC_LITERAL(17, 252, 12), // "learningRate"
QT_MOC_LITERAL(18, 265, 5), // "epoch"
QT_MOC_LITERAL(19, 271, 4) // "beta"

    },
    "TransferConfig\0baseWeightPathChanged\0"
    "\0tfrecordUsedPathChanged\0"
    "tfrecordNewPathChanged\0savePathChanged\0"
    "batchSizeChanged\0learningRateChanged\0"
    "epochChanged\0betaChanged\0saveConfig\0"
    "loadConfig\0baseWeightPath\0tfrecordUsedPath\0"
    "tfrecordNewPath\0savePath\0batchSize\0"
    "learningRate\0epoch\0beta"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TransferConfig[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       8,   74, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       8,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   64,    2, 0x06 /* Public */,
       3,    0,   65,    2, 0x06 /* Public */,
       4,    0,   66,    2, 0x06 /* Public */,
       5,    0,   67,    2, 0x06 /* Public */,
       6,    0,   68,    2, 0x06 /* Public */,
       7,    0,   69,    2, 0x06 /* Public */,
       8,    0,   70,    2, 0x06 /* Public */,
       9,    0,   71,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
      10,    0,   72,    2, 0x02 /* Public */,
      11,    0,   73,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Bool,
    QMetaType::Bool,

 // properties: name, type, flags
      12, QMetaType::QString, 0x00495103,
      13, QMetaType::QString, 0x00495103,
      14, QMetaType::QString, 0x00495103,
      15, QMetaType::QString, 0x00495103,
      16, QMetaType::Int, 0x00495103,
      17, QMetaType::Double, 0x00495103,
      18, QMetaType::Int, 0x00495103,
      19, QMetaType::Double, 0x00495103,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,
       6,
       7,

       0        // eod
};

void TransferConfig::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<TransferConfig *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->baseWeightPathChanged(); break;
        case 1: _t->tfrecordUsedPathChanged(); break;
        case 2: _t->tfrecordNewPathChanged(); break;
        case 3: _t->savePathChanged(); break;
        case 4: _t->batchSizeChanged(); break;
        case 5: _t->learningRateChanged(); break;
        case 6: _t->epochChanged(); break;
        case 7: _t->betaChanged(); break;
        case 8: { bool _r = _t->saveConfig();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 9: { bool _r = _t->loadConfig();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (TransferConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferConfig::baseWeightPathChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (TransferConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferConfig::tfrecordUsedPathChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (TransferConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferConfig::tfrecordNewPathChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (TransferConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferConfig::savePathChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (TransferConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferConfig::batchSizeChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (TransferConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferConfig::learningRateChanged)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (TransferConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferConfig::epochChanged)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (TransferConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferConfig::betaChanged)) {
                *result = 7;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<TransferConfig *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->baseWeightPath(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->tfrecordUsedPath(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->tfrecordNewPath(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->savePath(); break;
        case 4: *reinterpret_cast< int*>(_v) = _t->batchSize(); break;
        case 5: *reinterpret_cast< double*>(_v) = _t->learningRate(); break;
        case 6: *reinterpret_cast< int*>(_v) = _t->epoch(); break;
        case 7: *reinterpret_cast< double*>(_v) = _t->beta(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<TransferConfig *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setBaseWeightPath(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setTfrecordUsedPath(*reinterpret_cast< QString*>(_v)); break;
        case 2: _t->setTfrecordNewPath(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setSavePath(*reinterpret_cast< QString*>(_v)); break;
        case 4: _t->setBatchSize(*reinterpret_cast< int*>(_v)); break;
        case 5: _t->setLearningRate(*reinterpret_cast< double*>(_v)); break;
        case 6: _t->setEpoch(*reinterpret_cast< int*>(_v)); break;
        case 7: _t->setBeta(*reinterpret_cast< double*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject TransferConfig::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_TransferConfig.data,
    qt_meta_data_TransferConfig,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *TransferConfig::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TransferConfig::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_TransferConfig.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int TransferConfig::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 10)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 10;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 8;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 8;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 8;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 8;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 8;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void TransferConfig::baseWeightPathChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void TransferConfig::tfrecordUsedPathChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void TransferConfig::tfrecordNewPathChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void TransferConfig::savePathChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void TransferConfig::batchSizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void TransferConfig::learningRateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void TransferConfig::epochChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void TransferConfig::betaChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
