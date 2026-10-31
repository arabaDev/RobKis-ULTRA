#!/usr/bin/env python3
"""Busca rápida no catálogo de skills (carregamento inteligente: leia só as poucas que importam).

  python scripts/skill_search.py ui inventario loja      -> até 8 skills mais relevantes (nome, id, caminho)
  python scripts/skill_search.py --top 5 cooldown remote

Usa docs/skills_index.json e, para skills que ainda não estão no índice, lê só o frontmatter do SKILL.md.
Rank: casamento no nome pesa 3x, na descrição 1x. Também importável: search(words, top) -> lista de tuplas.
"""
from __future__ import annotations
import argparse, json, os, re, sys, unicodedata

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SKILLS_DIR = os.path.join(ROOT, ".opencode", "skills")
CLAUDE_SKILLS_DIR = os.path.join(ROOT, ".claude", "skills")

def norm(s):
    return unicodedata.normalize("NFKD", s.lower()).encode("ascii", "ignore").decode()

def toks(s):
    return [t for t in re.split(r"[^a-z0-9]+", norm(s)) if len(t) > 1]

def _frontmatter(path):
    try:
        head = open(path, encoding="utf-8-sig").read(1500)
    except OSError:
        return None
    desc = re.search(r'^description:\s*"?(.*?)"?\s*$', head, re.M)
    sid = re.search(r"^\s+id:\s*(\S+)", head, re.M)
    return (desc.group(1) if desc else "", sid.group(1) if sid else "?")

def load_entries():
    idx_path = os.path.join(ROOT, "docs", "skills_index.json")
    entries = []
    if os.path.isfile(idx_path):
        index = json.load(open(idx_path, encoding="utf-8-sig"))
        entries = [(e["name"], e.get("id", "?"), e.get("description", ""), e["path"]) for e in index]
    known = {e[0] for e in entries}
    for base, rel in ((SKILLS_DIR, ".opencode/skills"), (CLAUDE_SKILLS_DIR, ".claude/skills")):
        if not os.path.isdir(base):
            continue
        for d in sorted(os.listdir(base)):
            p = os.path.join(base, d, "SKILL.md")
            if d not in known and os.path.isfile(p):
                fm = _frontmatter(p)
                if fm:
                    entries.append((d, fm[1], fm[0], "%s/%s/SKILL.md" % (rel, d)))
    return entries

def search(words, top=8):
    query = [t for w in words for t in toks(w)]
    scored = []
    for name, sid, desc, path in load_entries():
        name_t, desc_t = set(toks(name)), set(toks(desc))
        s = sum(3 for t in query if t in name_t) + sum(1 for t in query if t in desc_t)
        if s:
            scored.append((-s, name, sid, path))
    scored.sort()
    return [(n, i, p) for _, n, i, p in scored[:top]]

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("words", nargs="+")
    ap.add_argument("--top", type=int, default=8)
    a = ap.parse_args()
    results = search(a.words, a.top)
    for name, sid, path in results:
        print(f"{name:34} {sid:9} {path}")
    if not results:
        print("nenhuma skill encontrada", file=sys.stderr)

if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    main()
