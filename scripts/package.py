#!/usr/bin/env python3
"""Gera o arquivo ÚNICO do ROViral ULTRA: um zip que serve para Claude.ai/Desktop, Claude Code e OpenCode.

  python scripts/package.py                     cria ../ROViral ULTRA.zip (ao lado da pasta do projeto) e valida
  python scripts/package.py -o caminho/arquivo.zip

Formato: o zip contém a pasta `roviral-ultra/` (o Claude.ai exige que o nome da pasta seja igual ao `name` do SKILL.md).
Dentro dela: SKILL.md + references/ + scripts/ (a skill) e AGENTS.md, CLAUDE.md, opencode.json, .claude/, .opencode/,
gui-engine/ (o projeto). Ficam de fora só caches e arquivos gerados localmente.
"""
from __future__ import annotations

import argparse
import os
import re
import sys
import zipfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NAME = "roviral-ultra"
ALLOWED_KEYS = {"name", "description", "license", "compatibility", "metadata", "allowed-tools"}
SKIP_DIRS = {"__pycache__", ".fastcheck", ".pytest_cache", ".mypy_cache", ".ruff_cache", ".roviral", "dist", ".git", "node_modules", ".venv"}
SKIP_FILES = {".DS_Store", "Thumbs.db", "settings.local.json"}
MAX_BYTES = 30 * 1024 * 1024


def check_skill(root: str) -> list[str]:
    errs = []
    path = os.path.join(root, "SKILL.md")
    if not os.path.isfile(path):
        return ["SKILL.md ausente na raiz"]
    text = open(path, encoding="utf-8").read()
    m = re.match(r"---\n(.*?)\n---\n", text, re.S)
    if not m:
        return ["SKILL.md sem frontmatter YAML"]
    keys = re.findall(r"^([A-Za-z_\-]+):", m.group(1), re.M)
    extra = set(keys) - ALLOWED_KEYS
    if extra:
        errs.append(f"frontmatter com chaves que o Claude.ai recusa: {sorted(extra)}")
    if not re.search(r"^name:\s*" + NAME + r"\s*$", m.group(1), re.M):
        errs.append(f"name do SKILL.md precisa ser {NAME}")
    d = re.search(r'^description:\s*"?(.*?)"?\s*$', m.group(1), re.M)
    if not d or not d.group(1) or len(d.group(1)) > 1024 or "<" in d.group(1) or ">" in d.group(1):
        errs.append("description ausente, maior que 1024 caracteres ou com < >")
    if text.count("\n") > 500:
        errs.append("SKILL.md com mais de 500 linhas")
    for ref in sorted(set(re.findall(r"`(references/[\w\-.]+)`", text))):
        if not os.path.isfile(os.path.join(root, ref)):
            errs.append(f"SKILL.md cita {ref}, que não existe")
    for need in ("scripts/rv.py", "AGENTS.md", "CLAUDE.md", "opencode.json", ".claude/commands/ROViral.md",
                 ".opencode/commands/ROViral.md", ".opencode/agents/roviral.md"):
        if not os.path.isfile(os.path.join(root, need)):
            errs.append(f"faltando {need}")
    return errs


def files_to_pack(root: str):
    for dp, dns, fns in os.walk(root):
        dns[:] = sorted(d for d in dns if d not in SKIP_DIRS)
        for fn in sorted(fns):
            if fn in SKIP_FILES or fn.endswith((".pyc", ".zip")):
                continue
            full = os.path.join(dp, fn)
            yield full, NAME + "/" + os.path.relpath(full, root).replace(os.sep, "/")


def validate_zip(path: str) -> list[str]:
    errs = []
    with zipfile.ZipFile(path) as z:
        names = z.namelist()
        bad = [n for n in names if not n.startswith(NAME + "/") or ".." in n or n.startswith("/")]
        if bad:
            errs.append(f"entradas fora de {NAME}/: {bad[:3]}")
        if NAME + "/SKILL.md" not in names:
            errs.append(f"{NAME}/SKILL.md ausente no zip")
        total = sum(i.file_size for i in z.infolist())
        if total > MAX_BYTES:
            errs.append(f"descompactado com {total // 1024 // 1024} MB (> {MAX_BYTES // 1024 // 1024} MB)")
        for n in names:
            if n.endswith((".py", ".md", ".json", ".luau")):
                try:
                    z.read(n).decode("utf-8")
                except UnicodeDecodeError:
                    errs.append(f"{n} não é UTF-8")
        if z.testzip() is not None:
            errs.append("zip corrompido")
    return errs


def main() -> int:
    for _s in (sys.stdout, sys.stderr):
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-o", "--saida", default=os.path.join(os.path.dirname(ROOT), "ROViral ULTRA.zip"))
    a = ap.parse_args()
    errs = check_skill(ROOT)
    if os.path.basename(ROOT) != NAME:
        print(f"aviso: a pasta do projeto se chama {os.path.basename(ROOT)!r}; dentro do zip ela vira {NAME!r} (exigência do Claude.ai)")
    if errs:
        print("\n".join("ERRO " + e for e in errs))
        return 1
    out = os.path.abspath(a.saida)
    if out.startswith(ROOT + os.sep):
        print("ERRO: a saída não pode ficar dentro da própria pasta do projeto")
        return 1
    tmp = out + ".tmp"
    n = 0
    with zipfile.ZipFile(tmp, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as z:
        for full, arc in files_to_pack(ROOT):
            z.write(full, arc)
            n += 1
    errs = validate_zip(tmp)
    if errs:
        os.remove(tmp)
        print("\n".join("ERRO " + e for e in errs))
        return 1
    os.replace(tmp, out)
    print(f"[ROViral ULTRA] {out} ok: {n} arquivos, {os.path.getsize(out) // 1024} KB. Um arquivo para Claude.ai, Claude Code e OpenCode.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
