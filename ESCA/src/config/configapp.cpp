#include "configapp.h"

// Constructor
ConfigApp::ConfigApp(QString &filePath) : filePath(filePath) {}

// Generate ConfigApp
void ConfigApp::generateConfig() {
    QJsonObject root;

    // DATASET
    QJsonObject dataset;
    QJsonObject dataloader;
    dataloader["BATCH_SIZE"] = 128;
    dataloader["SHUFFLE"] = true;

    QJsonObject path;
    path["ANOMALY"] = "/home/haiminh/Desktop/D-ESCA_v2/park_demo/park_Target3/abnormal";
    path["NORMAL"] = "/home/haiminh/Desktop/D-ESCA_v2/park_demo/park_Target3/normal";
    path["TEST"] = QJsonValue::Null;
    path["TFRECORDS"] = QJsonArray({"/home/haiminh/Desktop/D-ESCA_v2/park_dataset_demo/mel_data2"});

    QJsonObject ratio;
    ratio["TEST"] = 0.1;
    ratio["TRAIN"] = 0.8;

    dataset["DATALOADER"] = dataloader;
    dataset["PATH"] = path;
    dataset["RATIO"] = ratio;

    root["DATASET"] = dataset;

    // DEVICE
    QJsonObject device;
    device["JETSON"] = false;
    device["USE_TENSORRT"] = false;
    root["DEVICE"] = device;

    // MODEL
    QJsonObject model;
    model["TYPE"] = "vq_vae";
    root["MODEL"] = model;

    // POSTPROCESS
    QJsonObject postprocess;
    postprocess["PATH_SAVE_THRESHOLD"] = "/home/thanhho/SPARC/ESCA/Code/train_on_PCv2/Results/";
    root["POSTPROCESS"] = postprocess;

    // PREPROCESS
    QJsonObject preprocess;
    preprocess["AUDIO_LEN"] = 2;
    preprocess["FRAME_RATE"] = 44100;

    QJsonObject gamma;
    gamma["CHANNELS"] = 32;
    gamma["F_MIN"] = 100;
    gamma["HOP_TIME"] = 0.06;
    gamma["WINDOW_TIME"] = 0.12;

    QJsonObject mel;
    mel["NFFT"] = 2048;
    mel["N_BANDS"] = 32;
    mel["SR"] = 16000;

    preprocess["GAMMA"] = gamma;
    preprocess["MEL"] = mel;
    preprocess["SAMPLE_PER_FILE"] = 200;
    preprocess["SEGMENT_LEN"] = 2;
    preprocess["TYPE"] = "mel";
    preprocess["USE_TF_GTGRAM"]= false;

    root["PREPROCESS"] = preprocess;

    // REALTIME
    QJsonObject realtime;
    realtime["CHANNEL"] = 1;
    realtime["SAMPLE_RATE"]=44100;
    realtime["SAMPLE_SIZE"]=16;
    realtime["IMPORT_FILE"]=false;
    realtime["FOLDER_PATH"]="/home/haiminh/Desktop/ESCA_Qt/ESCA/data";
    realtime["LOG_PATH"] = "/home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2/Results/rt_test_results";
    realtime["MODEL_PATH"]= "/home/haiminh/Desktop/ESCA_Qt/python_ai/result",
    realtime["MANUAL_THRESHOLD"] = 0.01;
    realtime["RUNTIME"] = 1000;
    realtime["SECOND"] = 2;
    realtime["SHARED_MEMORY_KEY"] = "0xDEADBEEF";
    realtime["SEMAPHORE_KEY"] = "0xBEEFDEAD";
    //realtime["BUFFER_SIZE"] = 176400;
    realtime["BUFFER_SIZE"] = 0;
    realtime["MIN"] = -23.14520263671875;
    realtime["MAX"] = 51.67738342285156;
    realtime["THRESHOLD"] = 0.002630938310176134;
    realtime["TRT_MODEL_PATH"] = "";
    
    root["REALTIME"] = realtime;

    // RECORD
    QJsonObject record;
    record["ABNOMALY"] = false;
    record["DATASET_PATH"] = "./dataset_mic_laptop_16k";
    record["CODEC"] = 0;
    record["CHANNEL"] = 0;
    record["DEVICE"] = 0;
    record["DEVICENAME"] = "default";
    record["DURATION"] = 0;
    record["ENDIAN"] = 0;
    record["SAMPLERATE"] = 0;
    record["SAMPLESIZE"] = 0;

    root["RECORD"] = record;

    // TRAINING
    QJsonObject training;
    training["EPOCH"] = 10;
    training["LEARNING_RATE"] = 0.001;
    training["LOG_FOLDER"] = "./Results/temp";
    training["PRETRAINED_WEIGHTS"] = "/home/haiminh/Desktop/ESCA_Qt/python_ai/temp/saved_model";
    training["SAVE_PATH"] = "/home/haiminh/Desktop/ESCA_Qt/python_ai";

    root["TRAINING"] = training;

    // TRANSFER_LEARNING
    QJsonObject transferLearning;
    transferLearning["ANOM_BATCH_SIZE"] = 128;
    transferLearning["BASED_WEIGHTS"] = "/home/haiminh/Desktop/D-ESCA_v2/Results/base_training_result/saved_model/vq_vae";
    transferLearning["BETA"] = 1;
    transferLearning["EPOCH"] = 81;
    transferLearning["LEARNING_RATE"] = 0.001;
    transferLearning["SAVE_PATH"] = "/home/haiminh/Desktop/D-ESCA_v2/Results/tl-training_results/Target3";
    transferLearning["TEST_DIR"] = QJsonValue::Null;
    transferLearning["TFRECORDS"] = QJsonArray({"/home/haiminh/Desktop/D-ESCA_v2/data/target/Target25"});

    root["TRANSFER_LEARNING"] = transferLearning;

    saveToFile(root);
}

// Save JSON to file
void ConfigApp::saveToFile(const QJsonObject &jsonObject) {
    QFile file(filePath);
    if (file.open(QIODevice::WriteOnly)) {
        QJsonDocument doc(jsonObject);
        file.write(doc.toJson());

        qDebug()<<"Da tao file config o " << filePath;

        file.close();
    }
}
