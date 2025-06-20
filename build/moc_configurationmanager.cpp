/****************************************************************************
** Meta object code from reading C++ file 'configurationmanager.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/aiprocess/configurationmanager.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'configurationmanager.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ConfigurationManager_t {
    QByteArrayData data[24];
    char stringdata0[326];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ConfigurationManager_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ConfigurationManager_t qt_meta_stringdata_ConfigurationManager = {
    {
QT_MOC_LITERAL(0, 0, 20), // "ConfigurationManager"
QT_MOC_LITERAL(1, 21, 14), // "logPathChanged"
QT_MOC_LITERAL(2, 36, 0), // ""
QT_MOC_LITERAL(3, 37, 22), // "manualThresholdChanged"
QT_MOC_LITERAL(4, 60, 13), // "secondChanged"
QT_MOC_LITERAL(5, 74, 15), // "channelsChanged"
QT_MOC_LITERAL(6, 90, 19), // "samplingRateChanged"
QT_MOC_LITERAL(7, 110, 17), // "importFileChanged"
QT_MOC_LITERAL(8, 128, 16), // "modelPathChanged"
QT_MOC_LITERAL(9, 145, 16), // "thresholdChanged"
QT_MOC_LITERAL(10, 162, 17), // "folderPathChanged"
QT_MOC_LITERAL(11, 180, 17), // "sampleSizeChanged"
QT_MOC_LITERAL(12, 198, 10), // "loadConfig"
QT_MOC_LITERAL(13, 209, 10), // "saveConfig"
QT_MOC_LITERAL(14, 220, 7), // "logPath"
QT_MOC_LITERAL(15, 228, 15), // "manualThreshold"
QT_MOC_LITERAL(16, 244, 10), // "sampleSize"
QT_MOC_LITERAL(17, 255, 6), // "second"
QT_MOC_LITERAL(18, 262, 8), // "channels"
QT_MOC_LITERAL(19, 271, 12), // "samplingRate"
QT_MOC_LITERAL(20, 284, 10), // "importFile"
QT_MOC_LITERAL(21, 295, 9), // "modelPath"
QT_MOC_LITERAL(22, 305, 9), // "threshold"
QT_MOC_LITERAL(23, 315, 10) // "folderPath"

    },
    "ConfigurationManager\0logPathChanged\0"
    "\0manualThresholdChanged\0secondChanged\0"
    "channelsChanged\0samplingRateChanged\0"
    "importFileChanged\0modelPathChanged\0"
    "thresholdChanged\0folderPathChanged\0"
    "sampleSizeChanged\0loadConfig\0saveConfig\0"
    "logPath\0manualThreshold\0sampleSize\0"
    "second\0channels\0samplingRate\0importFile\0"
    "modelPath\0threshold\0folderPath"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ConfigurationManager[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
      10,   86, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      10,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   74,    2, 0x06 /* Public */,
       3,    0,   75,    2, 0x06 /* Public */,
       4,    0,   76,    2, 0x06 /* Public */,
       5,    0,   77,    2, 0x06 /* Public */,
       6,    0,   78,    2, 0x06 /* Public */,
       7,    0,   79,    2, 0x06 /* Public */,
       8,    0,   80,    2, 0x06 /* Public */,
       9,    0,   81,    2, 0x06 /* Public */,
      10,    0,   82,    2, 0x06 /* Public */,
      11,    0,   83,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
      12,    0,   84,    2, 0x02 /* Public */,
      13,    0,   85,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
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
      14, QMetaType::QString, 0x00495103,
      15, QMetaType::Double, 0x00495103,
      16, QMetaType::Int, 0x00495103,
      17, QMetaType::Int, 0x00495103,
      18, QMetaType::Int, 0x00495103,
      19, QMetaType::Int, 0x00495103,
      20, QMetaType::Bool, 0x00495103,
      21, QMetaType::QString, 0x00495903,
      22, QMetaType::Double, 0x00495903,
      23, QMetaType::QString, 0x00495903,

 // properties: notify_signal_id
       0,
       1,
       9,
       2,
       3,
       4,
       5,
       6,
       7,
       8,

       0        // eod
};

void ConfigurationManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ConfigurationManager *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->logPathChanged(); break;
        case 1: _t->manualThresholdChanged(); break;
        case 2: _t->secondChanged(); break;
        case 3: _t->channelsChanged(); break;
        case 4: _t->samplingRateChanged(); break;
        case 5: _t->importFileChanged(); break;
        case 6: _t->modelPathChanged(); break;
        case 7: _t->thresholdChanged(); break;
        case 8: _t->folderPathChanged(); break;
        case 9: _t->sampleSizeChanged(); break;
        case 10: { bool _r = _t->loadConfig();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 11: { bool _r = _t->saveConfig();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ConfigurationManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConfigurationManager::logPathChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (ConfigurationManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConfigurationManager::manualThresholdChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (ConfigurationManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConfigurationManager::secondChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (ConfigurationManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConfigurationManager::channelsChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (ConfigurationManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConfigurationManager::samplingRateChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (ConfigurationManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConfigurationManager::importFileChanged)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (ConfigurationManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConfigurationManager::modelPathChanged)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (ConfigurationManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConfigurationManager::thresholdChanged)) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (ConfigurationManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConfigurationManager::folderPathChanged)) {
                *result = 8;
                return;
            }
        }
        {
            using _t = void (ConfigurationManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConfigurationManager::sampleSizeChanged)) {
                *result = 9;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<ConfigurationManager *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->logPath(); break;
        case 1: *reinterpret_cast< double*>(_v) = _t->manualThreshold(); break;
        case 2: *reinterpret_cast< int*>(_v) = _t->sampleSize(); break;
        case 3: *reinterpret_cast< int*>(_v) = _t->second(); break;
        case 4: *reinterpret_cast< int*>(_v) = _t->channels(); break;
        case 5: *reinterpret_cast< int*>(_v) = _t->samplingRate(); break;
        case 6: *reinterpret_cast< bool*>(_v) = _t->importFile(); break;
        case 7: *reinterpret_cast< QString*>(_v) = _t->modelPath(); break;
        case 8: *reinterpret_cast< double*>(_v) = _t->threshold(); break;
        case 9: *reinterpret_cast< QString*>(_v) = _t->folderPath(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<ConfigurationManager *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setLogPath(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setManualThreshold(*reinterpret_cast< double*>(_v)); break;
        case 2: _t->setSampleSize(*reinterpret_cast< int*>(_v)); break;
        case 3: _t->setSecond(*reinterpret_cast< int*>(_v)); break;
        case 4: _t->setChannels(*reinterpret_cast< int*>(_v)); break;
        case 5: _t->setSamplingRate(*reinterpret_cast< int*>(_v)); break;
        case 6: _t->setImportFile(*reinterpret_cast< bool*>(_v)); break;
        case 7: _t->setModelPath(*reinterpret_cast< QString*>(_v)); break;
        case 8: _t->setThreshold(*reinterpret_cast< double*>(_v)); break;
        case 9: _t->setFolderPath(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject ConfigurationManager::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ConfigurationManager.data,
    qt_meta_data_ConfigurationManager,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ConfigurationManager::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ConfigurationManager::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ConfigurationManager.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ConfigurationManager::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 12)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 12;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 10;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void ConfigurationManager::logPathChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void ConfigurationManager::manualThresholdChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void ConfigurationManager::secondChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void ConfigurationManager::channelsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void ConfigurationManager::samplingRateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void ConfigurationManager::importFileChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void ConfigurationManager::modelPathChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void ConfigurationManager::thresholdChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void ConfigurationManager::folderPathChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void ConfigurationManager::sampleSizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
