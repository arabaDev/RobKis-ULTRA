"""Ponte para o pytest: executa as suítes autônomas do projeto e falha se alguma falhar."""
from __future__ import annotations
import os
import subprocess
import sys

import pytest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SUITES = ["scripts/test_tools.py", "scripts/test_viral.py", "scripts/test_decide.py", "gui-engine/tools/test_check_luau.py", "gui-engine/tools/check_luau.py"]


@pytest.mark.parametrize("suite", SUITES)
def test_suite(suite):
    r = subprocess.run([sys.executable, os.path.join(ROOT, suite)], cwd=ROOT, capture_output=True, text=True, check=False)
    assert r.returncode == 0, r.stdout[-2000:] + r.stderr[-2000:]
