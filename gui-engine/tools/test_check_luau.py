#!/usr/bin/env python3
"""Autoteste do verificador: garante que ele realmente PEGA erros (e não só aprova tudo)."""
from __future__ import annotations
import sys as _sys
for _s in (_sys.stdout, _sys.stderr):  # console do Windows (cp1252)
    if hasattr(_s, "reconfigure"):
        _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import check_luau as c

def errs(code):
    return c.check_blocks(c.lex(code))[0]

cases = [
    ("bloco ok", "local function f()\n if a then\n  for i=1,2 do end\n end\nend", False),
    ("falta end", "local function f()\n if a then\n end", True),
    ("end sobrando", "local x = 1\nend", True),
    ("repeat/until ok", "repeat\n x()\nuntil y", False),
    ("until sem repeat", "until y", True),
    ("parêntese aberto", "local x = foo(1, 2", True),
    ("chave fechada a mais", "local t = {1, 2}}", True),
    ("palavra dentro de string é ignorada", 'local s = "function if do end ("', False),
    ("comentário ignorado", "-- if then end (\nlocal x = 1", False),
    ("comentário longo ignorado", "--[[ function ( ]]\nlocal x = 1", False),
    ("if-expressão não conta bloco", "local x = if a then 1 else 2", False),
    ("while/do", "while a do\n b()\nend", False),
    ("elseif", "if a then\nelseif b then\nelse\nend", False),
]
failed = 0
for name, code, expect_error in cases:
    got = bool(errs(code))
    status = "ok" if got == expect_error else "FALHOU"
    if status != "ok":
        failed += 1
    print(f"{status:7} {name}")
print(f"\n{len(cases) - failed}/{len(cases)} casos corretos")
sys.exit(1 if failed else 0)
