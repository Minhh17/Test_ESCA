/****************************************************************************
** Meta object code from reading C++ file 'sharedmemorymanager.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/aiprocess/sharedmemorymanager.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'sharedmemorymanager.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_SharedMemoryManager_t {
    QByteArrayData data[7];
    char stringdata0[82];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_SharedMemoryManager_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_SharedMemoryManager_t qt_meta_stringdata_SharedMemoryManager = {
    {
QT_MOC_LITERAL(0, 0, 19), // "SharedMemoryManager"
QT_MOC_LITERAL(1, 20, 13), // "bufferChanged"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 23), // "sharedMemoryUnavailable"
QT_MOC_LITERAL(4, 59, 12), // "getAudioData"
QT_MOC_LITERAL(5, 72, 4), // "data"
QT_MOC_LITERAL(6, 77, 4) // "stop"

    },
    "SharedMemoryManager\0bufferChanged\0\0"
    "sharedMemoryUnavailable\0getAudioData\0"
    "data\0stop"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SharedMemoryManager[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   34,    2, 0x06 /* Public */,
       3,    0,   35,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    1,   36,    2, 0x0a /* Public */,
       6,    0,   39,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::QByteArray,    5,
    QMetaType::Void,

       0        // eod
};

void SharedMemoryManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SharedMemoryManager *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->bufferChanged(); break;
        case 1: _t->sharedMemoryUnavailable(); break;
        case 2: _t->getAudioData((*reinterpret_cast< const QByteArray(*)>(_a[1]))); break;
        case 3: _t->stop(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (SharedMemoryManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SharedMemoryManager::bufferChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (SharedMemoryManager::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SharedMemoryManager::sharedMemoryUnavailable)) {
                *result = 1;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject SharedMemoryManager::staticMetaObject = { {
    QMetaObject::SuperData::link<QThread::staticMetaObject>(),
    qt_meta_stringdata_SharedMemoryManager.data,
    qt_meta_data_SharedMemoryManager,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *SharedMemoryManager::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SharedMemoryManager::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_SharedMemoryManager.stringdata0))
        return static_cast<void*>(this);
    return QThread::qt_metacast(_clname);
}

int SharedMemoryManager::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QThread::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void SharedMemoryManager::bufferChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void SharedMemoryManager::sharedMemoryUnavailable()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
