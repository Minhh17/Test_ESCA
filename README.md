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

### GPU Gammatone Pre-processing

Set `"USE_TF_GTGRAM": true` in the same configuration to offload the
gammatone spectrogram calculation to TensorFlow running on GPU. This replaces
the slower Python implementation, further improving throughput on Jetson.

