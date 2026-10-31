#!/usr/bin/env python3
"""Valida a saúde estrutural do projeto inteiro: YAML de agentes/comandos/skills,
mojibake, referências a skills inexistentes e config do(s) agente(s).

Uso:
    python scripts/validate_agent.py           # tudo
    python scripts/validate_agent.py --agent roviral   # só um agente + skills citadas por ele

Saída: 0 se limpo, 1 se achou algo. Não corrige nada sozinho — só aponta.
"""
from __future__ import annotations
import argparse
import os
import re
import sys

try:
    import yaml
except ImportError:
    yaml = None

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
AGENTS = os.path.join(ROOT, ".opencode", "agents")
COMMANDS = os.path.join(ROOT, ".opencode", "commands")
SKILLS = os.path.join(ROOT, ".opencode", "skills")
CLAUDE = os.path.join(ROOT, ".claude")
# nomes com hífen que NÃO são skills (ferramentas externas e rótulos de triagem): não são referências quebradas
NOT_SKILLS = {"luau-analyze", "ready-to-build", "needs-triage", "needs-info", "needs-human"}

FRONTMATTER_RE = re.compile(r"\A---\n(.*?)\n---\n", re.DOTALL)
REF_RE = re.compile(r"`([a-z0-9]+(?:-[a-z0-9]+)+)`")
MOJIBAKE_RE = re.compile(r"Ã[£§©ºª«»¢¬µ¼½¾±]|â€[\x9c\x9d\x99\x93\x94]")


def iter_md(base):
    if not os.path.isdir(base):
        return
    for root, _, files in os.walk(base):
        for fn in files:
            if fn.endswith(".md"):
                yield os.path.join(root, fn)


def check_yaml(path, problems):
    text = open(path, encoding="utf-8", errors="replace").read()
    m = FRONTMATTER_RE.match(text)
    if not m:
        return None
    if yaml is None:
        return None
    try:
        return yaml.safe_load(m.group(1))
    except Exception as e:
        problems.append(f"YAML quebrado: {path}: {str(e).splitlines()[0]}")
        return None


def check_mojibake(path, problems):
    text = open(path, encoding="utf-8", errors="replace").read()
    if MOJIBAKE_RE.search(text):
        problems.append(f"mojibake residual: {path}")


def known_skill_names():
    names = set(NOT_SKILLS)
    if os.path.isdir(AGENTS):  # nomes de agentes/subagentes também são referências válidas
        names |= {fn[:-3] for fn in os.listdir(AGENTS) if fn.endswith(".md")}
    for base in (SKILLS, os.path.join(CLAUDE, "skills")):
        if os.path.isdir(base):
            for entry in os.listdir(base):
                if os.path.isfile(os.path.join(base, entry, "SKILL.md")):
                    names.add(entry)
    return names


def check_skill_refs(path, known, problems):
    text = open(path, encoding="utf-8", errors="replace").read()
    for ref in set(REF_RE.findall(text)):
        if ref not in known:
            problems.append(f"referência a skill possivelmente inexistente: {path} -> `{ref}`")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--agent", help="valida só um agente específico (por nome de arquivo sem .md)")
    ap.add_argument("--no-ref-check", action="store_true",
                     help="pula a checagem de referência a skill (tem falsos positivos: nomes de ferramenta externa como luau-analyze)")
    args = ap.parse_args()

    problems: list[str] = []
    known = known_skill_names()

    targets = []
    if args.agent:
        p = os.path.join(AGENTS, f"{args.agent}.md")
        if not os.path.isfile(p):
            print(f"agente não encontrado: {p}")
            return 1
        targets = [p]
    else:
        targets = (list(iter_md(AGENTS)) + list(iter_md(COMMANDS)) + list(iter_md(SKILLS))
                   + [f for f in iter_md(CLAUDE) if os.sep + "references" + os.sep not in f])

    for path in targets:
        check_yaml(path, problems)
        check_mojibake(path, problems)
        if not args.no_ref_check:
            check_skill_refs(path, known, problems)

    if yaml is None:
        print("aviso: pyyaml não instalado — checagem de YAML pulada (pip install pyyaml --break-system-packages).")

    if problems:
        print(f"{len(problems)} problema(s) encontrado(s):\n")
        for p in problems:
            print(" -", p)
        return 1
    print(f"OK: {len(targets)} arquivo(s) validados, {len(known)} skills no catálogo, nenhum problema encontrado.")
    return 0


if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    sys.exit(main())
