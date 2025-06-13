#!/usr/bin/env python3
import json
try:
    from jtop import jtop
    with jtop() as jetson:
        stats = jetson.stats
        # GPU may be labelled as GPU, GPU0, GPU1...
        gpu_keys = [k for k in stats.keys() if k.startswith("GPU")]
        gpu = stats.get("GPU", 0)
        if gpu_keys:
            gpu = stats.get(gpu_keys[0], gpu)

        temp = 0
        # Prefer GPU temperature, otherwise fall back to CPU
        temp_keys = [k for k in stats.keys() if k.startswith("Temp") and "GPU" in k]
        if not temp_keys:
            temp_keys = [k for k in stats.keys() if k.startswith("Temp") and "CPU" in k]
        if temp_keys:
            temp = stats.get(temp_keys[0], 0)
        else:
            temp = stats.get("Temp GPU", stats.get("Temp CPU", 0))

        print(json.dumps({"gpu": gpu, "temperature": temp}))
except Exception:
    print(json.dumps({"gpu": 0, "temperature": 0}))
