## 🤗 Welcome to the Embedded System to Anomaly Detection on GitHUB!  

Some infomation about us 😎  
🙋‍♀️HUST Industry-Academia Collaboration Project betwwen Signal Processing and Radio Communication Laboratory, HUST and SI Synergy Technology Company Ltd, Japan  
🧙 Instructor: Ph.D Huy-Dung Han  
👩‍💻 Research Orientation: 
+ Amomaly Detection in Sound for Industrial, Smart Traffic and etc.
+ Develop the Embedded Linux Platform to make comprehensive IoT system includes: Clouds Architecture, Embedded Linux OS by Yocto Project, Anomaly Detection Algorithm, etc. 
+ The target machines: Jetson Nano, Jetson Xavier, Jetson Orin Nano, Rasberry Pi 4, ...

The documentation ESCA provides on github includes:
* ESCA Information
  * Environmental sound collection and analysis embedded application
* ESCA Version: 2024

To run project:

## Jetson Orin Nano Optimization

The inference module now supports TensorRT. Enable this by setting
`"USE_TENSORRT": true` in `python_ai/config/default.json` and specify the
`TRT_MODEL_PATH` where the optimized model will be stored. On the first run the
model will be converted using TF‑TRT; subsequent runs load the optimized
version directly. If conversion is not possible the code automatically falls
back to TensorFlow execution.

### Performance Evaluation

When running `python_ai/inference/inference.py`, the processing time of each
cycle is written to `REALTIME.LOG_PATH/processing_time.log` (as configured in
`python_ai/config/default.json`). Compare these timings before and after
enabling TensorRT on Jetson to quantify the speed‑up for your report.

### Data Storage

Set the environment variable `ESCA_DATA_PATH` to control where files such as
`config.json`, `health.log` and `processing_time.log` are stored. If not set, all
logs and configuration will be kept under `~/data_storage`.

### GPU Gammatone Pre-processing

Set `"USE_TF_GTGRAM": true` in the same configuration to offload the
gammatone spectrogram calculation to TensorFlow running on GPU. This replaces
the slower Python implementation, further improving throughput on Jetson.


### Architecture Overview

The project follows a **Layered + Hexagonal** architecture:

1. **UI Layer** – implemented in QML files under `ESCA/qml`, strictly
   communicates with the application core via exposed properties and
   signals.
2. **Core Orchestrator** – C++ controllers located in
   `ESCA/src/modules` coordinate application logic and launch Python
   processes. They interact with the domain through interfaces such as
   `InferenceEngine`.
3. **Domain Modules** – reusable processing logic (e.g. training and
   inference) implemented mostly in `python_ai` and a few C++ classes.
4. **External Adapters** – infrastructure code like TensorFlow, file
   system access or device drivers.

To keep the layers independent, runtime paths are now resolved relative
to the executable rather than hard coded. The configuration loader in
`python_ai/config/config_manager.py` also accepts an `ESCA_CONFIG_PATH`
environment variable for custom setups.


