#!/usr/bin/env python3
"""Mede a eficiência do ROViral ULTRA de verdade (nada estimado sem dizer).

  python scripts/bench_speed.py              tabela
  python scripts/bench_speed.py --json
  python scripts/bench_speed.py --comparar <pasta-da-versão-antiga>   mesma medição na versão antiga, lado a lado

Mede: (1) contexto carregado em TODA mensagem em cada ambiente (bytes e tokens aproximados = bytes/3,5);
(2) custo de começar uma tarefa típica: chamadas de ferramenta e bytes lidos no fluxo antigo (decide + abrir cada
arquivo indicado) vs `rv brief` (1 chamada); (3) tempo dos scripts (mediana de 5 execuções, relógio monotônico).
"""
from __future__ import annotations

import argparse
import json
import os
import re
import statistics
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
PEDIDOS = ["me dá 5 ideias virais de terror cooperativo", "crie um simulador de pets com loja e inventário",
           "faça a gui da loja igual a esta imagem", "estude o jogo tipo o doors e crie um jogo completo do zero"]


def body_bytes(path: str) -> int:
    if not os.path.isfile(path):
        return 0
    with open(path, encoding="utf-8") as f:
        t = f.read()
    return len(re.sub(r"\A---\n.*?\n---\n", "", t, flags=re.S).encode("utf-8"))


def always_loaded(root: str) -> dict:
    agent = next((p for p in (os.path.join(root, ".opencode", "agents", n) for n in ("roviral-ultra.md", "roviral.md", "ultra.md")) if os.path.isfile(p)), "")
    agents_md = body_bytes(os.path.join(root, "AGENTS.md"))
    claude_md = body_bytes(os.path.join(root, "CLAUDE.md"))
    return {"OpenCode (agente + AGENTS.md)": body_bytes(agent) + agents_md,
            "Claude Code (CLAUDE.md + AGENTS.md)": claude_md + agents_md}


def bootstrap(root: str, pedido: str) -> dict:
    py = sys.executable
    d = subprocess.run([py, os.path.join(root, "scripts", "decide.py"), pedido, "--json"], capture_output=True, cwd=root, check=False)
    try:
        r = json.loads(d.stdout.decode("utf-8"))
    except ValueError:
        return {"erro": "decide.py falhou"}
    skill_dir = next((p for p in (root, os.path.join(root, ".claude", "skills", "roviral-ultra"), os.path.join(root, ".claude", "skills", "ultra"))
                      if os.path.isfile(os.path.join(p, "references", "idea-engine.md")) or os.path.isdir(os.path.join(p, "references"))), root)
    files = []
    for t in r.get("skills", []):
        p = os.path.join(skill_dir, t) if t.startswith("references/") else os.path.join(root, ".opencode", "skills", t, "SKILL.md")
        if os.path.isfile(p):
            files.append(os.path.getsize(p))
    old = {"chamadas": 1 + len(files), "bytes": len(d.stdout) + sum(files)}
    rv_path = os.path.join(root, "scripts", "rv.py")
    if os.path.isfile(rv_path):
        b = subprocess.run([py, rv_path, "brief", pedido], capture_output=True, cwd=root, check=False)
        new = {"chamadas": 1, "bytes": len(b.stdout)}
    else:
        new = None
    return {"sem_brief": old, "com_brief": new}


def timing(root: str, args: list[str], n: int = 5) -> float | None:
    path = os.path.join(root, "scripts", args[0])
    if not os.path.isfile(path):
        return None
    ts = []
    for _ in range(n):
        t0 = time.perf_counter()
        subprocess.run([sys.executable, path] + args[1:], capture_output=True, cwd=root, check=False)
        ts.append(time.perf_counter() - t0)
    return round(1000 * statistics.median(ts))


def measure(root: str) -> dict:
    boots = [bootstrap(root, p) for p in PEDIDOS]
    return {
        "contexto_por_mensagem_bytes": always_loaded(root),
        "inicio_de_tarefa": {p: b for p, b in zip(PEDIDOS, boots)},  # noqa: B905 (Python 3.8 não tem strict=)
        "scripts_ms_mediana": {" ".join(a): timing(root, a) for a in (["rv.py", "brief", PEDIDOS[1]], ["decide.py", PEDIDOS[1]],
                                                                       ["idea_forge.py", "-n", "8"], ["skill_search.py", "loja", "inventario"],
                                                                       ["fastcheck.py"])},
    }


def tok(b: int) -> int:
    return round(b / 3.5)


def main() -> int:
    for _s in (sys.stdout, sys.stderr):
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--comparar", metavar="PASTA")
    a = ap.parse_args()
    cur = measure(ROOT)
    old = measure(os.path.abspath(a.comparar)) if a.comparar else None
    if a.json:
        print(json.dumps({"atual": cur, "antiga": old}, ensure_ascii=False, indent=2))
        return 0
    print("## Contexto carregado em toda mensagem (só o corpo; frontmatter é configuração)")
    for k, v in cur["contexto_por_mensagem_bytes"].items():
        extra = f" | antes: {old['contexto_por_mensagem_bytes'][k]} B (~{tok(old['contexto_por_mensagem_bytes'][k])} tokens)" if old else ""
        print(f"- {k}: {v} B (~{tok(v)} tokens){extra}")
    print("\n## Começo de tarefa (chamadas de ferramenta / bytes lidos)")
    for p, b in cur["inicio_de_tarefa"].items():
        s, n = b.get("sem_brief"), b.get("com_brief")
        if not s:
            print(f"- {p}: {b.get('erro')}")
            continue
        print(f"- {p}: sem brief {s['chamadas']} chamadas / {s['bytes']} B → com rv brief {n['chamadas']} chamada / {n['bytes']} B" if n else
              f"- {p}: {s['chamadas']} chamadas / {s['bytes']} B")
    print("\n## Tempo dos scripts (mediana de 5, ms)")
    for k, v in cur["scripts_ms_mediana"].items():
        extra = f" | antes: {old['scripts_ms_mediana'].get(k)}" if old else ""
        print(f"- {k}: {v if v is not None else 'não existe'}{extra}")
    print("\nTokens ≈ bytes/3,5 (aproximação para português; o número exato depende do modelo). Latência do modelo e do MCP não é medida aqui.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
