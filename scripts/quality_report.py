#!/usr/bin/env python3
"""Relatório de qualidade do catálogo de skills — acha problemas de conteúdo
que YAML válido não pega (isso é checado por validate_agent.py): descrição
curta demais, skill sem seção de verificação, skill de fluxo sem nenhuma
skill complementar, frontmatter duplicado sobrando, cauda stub grudada.

Uso:
    python scripts/quality_report.py
    python scripts/quality_report.py --min-desc 20
"""
from __future__ import annotations
import argparse
import re
import sys

from _skill_index import SK_DIR, load_index

DUP_FRONTMATTER_RE = re.compile(r"\A---\n.*?\n---\n\s*---\n", re.DOTALL)
STUB_TAIL_RE = re.compile(r"\*\*Quando usar:\*\* Quando houver demanda relacionada a")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--min-desc", type=int, default=15,
                     help="tamanho mínimo aceitável de description, em caracteres (padrão 15)")
    args = ap.parse_args()

    skills = load_index()
    if not skills:
        print(f"nenhuma skill encontrada em {SK_DIR}.")
        return 1

    issues: dict[str, list[str]] = {
        "descrição curta": [],
        "sem seção de verificação": [],
        "frontmatter duplicado": [],
        "cauda stub residual": [],
        "sem 'quando usar'": [],
    }

    for sk in skills:
        text = open(sk.path, encoding="utf-8").read()
        if len(sk.description) < args.min_desc:
            issues["descrição curta"].append(sk.name)
        if "verifica" not in text.lower() and "Verificação" not in text:
            issues["sem seção de verificação"].append(sk.name)
        if DUP_FRONTMATTER_RE.match(text):
            issues["frontmatter duplicado"].append(sk.name)
        if STUB_TAIL_RE.search(text):
            issues["cauda stub residual"].append(sk.name)
        if not sk.when:
            issues["sem 'quando usar'"].append(sk.name)

    total_issues = sum(len(v) for v in issues.values())
    print(f"catálogo: {len(skills)} skills\n")
    for label, names in issues.items():
        if not names:
            print(f"✓ {label}: nenhuma")
            continue
        print(f"✗ {label}: {len(names)}")
        for n in names[:10]:
            print(f"    - {n}")
        if len(names) > 10:
            print(f"    ... e mais {len(names) - 10}")
    print(f"\ntotal de problemas: {total_issues}")
    return 1 if total_issues else 0


if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    sys.exit(main())
