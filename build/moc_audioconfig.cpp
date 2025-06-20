/****************************************************************************
** Meta object code from reading C++ file 'audioconfig.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/audiorecording/audioconfig.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'audioconfig.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_AudioConfig_t {
    QByteArrayData data[43];
    char stringdata0[627];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AudioConfig_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AudioConfig_t qt_meta_stringdata_AudioConfig = {
    {
QT_MOC_LITERAL(0, 0, 11), // "AudioConfig"
QT_MOC_LITERAL(1, 12, 17), // "listCodecsChanged"
QT_MOC_LITERAL(2, 30, 0), // ""
QT_MOC_LITERAL(3, 31, 21), // "listSampleRateChanged"
QT_MOC_LITERAL(4, 53, 18), // "listChannelChanged"
QT_MOC_LITERAL(5, 72, 18), // "listEndianzChanged"
QT_MOC_LITERAL(6, 91, 18), // "listDevicesChanged"
QT_MOC_LITERAL(7, 110, 21), // "listSampleSizeChanged"
QT_MOC_LITERAL(8, 132, 20), // "nearistParamsChanged"
QT_MOC_LITERAL(9, 153, 15), // "saveDoneChanged"
QT_MOC_LITERAL(10, 169, 19), // "listDurationChanged"
QT_MOC_LITERAL(11, 189, 17), // "listOutputChanged"
QT_MOC_LITERAL(12, 207, 24), // "listSampleRateStrChanged"
QT_MOC_LITERAL(13, 232, 21), // "listChannelStrChanged"
QT_MOC_LITERAL(14, 254, 21), // "listEndianzStrChanged"
QT_MOC_LITERAL(15, 276, 24), // "listSampleSizeStrChanged"
QT_MOC_LITERAL(16, 301, 12), // "changeDevice"
QT_MOC_LITERAL(17, 314, 3), // "idx"
QT_MOC_LITERAL(18, 318, 10), // "saveConfig"
QT_MOC_LITERAL(19, 329, 6), // "device"
QT_MOC_LITERAL(20, 336, 5), // "codec"
QT_MOC_LITERAL(21, 342, 10), // "sampleRate"
QT_MOC_LITERAL(22, 353, 7), // "channel"
QT_MOC_LITERAL(23, 361, 6), // "endian"
QT_MOC_LITERAL(24, 368, 10), // "sampleSize"
QT_MOC_LITERAL(25, 379, 8), // "duration"
QT_MOC_LITERAL(26, 388, 9), // "outputDir"
QT_MOC_LITERAL(27, 398, 11), // "listDevices"
QT_MOC_LITERAL(28, 410, 14), // "listSampleRate"
QT_MOC_LITERAL(29, 425, 10), // "QList<int>"
QT_MOC_LITERAL(30, 436, 17), // "listSampleRateStr"
QT_MOC_LITERAL(31, 454, 11), // "listChannel"
QT_MOC_LITERAL(32, 466, 14), // "listChannelStr"
QT_MOC_LITERAL(33, 481, 10), // "listCodecs"
QT_MOC_LITERAL(34, 492, 11), // "listEndianz"
QT_MOC_LITERAL(35, 504, 27), // "QList<QAudioFormat::Endian>"
QT_MOC_LITERAL(36, 532, 14), // "listEndianzStr"
QT_MOC_LITERAL(37, 547, 14), // "listSampleSize"
QT_MOC_LITERAL(38, 562, 17), // "listSampleSizeStr"
QT_MOC_LITERAL(39, 580, 12), // "listDuration"
QT_MOC_LITERAL(40, 593, 10), // "listOutput"
QT_MOC_LITERAL(41, 604, 13), // "nearistParams"
QT_MOC_LITERAL(42, 618, 8) // "saveDone"

    },
    "AudioConfig\0listCodecsChanged\0\0"
    "listSampleRateChanged\0listChannelChanged\0"
    "listEndianzChanged\0listDevicesChanged\0"
    "listSampleSizeChanged\0nearistParamsChanged\0"
    "saveDoneChanged\0listDurationChanged\0"
    "listOutputChanged\0listSampleRateStrChanged\0"
    "listChannelStrChanged\0listEndianzStrChanged\0"
    "listSampleSizeStrChanged\0changeDevice\0"
    "idx\0saveConfig\0device\0codec\0sampleRate\0"
    "channel\0endian\0sampleSize\0duration\0"
    "outputDir\0listDevices\0listSampleRate\0"
    "QList<int>\0listSampleRateStr\0listChannel\0"
    "listChannelStr\0listCodecs\0listEndianz\0"
    "QList<QAudioFormat::Endian>\0listEndianzStr\0"
    "listSampleSize\0listSampleSizeStr\0"
    "listDuration\0listOutput\0nearistParams\0"
    "saveDone"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AudioConfig[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      16,   14, // methods
      14,  128, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      14,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   94,    2, 0x06 /* Public */,
       3,    0,   95,    2, 0x06 /* Public */,
       4,    0,   96,    2, 0x06 /* Public */,
       5,    0,   97,    2, 0x06 /* Public */,
       6,    0,   98,    2, 0x06 /* Public */,
       7,    0,   99,    2, 0x06 /* Public */,
       8,    0,  100,    2, 0x06 /* Public */,
       9,    0,  101,    2, 0x06 /* Public */,
      10,    0,  102,    2, 0x06 /* Public */,
      11,    0,  103,    2, 0x06 /* Public */,
      12,    0,  104,    2, 0x06 /* Public */,
      13,    0,  105,    2, 0x06 /* Public */,
      14,    0,  106,    2, 0x06 /* Public */,
      15,    0,  107,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
      16,    1,  108,    2, 0x02 /* Public */,
      18,    8,  111,    2, 0x02 /* Public */,

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
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::Int,   17,
    QMetaType::Void, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::QString,   19,   20,   21,   22,   23,   24,   25,   26,

 // properties: name, type, flags
      27, QMetaType::QStringList, 0x00495903,
      28, 0x80000000 | 29, 0x0049590b,
      30, QMetaType::QStringList, 0x00495801,
      31, 0x80000000 | 29, 0x0049590b,
      32, QMetaType::QStringList, 0x00495801,
      33, QMetaType::QStringList, 0x00495903,
      34, 0x80000000 | 35, 0x0049590b,
      36, QMetaType::QStringList, 0x00495801,
      37, 0x80000000 | 29, 0x0049590b,
      38, QMetaType::QStringList, 0x00495801,
      39, QMetaType::QStringList, 0x00495801,
      40, QMetaType::QString, 0x00495903,
      41, 0x80000000 | 29, 0x00495809,
      42, QMetaType::Bool, 0x00495903,

 // properties: notify_signal_id
       4,
       1,
      10,
       2,
      11,
       0,
       3,
      12,
       5,
      13,
       8,
       9,
       6,
       7,

       0        // eod
};

void AudioConfig::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<AudioConfig *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->listCodecsChanged(); break;
        case 1: _t->listSampleRateChanged(); break;
        case 2: _t->listChannelChanged(); break;
        case 3: _t->listEndianzChanged(); break;
        case 4: _t->listDevicesChanged(); break;
        case 5: _t->listSampleSizeChanged(); break;
        case 6: _t->nearistParamsChanged(); break;
        case 7: _t->saveDoneChanged(); break;
        case 8: _t->listDurationChanged(); break;
        case 9: _t->listOutputChanged(); break;
        case 10: _t->listSampleRateStrChanged(); break;
        case 11: _t->listChannelStrChanged(); break;
        case 12: _t->listEndianzStrChanged(); break;
        case 13: _t->listSampleSizeStrChanged(); break;
        case 14: _t->changeDevice((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 15: _t->saveConfig((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< int(*)>(_a[5])),(*reinterpret_cast< int(*)>(_a[6])),(*reinterpret_cast< int(*)>(_a[7])),(*reinterpret_cast< QString(*)>(_a[8]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listCodecsChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listSampleRateChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listChannelChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listEndianzChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listDevicesChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listSampleSizeChanged)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::nearistParamsChanged)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::saveDoneChanged)) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listDurationChanged)) {
                *result = 8;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listOutputChanged)) {
                *result = 9;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listSampleRateStrChanged)) {
                *result = 10;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listChannelStrChanged)) {
                *result = 11;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listEndianzStrChanged)) {
                *result = 12;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listSampleSizeStrChanged)) {
                *result = 13;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 6:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QAudioFormat::Endian> >(); break;
        case 12:
        case 8:
        case 3:
        case 1:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<int> >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<AudioConfig *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QStringList*>(_v) = _t->listDevices(); break;
        case 1: *reinterpret_cast< QList<int>*>(_v) = _t->listSampleRate(); break;
        case 2: *reinterpret_cast< QStringList*>(_v) = _t->listSampleRateStr(); break;
        case 3: *reinterpret_cast< QList<int>*>(_v) = _t->listChannel(); break;
        case 4: *reinterpret_cast< QStringList*>(_v) = _t->listChannelStr(); break;
        case 5: *reinterpret_cast< QStringList*>(_v) = _t->listCodecs(); break;
        case 6: *reinterpret_cast< QList<QAudioFormat::Endian>*>(_v) = _t->listEndianz(); break;
        case 7: *reinterpret_cast< QStringList*>(_v) = _t->listEndianzStr(); break;
        case 8: *reinterpret_cast< QList<int>*>(_v) = _t->listSampleSize(); break;
        case 9: *reinterpret_cast< QStringList*>(_v) = _t->listSampleSizeStr(); break;
        case 10: *reinterpret_cast< QStringList*>(_v) = _t->listDuration(); break;
        case 11: *reinterpret_cast< QString*>(_v) = _t->listOutput(); break;
        case 12: *reinterpret_cast< QList<int>*>(_v) = _t->nearistParams(); break;
        case 13: *reinterpret_cast< bool*>(_v) = _t->saveDone(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<AudioConfig *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setListDevices(*reinterpret_cast< QStringList*>(_v)); break;
        case 1: _t->setListSampleRate(*reinterpret_cast< QList<int>*>(_v)); break;
        case 3: _t->setListChannel(*reinterpret_cast< QList<int>*>(_v)); break;
        case 5: _t->setListCodecs(*reinterpret_cast< QStringList*>(_v)); break;
        case 6: _t->setListEndianz(*reinterpret_cast< QList<QAudioFormat::Endian>*>(_v)); break;
        case 8: _t->setListSampleSize(*reinterpret_cast< QList<int>*>(_v)); break;
        case 11: _t->setListOutput(*reinterpret_cast< QString*>(_v)); break;
        case 13: _t->setSaveDone(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject AudioConfig::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_AudioConfig.data,
    qt_meta_data_AudioConfig,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *AudioConfig::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AudioConfig::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_AudioConfig.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int AudioConfig::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 16)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 16;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 16)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 16;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 14;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 14;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 14;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 14;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 14;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 14;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void AudioConfig::listCodecsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void AudioConfig::listSampleRateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void AudioConfig::listChannelChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void AudioConfig::listEndianzChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void AudioConfig::listDevicesChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void AudioConfig::listSampleSizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void AudioConfig::nearistParamsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void AudioConfig::saveDoneChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void AudioConfig::listDurationChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void AudioConfig::listOutputChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void AudioConfig::listSampleRateStrChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}

// SIGNAL 11
void AudioConfig::listChannelStrChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, nullptr);
}

// SIGNAL 12
void AudioConfig::listEndianzStrChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 12, nullptr);
}

// SIGNAL 13
void AudioConfig::listSampleSizeStrChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 13, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
