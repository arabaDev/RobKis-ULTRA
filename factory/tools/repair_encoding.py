#!/usr/bin/env python3
"""Repara BOM + mojibake (UTF-8 lido como Latin-1) + frontmatter duplicado
em todo o projeto. Idempotente: rodar duas vezes não causa dano.
"""
from __future__ import annotations
import sys
import os, re, json

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
MOJIBAKE_MARKERS = ("Ã", "Â", "â€")  # assinatura clássica de double-encoding
RUN_RE = re.compile(r"[\u0080-\u00ff]+")

stats = {"bom_stripped": 0, "mojibake_fixed": 0, "frontmatter_deduped": 0, "files_touched": 0}


def fix_mojibake(text: str) -> str:
    """Repara por trechos (runs de caracteres Latin-1), não o arquivo inteiro,
    pois o arquivo também contém caracteres Unicode legítimos (travessões etc.)
    que quebrariam um encode('latin1') global."""
    if not any(m in text for m in MOJIBAKE_MARKERS):
        return text

    def repl(m):
        run = m.group(0)
        try:
            fixed = run.encode("latin1").decode("utf-8")
        except UnicodeError:
            return run
        if fixed == run:
            return run
        return fixed

    return RUN_RE.sub(repl, text)


def dedupe_frontmatter(text: str) -> str:
    """Alguns SKILL.md têm dois blocos --- ... --- colados no topo
    (um genérico/placeholder + um real). Mantém só o mais completo."""
    m = re.match(r"^---\n(.*?)\n---\n\n?---\n(.*?)\n---\n\n?(.*)$", text, re.S)
    if not m:
        return text
    block1, block2, rest = m.groups()
    chosen = block1 if len(block1) >= len(block2) else block2
    return f"---\n{chosen}\n---\n\n{rest}"


def process_file(path: str):
    with open(path, "rb") as f:
        raw = f.read()
    had_bom = raw.startswith(b"\xef\xbb\xbf")
    if had_bom:
        raw = raw[3:]
    try:
        text = raw.decode("utf-8")
    except UnicodeDecodeError:
        return
    original = text
    text2 = fix_mojibake(text)
    mojibake_changed = text2 != text
    text = text2
    if path.endswith("SKILL.md"):
        text3 = dedupe_frontmatter(text)
        if text3 != text:
            stats["frontmatter_deduped"] += 1
        text = text3
    if had_bom or text != original:
        with open(path, "w", encoding="utf-8", newline="\n") as f:
            f.write(text)
        stats["files_touched"] += 1
        if had_bom:
            stats["bom_stripped"] += 1
        if mojibake_changed:
            stats["mojibake_fixed"] += 1


def main():
    # glob.glob ignora diretórios ocultos (ex.: .opencode) por padrão;
    # os.walk não tem esse problema e pega tudo recursivamente.
    exts = (".md", ".json", ".txt")
    for dirpath, _dirnames, filenames in os.walk(ROOT):
        for fn in filenames:
            if fn.endswith(exts):
                path = os.path.join(dirpath, fn)
                if path == os.path.abspath(__file__):
                    continue
                process_file(path)
    print(json.dumps(stats, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    main()
