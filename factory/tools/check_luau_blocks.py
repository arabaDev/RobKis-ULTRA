#!/usr/bin/env python3
"""Checagem heurística (não é um parser Luau real) de blocos ```lua/```luau
em todo o repo: balanceamento de do/end, parênteses, colchetes, chaves.
Não pega todo erro de sintaxe, mas pega bloco cortado, end faltando, etc.
"""
from __future__ import annotations
import sys
import os, re, json

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
FENCE_RE = re.compile(r"```(?:lua|luau)\n(.*?)```", re.S)

# palavras que abrem um bloco e precisam de 'end' (exceto repeat/until)
OPENERS = re.compile(r"\b(do|then|function)\b")
END_RE = re.compile(r"\bend\b")
REPEAT_RE = re.compile(r"\brepeat\b")
UNTIL_RE = re.compile(r"\buntil\b")


def strip_strings_and_comments(code: str) -> str:
    # remove comentários de linha e de bloco, e conteúdo de strings,
    # pra não contar 'end'/'do' que aparecem dentro de texto/strings.
    code = re.sub(r"--\[\[.*?\]\]", "", code, flags=re.S)
    code = re.sub(r"--.*", "", code)
    code = re.sub(r'"(?:[^"\\]|\\.)*"', '""', code)
    code = re.sub(r"'(?:[^'\\]|\\.)*'", "''", code)
    code = re.sub(r"\[\[.*?\]\]", "[[]]", code, flags=re.S)
    return code


ELSEIF_THEN_RE = re.compile(r"\belseif\b.*?\bthen\b", re.S)


def check_block(code: str):
    issues = []
    clean = strip_strings_and_comments(code)
    # 'elseif ... then' reusa o 'end' do 'if' original — não conta como abertura nova
    clean_for_opens = ELSEIF_THEN_RE.sub("", clean)
    opens = len(OPENERS.findall(clean_for_opens))
    ends = len(END_RE.findall(clean))
    repeats = len(REPEAT_RE.findall(clean))
    untils = len(UNTIL_RE.findall(clean))
    if opens != ends:
        issues.append(f"do/then/function={opens} vs end={ends}")
    if repeats != untils:
        issues.append(f"repeat={repeats} vs until={untils}")
    for a, b, name in [("(", ")", "parênteses"), ("{", "}", "chaves"), ("[", "]", "colchetes")]:
        if clean.count(a) != clean.count(b):
            issues.append(f"{name}: {a}={clean.count(a)} vs {b}={clean.count(b)}")
    return issues


def main():
    results = []
    for dirpath, _, filenames in os.walk(ROOT):
        for fn in filenames:
            if not fn.endswith(".md"):
                continue
            path = os.path.join(dirpath, fn)
            text = open(path, encoding="utf-8", errors="replace").read()
            for i, m in enumerate(FENCE_RE.finditer(text)):
                issues = check_block(m.group(1))
                if issues:
                    results.append({"file": os.path.relpath(path, ROOT), "block": i, "issues": issues})
    print(json.dumps({"blocos_com_problema": len(results), "detalhe": results}, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    main()
