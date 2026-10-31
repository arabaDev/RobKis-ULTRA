"""Índice leve de skills (.opencode/skills/*/SKILL.md) para busca rápida.

Sem dependências externas, sem rede, sem parse de YAML completo (só o front-
matter precisa de 2 campos: name e description, que sempre são a primeira
linha de cada chave em nosso formato — ver factory/build.py). Isso é proposital:
rápido de rodar em um catálogo de ~680 skills sem exigir pyyaml instalado.
"""
from __future__ import annotations

import math
import os
import re
import unicodedata
from collections import Counter
from dataclasses import dataclass, field

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SK_DIR = os.path.join(ROOT, ".opencode", "skills")

_NAME_RE = re.compile(r'^name:\s*(.+?)\s*$', re.MULTILINE)
_DESC_RE = re.compile(r'^description:\s*"(.*)"\s*$', re.MULTILINE)
_WHEN_RE = re.compile(r"\*\*Quando usar:\*\*\s*(.+)")


def _unescape(s: str) -> str:
    return s.replace('\\"', '"').replace("\\n", " ")


@dataclass
class Skill:
    name: str
    description: str
    when: str
    path: str
    tokens: Counter = field(default_factory=Counter)


def _normalize(s: str) -> str:
    s = unicodedata.normalize("NFKD", s.lower())
    return s.encode("ascii", "ignore").decode()


def _tokens(*parts: str) -> Counter:
    text = " ".join(parts)
    words = re.split(r"[^a-z0-9]+", _normalize(text))
    return Counter(w for w in words if len(w) > 2)


def load_index() -> list[Skill]:
    """Lê todas as SKILL.md e monta o índice. Tolerante a frontmatter
    incompleto (nunca derruba o processo inteiro por causa de um arquivo)."""
    skills: list[Skill] = []
    if not os.path.isdir(SK_DIR):
        return skills
    for entry in sorted(os.listdir(SK_DIR)):
        path = os.path.join(SK_DIR, entry, "SKILL.md")
        if not os.path.isfile(path):
            continue
        try:
            text = open(path, encoding="utf-8").read()
        except OSError:
            continue
        name_m = _NAME_RE.search(text)
        desc_m = _DESC_RE.search(text)
        when_m = _WHEN_RE.search(text)
        name = name_m.group(1).strip() if name_m else entry
        desc = _unescape(desc_m.group(1).strip()) if desc_m else ""
        when = when_m.group(1).strip() if when_m else ""
        sk = Skill(name=name, description=desc, when=when, path=path)
        sk.tokens = _tokens(name.replace("-", " ") * 2, desc, when)
        skills.append(sk)
    return skills


def search(query: str, skills: list[Skill] | None = None, limit: int = 10) -> list[tuple[float, Skill]]:
    """Busca por similaridade TF simples com peso idf — determinística, sem
    dependência externa. Retorna [(score, skill), ...] ordenado desc."""
    skills = skills if skills is not None else load_index()
    q_tokens = _tokens(query)
    if not q_tokens or not skills:
        return []
    df: Counter[str] = Counter()
    for sk in skills:
        for t in q_tokens:
            if sk.tokens[t] > 0:
                df[t] += 1
    n = len(skills)
    scored = []
    for sk in skills:
        score = 0.0
        for t, qc in q_tokens.items():
            if sk.tokens[t] > 0 and df[t] > 0:
                idf = math.log((n + 1) / df[t])
                score += idf * min(qc, sk.tokens[t])
        if score > 0:
            scored.append((score, sk))
    scored.sort(key=lambda x: (-x[0], x[1].name))
    return scored[:limit]
