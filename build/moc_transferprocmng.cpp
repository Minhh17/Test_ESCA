/****************************************************************************
** Meta object code from reading C++ file 'transferprocmng.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/transferlearning/transferprocmng.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QVector>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'transferprocmng.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_TransferProcMng_t {
    QByteArrayData data[20];
    char stringdata0[272];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_TransferProcMng_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_TransferProcMng_t qt_meta_stringdata_TransferProcMng = {
    {
QT_MOC_LITERAL(0, 0, 15), // "TransferProcMng"
QT_MOC_LITERAL(1, 16, 10), // "logUpdated"
QT_MOC_LITERAL(2, 27, 0), // ""
QT_MOC_LITERAL(3, 28, 20), // "epochProgressUpdated"
QT_MOC_LITERAL(4, 49, 19), // "epochSummaryUpdated"
QT_MOC_LITERAL(5, 69, 15), // "progressUpdated"
QT_MOC_LITERAL(6, 85, 16), // "histogramUpdated"
QT_MOC_LITERAL(7, 102, 15), // "QVector<double>"
QT_MOC_LITERAL(8, 118, 14), // "prCurveUpdated"
QT_MOC_LITERAL(9, 133, 6), // "recall"
QT_MOC_LITERAL(10, 140, 9), // "precision"
QT_MOC_LITERAL(11, 150, 15), // "rocCurveUpdated"
QT_MOC_LITERAL(12, 166, 3), // "fpr"
QT_MOC_LITERAL(13, 170, 3), // "tpr"
QT_MOC_LITERAL(14, 174, 13), // "transFinished"
QT_MOC_LITERAL(15, 188, 20), // "handleStandardOutput"
QT_MOC_LITERAL(16, 209, 21), // "handleProcessFinished"
QT_MOC_LITERAL(17, 231, 8), // "exitCode"
QT_MOC_LITERAL(18, 240, 20), // "QProcess::ExitStatus"
QT_MOC_LITERAL(19, 261, 10) // "exitStatus"

    },
    "TransferProcMng\0logUpdated\0\0"
    "epochProgressUpdated\0epochSummaryUpdated\0"
    "progressUpdated\0histogramUpdated\0"
    "QVector<double>\0prCurveUpdated\0recall\0"
    "precision\0rocCurveUpdated\0fpr\0tpr\0"
    "transFinished\0handleStandardOutput\0"
    "handleProcessFinished\0exitCode\0"
    "QProcess::ExitStatus\0exitStatus"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TransferProcMng[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       8,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    4,   64,    2, 0x06 /* Public */,
       3,    2,   73,    2, 0x06 /* Public */,
       4,    1,   78,    2, 0x06 /* Public */,
       5,    1,   81,    2, 0x06 /* Public */,
       6,    1,   84,    2, 0x06 /* Public */,
       8,    2,   87,    2, 0x06 /* Public */,
      11,    2,   92,    2, 0x06 /* Public */,
      14,    0,   97,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      15,    0,   98,    2, 0x0a /* Public */,
      16,    2,   99,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Int, QMetaType::Int, QMetaType::QString, QMetaType::QVariantMap,    2,    2,    2,    2,
    QMetaType::Void, QMetaType::Int, QMetaType::Int,    2,    2,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, 0x80000000 | 7,    2,
    QMetaType::Void, 0x80000000 | 7, 0x80000000 | 7,    9,   10,
    QMetaType::Void, 0x80000000 | 7, 0x80000000 | 7,   12,   13,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int, 0x80000000 | 18,   17,   19,

       0        // eod
};

void TransferProcMng::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<TransferProcMng *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->logUpdated((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QVariantMap(*)>(_a[4]))); break;
        case 1: _t->epochProgressUpdated((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 2: _t->epochSummaryUpdated((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->progressUpdated((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->histogramUpdated((*reinterpret_cast< QVector<double>(*)>(_a[1]))); break;
        case 5: _t->prCurveUpdated((*reinterpret_cast< const QVector<double>(*)>(_a[1])),(*reinterpret_cast< const QVector<double>(*)>(_a[2]))); break;
        case 6: _t->rocCurveUpdated((*reinterpret_cast< const QVector<double>(*)>(_a[1])),(*reinterpret_cast< const QVector<double>(*)>(_a[2]))); break;
        case 7: _t->transFinished(); break;
        case 8: _t->handleStandardOutput(); break;
        case 9: _t->handleProcessFinished((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QProcess::ExitStatus(*)>(_a[2]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 4:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QVector<double> >(); break;
            }
            break;
        case 5:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 1:
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QVector<double> >(); break;
            }
            break;
        case 6:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 1:
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QVector<double> >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (TransferProcMng::*)(int , int , QString , QVariantMap );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferProcMng::logUpdated)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (TransferProcMng::*)(int , int );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferProcMng::epochProgressUpdated)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (TransferProcMng::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferProcMng::epochSummaryUpdated)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (TransferProcMng::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferProcMng::progressUpdated)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (TransferProcMng::*)(QVector<double> );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferProcMng::histogramUpdated)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (TransferProcMng::*)(const QVector<double> & , const QVector<double> & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferProcMng::prCurveUpdated)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (TransferProcMng::*)(const QVector<double> & , const QVector<double> & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferProcMng::rocCurveUpdated)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (TransferProcMng::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&TransferProcMng::transFinished)) {
                *result = 7;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject TransferProcMng::staticMetaObject = { {
    QMetaObject::SuperData::link<Process::staticMetaObject>(),
    qt_meta_stringdata_TransferProcMng.data,
    qt_meta_data_TransferProcMng,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *TransferProcMng::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TransferProcMng::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_TransferProcMng.stringdata0))
        return static_cast<void*>(this);
    return Process::qt_metacast(_clname);
}

int TransferProcMng::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Process::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    }
    return _id;
}

// SIGNAL 0
void TransferProcMng::logUpdated(int _t1, int _t2, QString _t3, QVariantMap _t4)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t3))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t4))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void TransferProcMng::epochProgressUpdated(int _t1, int _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void TransferProcMng::epochSummaryUpdated(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void TransferProcMng::progressUpdated(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void TransferProcMng::histogramUpdated(QVector<double> _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void TransferProcMng::prCurveUpdated(const QVector<double> & _t1, const QVector<double> & _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void TransferProcMng::rocCurveUpdated(const QVector<double> & _t1, const QVector<double> & _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}

// SIGNAL 7
void TransferProcMng::transFinished()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
