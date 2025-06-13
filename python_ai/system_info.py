#!/usr/bin/env python3
import json
try:
    from jtop import jtop
    with jtop() as jetson:
        stats = jetson.stats
        print(json.dumps({
            "gpu": stats.get("GPU", 0),
            "temperature": stats.get("Temp GPU", stats.get("Temp CPU", 0))
        }))
except Exception:
    print(json.dumps({"gpu": 0, "temperature": 0}))