#include "systeminformationcontroller.h"
#include <QDebug>
#include <QProcess>
#include <QJsonDocument>
#include <QJsonObject>
#include <QCoreApplication>

SystemInformationController::SystemInformationController(QObject *parent) : QObject{parent} {
    m_timer.setInterval(3);
    m_timer.setSingleShot(false);
    m_timer.start(1000);
    connect(&m_timer, &QTimer::timeout, this, [this]() {

        // For cpu
        cpu_usage = getCpu();

        // For ram
        ram_usage = getRam();

        // For disk
        disk_usage = getDisk();

        // For gpu and temperature
        auto res = getGpuTemp();
        gpu_usage = std::get<0>(res);
        temperature_value = std::get<1>(res);

        // Emit
        emit cpuChanged();
        emit ramChanged();
        emit diskChanged();
        emit gpuChanged();
        emit temperatureChanged();
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
    QString scriptPath = QCoreApplication::applicationDirPath() + "/../python_ai/system_info.py";
    process.start("python3", QStringList() << scriptPath);
    if (process.waitForFinished(1000)) {
        QByteArray out = process.readAllStandardOutput().trimmed();
        QJsonDocument doc = QJsonDocument::fromJson(out);
        if (!doc.isNull() && doc.isObject()) {
            QJsonObject obj = doc.object();
            gpu = obj.value("gpu").toDouble();
            temp = obj.value("temperature").toDouble();
        }
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
