import os
from pathlib import Path


def base_path() -> str:
    """Return base directory for shared data"""
    return os.getenv("ESCA_DATA_PATH", str(Path.home() / "data_storage"))


def ensure_dir() -> None:
    Path(base_path()).mkdir(parents=True, exist_ok=True)


def file_path(name: str) -> str:
    """Return absolute path inside data storage"""
    ensure_dir()
    return str(Path(base_path()) / name)
