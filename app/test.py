import os
from pathlib import Path
import sys

print(os.fspath(Path(__file__).resolve().parent))