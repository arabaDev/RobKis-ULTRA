#!/usr/bin/env python3
"""Regenera docs/SKILL_REGISTRY.md a partir do catálogo real em
.opencode/skills/*/SKILL.md. Nunca edite SKILL_REGISTRY.md à mão — ele fica
desatualizado silenciosamente (foi exatamente o que tinha acontecido: o
arquivo dizia 627/619 skills quando já existiam 682).

Uso:
    python scripts/build_index.py
"""
from __future__ import annotations
import os
import re
import sys

from _skill_index import SK_DIR, load_index

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "docs", "SKILL_REGISTRY.md")

_ID_RE = re.compile(r'^\s*id:\s*(\S+)', re.MULTILINE)
_DEPT_RE = re.compile(r'^\s*department:\s*"(.*)"', re.MULTILINE)


def department_of(path: str) -> tuple[str, str]:
    text = open(path, encoding="utf-8").read()
    id_m = _ID_RE.search(text)
    dept_m = _DEPT_RE.search(text)
    sid = id_m.group(1) if id_m else "SK-??-??"
    dept = dept_m.group(1) if dept_m else "(sem departamento)"
    return sid, dept


def main() -> int:
    skills = load_index()
    if not skills:
        print(f"nenhuma skill encontrada em {SK_DIR}; nada para gerar.")
        return 1

    by_dept: dict[str, list] = {}
    for sk in skills:
        sid, dept = department_of(sk.path)
        by_dept.setdefault(dept, []).append((sid, sk))
    for dept in by_dept:
        by_dept[dept].sort(key=lambda x: x[0])

    lines = [
        "# Registro de skills",
        "",
        f"Total registrado: **{len(skills)}** skills em **{len(by_dept)}** departamentos.",
        "Estados: ESTRUTURALMENTE VALIDADA: skill com SKILL.md legível e frontmatter completo.",
        "",
        "Skills registradas não são skills carregadas: cada tarefa carrega só as necessárias "
        "(`python scripts/skill_plan.py` ou `skill_search.py`).",
        "Estado acima de ESTRUTURALMENTE VALIDADA exige evidência em `docs/skills_evidence.json`.",
        "Gerado por `python scripts/build_index.py`; não edite à mão.",
        "",
    ]
    for dept in sorted(by_dept):
        entries = by_dept[dept]
        lines.append(f"## {dept} ({len(entries)})")
        for sid, sk in entries:
            desc = sk.description or "(sem descrição)"
            lines.append(f"- `{sid}` **{sk.name}** — {desc}")
        lines.append("")

    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, "w", encoding="utf-8") as f:
        f.write("\n".join(lines).rstrip("\n") + "\n")
    print(f"docs/SKILL_REGISTRY.md regenerado: {len(skills)} skills em {len(by_dept)} departamentos.")
    return 0


if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    sys.exit(main())
