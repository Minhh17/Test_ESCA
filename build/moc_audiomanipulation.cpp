/****************************************************************************
** Meta object code from reading C++ file 'audiomanipulation.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/audiomanipulation/audiomanipulation.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'audiomanipulation.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_AudioManipulation_t {
    QByteArrayData data[17];
    char stringdata0[212];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AudioManipulation_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AudioManipulation_t qt_meta_stringdata_AudioManipulation = {
    {
QT_MOC_LITERAL(0, 0, 17), // "AudioManipulation"
QT_MOC_LITERAL(1, 18, 17), // "onProcessFinished"
QT_MOC_LITERAL(2, 36, 0), // ""
QT_MOC_LITERAL(3, 37, 8), // "exitCode"
QT_MOC_LITERAL(4, 46, 20), // "QProcess::ExitStatus"
QT_MOC_LITERAL(5, 67, 10), // "exitStatus"
QT_MOC_LITERAL(6, 78, 14), // "onProcessError"
QT_MOC_LITERAL(7, 93, 22), // "QProcess::ProcessError"
QT_MOC_LITERAL(8, 116, 5), // "error"
QT_MOC_LITERAL(9, 122, 11), // "extractMFCC"
QT_MOC_LITERAL(10, 134, 9), // "audioPath"
QT_MOC_LITERAL(11, 144, 11), // "extractGFCC"
QT_MOC_LITERAL(12, 156, 16), // "extractFrequency"
QT_MOC_LITERAL(13, 173, 10), // "splitAudio"
QT_MOC_LITERAL(14, 184, 6), // "source"
QT_MOC_LITERAL(15, 191, 11), // "destination"
QT_MOC_LITERAL(16, 203, 8) // "duration"

    },
    "AudioManipulation\0onProcessFinished\0"
    "\0exitCode\0QProcess::ExitStatus\0"
    "exitStatus\0onProcessError\0"
    "QProcess::ProcessError\0error\0extractMFCC\0"
    "audioPath\0extractGFCC\0extractFrequency\0"
    "splitAudio\0source\0destination\0duration"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AudioManipulation[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    2,   44,    2, 0x08 /* Private */,
       6,    1,   49,    2, 0x08 /* Private */,

 // methods: name, argc, parameters, tag, flags
       9,    1,   52,    2, 0x02 /* Public */,
      11,    1,   55,    2, 0x02 /* Public */,
      12,    1,   58,    2, 0x02 /* Public */,
      13,    3,   61,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void, QMetaType::Int, 0x80000000 | 4,    3,    5,
    QMetaType::Void, 0x80000000 | 7,    8,

 // methods: parameters
    QMetaType::Void, QMetaType::QString,   10,
    QMetaType::Void, QMetaType::QString,   10,
    QMetaType::Void, QMetaType::QString,   10,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,   14,   15,   16,

       0        // eod
};

void AudioManipulation::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<AudioManipulation *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onProcessFinished((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QProcess::ExitStatus(*)>(_a[2]))); break;
        case 1: _t->onProcessError((*reinterpret_cast< QProcess::ProcessError(*)>(_a[1]))); break;
        case 2: _t->extractMFCC((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->extractGFCC((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->extractFrequency((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->splitAudio((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject AudioManipulation::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_AudioManipulation.data,
    qt_meta_data_AudioManipulation,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *AudioManipulation::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AudioManipulation::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_AudioManipulation.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int AudioManipulation::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
