#!/usr/bin/env python3

import json

import sys

def main() -> None:
    try:
        from jtop import jtop

        with jtop() as jetson:
            stats = jetson.stats

            # ---- GPU usage ----
            gpu_key = next((k for k in stats if k.startswith("GPU")), None)
            gpu = int(stats.get(gpu_key, 0)) if gpu_key else 0

            # ---- Temperature ----
            temp_key = next((k for k in stats if k.lower().startswith("temp") and "gpu" in k.lower()), None)
            if not temp_key:
                temp_key = next((k for k in stats if k.lower().startswith("temp") and "cpu" in k.lower()), None)
            temperature = int(stats.get(temp_key, 0)) if temp_key else 0

            print(json.dumps({
                "gpu": gpu,
                "temperature": temperature,
                "gpu_key": gpu_key,
                "temp_key": temp_key
            }))

    except Exception as exc:  # pragma: no cover - runtime diagnostics
        print(json.dumps({"gpu": 0, "temperature": 0, "error": str(exc)}))
        sys.exit(1)


if __name__ == "__main__":
    main()

