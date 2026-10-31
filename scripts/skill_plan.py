#!/usr/bin/env python3
"""Sugere a menor equipe de skills para uma tarefa, a partir do catálogo real
(.opencode/skills/*/SKILL.md) — nunca uma lista inventada.

Uso:
    python scripts/skill_plan.py "crie um sistema de cooldown de habilidade"
    python scripts/skill_plan.py --max 5 "jogo de terror com obby"

Regra do agente: "registrar não é carregar" — isto só SUGERE nomes de skill;
quem decide ler o SKILL.md de cada uma (menos de 5 por tarefa) é o agente.
"""
from __future__ import annotations
import argparse
import sys

from _skill_index import load_index, search


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("task", help="descrição da tarefa, em linguagem natural")
    ap.add_argument("--max", type=int, default=5, help="máximo de skills sugeridas (padrão 5)")
    args = ap.parse_args()

    skills = load_index()
    if not skills:
        print("catálogo vazio: nenhuma SKILL.md encontrada em .opencode/skills.")
        return 1

    results = search(args.task, skills, limit=args.max)
    if not results:
        print(f"nenhuma skill relevante encontrada para: {args.task!r}")
        print("tente palavras mais específicas (ex.: nome do sistema, gênero do jogo, tipo de bug).")
        return 1

    print(f"equipe sugerida para: {args.task!r}\n")
    for _score, sk in results:
        print(f"  `{sk.name}` — {sk.description or '(sem descrição)'}")
    print(f"\n{len(results)} skill(s) sugerida(s) de {len(skills)} no catálogo. "
          "Leia o SKILL.md só das que forem usadas de fato.")
    return 0


if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    sys.exit(main())
