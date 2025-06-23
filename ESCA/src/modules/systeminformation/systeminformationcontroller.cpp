#include "systeminformationcontroller.h"
#include "../../common/storage/datastorage.h"
#include <QDebug>
#include <QProcess>
#include <QJsonDocument>
#include <QJsonObject>
#include <QCoreApplication>
#include <QDir>
#include <QTextStream>
#include <QDateTime>

SystemInformationController::SystemInformationController(QObject *parent) : QObject{parent} {

    QString logFilePath = DataStorage::filePath("health.log");
    m_healthLog.setFileName(logFilePath);
    if (!m_healthLog.open(QIODevice::Append | QIODevice::Text)) {
        qWarning() << "Cannot open health log:" << logFilePath;
    }

    m_timer.setInterval(1000);
    m_timer.setSingleShot(false);
    m_timer.start();
    connect(&m_timer, &QTimer::timeout, this, [this]() {

        // For cpu
        cpu_usage = getCpu();

        // For ram
        ram_usage = getRam();

        // For disk
        disk_usage = getDisk();

        // For gpu and temperature
        // For gpu and temperature
        auto res = getGpuTemp();
        gpu_usage = std::get<0>(res);
        temperature_value = std::get<1>(res);

        appendHistory(m_cpuHistory, cpu_usage);
        appendHistory(m_gpuHistory, gpu_usage);
        appendHistory(m_ramHistory, ram_usage);
        appendHistory(m_tempHistory, temperature_value);

        if (m_healthLog.isOpen()) {
            QTextStream out(&m_healthLog);
            QString ts = QDateTime::currentDateTime().toString(Qt::ISODate);
            out << ts << " [INFO] CPU=" << cpu_usage
                << "% , GPU=" << gpu_usage
                << "%, RAM=" << ram_usage
                << "%, Temp=" << temperature_value << "\xC2\xB0" << "C" << "\n";
            out.flush();
        }

        // Emit
        emit cpuChanged();
        emit ramChanged();
        emit diskChanged();
        emit gpuChanged();
        emit temperatureChanged();
        emit historyChanged();
    });
}


double SystemInformationController::getDisk() {
    QStorageInfo storage = QStorageInfo::root();
    return static_cast<double>(storage.bytesTotal()-storage.bytesAvailable())/storage.bytesTotal() * 100;
}

//----------------------------------------
// Some function for ram/cpu/gpu
//----------------------------------------

int SystemInformationController::parseLine(char* line){
    // This assumes that a digit will be found and the line ends in " Kb".
    int i = strlen(line);
    const char* p = line;
    while (*p <'0' || *p > '9') p++;
    line[i-3] = '\0';
    i = atoi(p);
    return i;
}
double SystemInformationController::getRam(){
    //Note: this value is in KB!
    FILE* file = fopen("/proc/meminfo", "r");
    int memFree = -1;
    int memTotal = -1;
    char line[128];

    while (fgets(line, 128, file) != NULL){
        if (strncmp(line, "MemFree:", 6) == 0){
            memFree = parseLine(line);
        }
        if (strncmp(line, "MemTotal:", 6) == 0){
            memTotal = parseLine(line);
        }
    }
    fclose(file);
    return static_cast<double>(memTotal-memFree)/memTotal * 100;
}

double SystemInformationController::getCpu()
{
    double percent;
    FILE* file;
    unsigned long long totalUser, totalUserLow, totalSys, totalIdle, total;

    file = fopen("/proc/stat", "r");
    fscanf(file, "cpu %llu %llu %llu %llu", &totalUser, &totalUserLow,
           &totalSys, &totalIdle);
    fclose(file);

    if (totalUser < lastTotalUser || totalUserLow < lastTotalUserLow ||
        totalSys < lastTotalSys || totalIdle < lastTotalIdle){
        //Overflow detection. Just skip this value.
        percent = -1.0;
    }
    else{
        total = (totalUser - lastTotalUser) + (totalUserLow - lastTotalUserLow) +
                (totalSys - lastTotalSys);
        percent = total;
        total += (totalIdle - lastTotalIdle);
        percent /= total;
        percent *= 100;
    }

    lastTotalUser = totalUser;
    lastTotalUserLow = totalUserLow;
    lastTotalSys = totalSys;
    lastTotalIdle = totalIdle;

    return percent;
}
// end


int SystemInformationController::cpuPercentage() const { return cpu_usage; }

QString SystemInformationController::cpuText() const {
    return QString::number(cpu_usage) + "%";
}

int SystemInformationController::ramPercentage() const { return ram_usage; }

QString SystemInformationController::ramText() const {
    return QString::number(ram_usage) + "%";
}

QString SystemInformationController::diskText() const {
    return "Disk usage: " + QString::number(disk_usage) + "%";
}


std::tuple<double, double> SystemInformationController::getGpuTemp()
{
    double gpu = 0;
    double temp = 0;
    QProcess process;
    QString scriptPath = "/home/sparclab/Desktop/Test_ESCA/python_ai/system_info.py";
    process.start("python3", QStringList() << scriptPath);

    if (!process.waitForStarted(1000)) {
        qWarning() << "system_info.py did not start:" << process.errorString();
        return {gpu, temp};
    }

    if (!process.waitForFinished(5000)) {
        qWarning() << "system_info.py timeout";
        process.kill();
        return {gpu, temp};
    }

    QByteArray out = process.readAllStandardOutput().trimmed();
    QByteArray err = process.readAllStandardError().trimmed();
    if (!err.isEmpty())
        qWarning() << "system_info.py stderr:" << err;

    QJsonDocument doc = QJsonDocument::fromJson(out);
    if (!doc.isNull() && doc.isObject()) {
        QJsonObject obj = doc.object();
        gpu = obj.value("gpu").toDouble();
        temp = obj.value("temperature").toDouble();
        if (obj.contains("error"))
            qWarning() << "system_info.py error:" << obj.value("error").toString();
        // qDebug() << "GPU key" << obj.value("gpu_key").toString()
        //          << "Temp key" << obj.value("temp_key").toString();
    } else {
        qWarning() << "Failed to parse system_info.py output:" << out;

    }
    return {gpu, temp};
}

int SystemInformationController::gpuPercentage() const { return gpu_usage; }

QString SystemInformationController::gpuText() const {
    return QString::number(gpu_usage) + "%";
}

int SystemInformationController::temperature() const { return temperature_value; }

QString SystemInformationController::temperatureText() const {
    return QString::number(temperature_value) + "°C";
}

void SystemInformationController::appendHistory(QVector<int>& list, int value)
{
    list.append(value);
    if (list.size() > 300)
        list.removeFirst();
}

QVector<int> SystemInformationController::cpuHistory() const { return m_cpuHistory; }
QVector<int> SystemInformationController::gpuHistory() const { return m_gpuHistory; }
QVector<int> SystemInformationController::ramHistory() const { return m_ramHistory; }
QVector<int> SystemInformationController::tempHistory() const { return m_tempHistory; }
