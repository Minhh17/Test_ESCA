#include "systeminformationcontroller.h"
#include <QDebug>
#include <QProcess>

SystemInformationController::SystemInformationController(QObject *parent) : QObject{parent} {
    qDebug() << "Instance created";
    m_timer.setInterval(3);
    m_timer.setSingleShot(false);
    m_timer.start(1000);
    connect(&m_timer, &QTimer::timeout, this, [this]() {

        // For cpu
        m_cpu = getCpu();

        // For gpu
        m_gpu = getGpu();

        // For ram
        m_ram = getRam();

        // For disk
        m_disk = getDisk();

        // Both
        emit cpuChanged();
        emit gpuChanged();
        emit ramChanged();
        emit diskChanged();
    });
}

SystemInformationController::~SystemInformationController() {
    m_timer.stop();
    qDebug() << "Instance destroyed";
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

//CPU
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
        percent = 0;
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

QString SystemInformationController::getCpuName() {
    FILE* file = fopen("/proc/cpuinfo", "r");
    char line[128];

    while (fgets(line, 128, file) != NULL){
        if (strncmp(line, "model name", 10) == 0){
            char* p = line;
            while(*p != ':') {
                p++;
            }
            return QString::fromUtf8(p).trimmed();
        }
    }
    fclose(file);
    return "Unknown CPU";
}

//GPU
int SystemInformationController::getGpu() {
    QProcess process;

    process.start("nvidia-smi", QStringList() << "--query-gpu=memory.total,memory.used --format=csv,noheader");
    if(!process.waitForFinished()) {
        qDebug() << "Error: " << process.errorString();
        return -1;
    }
    QString gpuMemory = process.readAll();
    QStringList parts = gpuMemory.split(", ", Qt::SkipEmptyParts);

    QString totalGpu = parts[0].split(" ")[0];
    QString usedGpu = parts[1].split(" ")[0];

    return (usedGpu.toInt() * 100) / totalGpu.toInt();
}

QString SystemInformationController::getGpuName() {
    QProcess process;

    process.start("nvidia-smi", QStringList() << "--query-gpu=name --format=csv,noheader");
    if(!process.waitForFinished()) {
        qDebug() << "Error: " << process.errorString();
        return "Unknown GPU";
    }

    QString gpuName = process.readAll();

    return gpuName;
}

//Function to get cache
int SystemInformationController::getCacheL1() {
    QProcess process;
    int L1i_cache = 0;
    int L1d_cache = 0;
    int L1_cache = 0;

    process.start("lscpu", QStringList() << "-C");
    if(!process.waitForFinished()) {
        qDebug() << "Error: " << process.errorString();
    }

    QString output = process.readAll();
    QStringList lines = output.split("\n");

    for (int i = 0; i < lines.size(); i++) {
        const QString &line = lines.at(i);
        if (line.startsWith("L1d")) {
            QStringList parts = line.split(" ", Qt::SkipEmptyParts);
            QStringList L1d = parts[2].split("K");
            L1d_cache = L1d[0].toInt();
        }
        if (line.startsWith("L1i")) {
            QStringList parts = line.split(" ", Qt::SkipEmptyParts);
            QStringList L1i = parts[2].split("K");
            L1i_cache = L1i[0].toInt();
        }
        L1_cache = L1d_cache + L1i_cache;
    }
    return L1_cache;
}

QString SystemInformationController::getCacheL2() {
    QProcess process;

    process.start("lscpu", QStringList() << "-C");
    if(!process.waitForFinished()) {
        qDebug() << "Error: " << process.errorString();
    }

    QString output = process.readAll();
    QStringList lines = output.split("\n");

    for (int i = 0; i < lines.size(); i++) {
        const QString &line = lines.at(i);
        if (line.startsWith("L2")) {
            QStringList parts = line.split(" ", Qt::SkipEmptyParts);
            return parts[2];
        }
    }
    return "Unknow";
}

int SystemInformationController::cpuPercentage() const { return m_cpu; }

QString SystemInformationController::cpuText() const {
    return QString::number(m_cpu) + "%";
}

int SystemInformationController::gpuPercentage() const { return m_gpu; }

QString SystemInformationController::gpuText() const {
    return QString::number(m_gpu) + "%";
}

int SystemInformationController::ramPercentage() const { return m_ram; }

QString SystemInformationController::ramText() const {
    return QString::number(m_ram) + "%";
}

QString SystemInformationController::diskText() const {
    return "Disk usage: " + QString::number(m_disk) + "%";
}
