#!/usr/bin/env python3
"""rv — porta única e rápida do ROViral ULTRA (uma chamada no lugar de várias).

  python scripts/rv.py brief "<pedido>"        decide + o essencial de cada referência/skill em UMA saída (comece por aqui)
  python scripts/rv.py brief "<pedido>" --completo   imprime os arquivos inteiros em vez de resumos
  python scripts/rv.py brief "<pedido>" --imagens    o usuário mandou imagens de referência/prints
  python scripts/rv.py ideias [-n 8 ...]        = idea_forge.py
  python scripts/rv.py nota ideias.json         = viral_score.py
  python scripts/rv.py jogo <link|placeId> ...  = roblox_game.py (dados reais + --imagens para ver thumbnails)
  python scripts/rv.py web buscar "..." | web ler <url>   = web.py
  python scripts/rv.py img paleta|preparar|folha|comparar|info|baixar ...  = image_tool.py
  python scripts/rv.py skills <palavras>        = skill_search.py
  python scripts/rv.py check [--level 2|3]      = fastcheck.py
  python scripts/rv.py decide "<pedido>"        = decide.py

Por que é mais rápido: o agente gasta mais tempo em idas e vindas (decidir, abrir 5 arquivos, buscar skill) do que
em qualquer script. O `brief` entrega decisão + trechos essenciais numa chamada só, e um único prefixo de comando
(`python scripts/rv.py`) pode ser liberado de uma vez nas permissões, sem pedir aprovação a cada script.
"""
from __future__ import annotations

import os
import re
import runpy
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from _common import ROOT, skill_dir, utf8_console  # noqa: E402

TOOLS = {"ideias": "idea_forge.py", "nota": "viral_score.py", "jogo": "roblox_game.py", "web": "web.py", "img": "image_tool.py",
         "skills": "skill_search.py", "check": "fastcheck.py", "decide": "decide.py", "plano": "skill_plan.py"}
PER_FILE = 1500
TOTAL = 9000
KEY_HEADINGS = re.compile(r"(regra|procedimento|passo|checklist|como|fluxo|portões|veredito|verifica|formato|anti|princípio|testes de fogo|quando usar|funil|anatomia|papéis|fases|onde pesquisar|teardown|limites)", re.I)


def resolve(target: str) -> str | None:
    if target.startswith("references/"):
        p = os.path.join(skill_dir(), target)
        return p if os.path.isfile(p) else None
    p = os.path.join(ROOT, ".opencode", "skills", target, "SKILL.md")
    return p if os.path.isfile(p) else None


def essentials(path: str, limit: int = PER_FILE) -> str:
    """Resumo determinístico: descrição + seções-chave (regras, procedimento, checklist...), sem blocos de código longos."""
    with open(path, encoding="utf-8") as f:
        text = f.read()
    desc = ""
    m = re.match(r"---\n(.*?)\n---\n", text, re.S)
    if m:
        d = re.search(r'^description:\s*"?(.*?)"?\s*$', m.group(1), re.M)
        desc = d.group(1) if d else ""
        text = text[m.end():]
    out, keep, in_code, code_lines = [], True, False, 0
    for line in text.splitlines():
        if line.startswith("```"):
            in_code = not in_code
            code_lines = 0
            continue
        if in_code:
            code_lines += 1
            if keep and code_lines <= 6:
                out.append("    " + line)
            continue
        if line.startswith("#"):
            keep = bool(KEY_HEADINGS.search(line)) or line.startswith("# ")
            if keep and not line.startswith("# "):
                out.append(line)
            continue
        s = line.strip()
        if keep and s and (s[0] in "-*|0123456789`" or s.startswith("**")):
            out.append(line)
    body = "\n".join(out)
    if len(body) > limit:
        body = body[:limit].rsplit("\n", 1)[0] + "\n    [...] (abra o arquivo se precisar do resto)"
    return (f"> {desc}\n" if desc else "") + body


def brief(request: str, full: bool = False, images: bool = False) -> int:
    import decide  # noqa: E402 (import tardio: só quando o comando é brief)
    r = decide.decide(request, has_images=images)
    print(f"# brief ROViral ULTRA\npedido: {request}")
    print(f"modo: {r['modo']} | gênero: {r.get('genero')} | complexidade: {r['complexidade']}/5 | tipos: {', '.join(r['tipos'])} | Fast Check nível {r.get('fastcheck_nivel', '?')}")
    for k in ("estilo_gui", "estilos_build", "abordagem"):
        if r.get(k):
            print(f"{k}: {r[k] if isinstance(r[k], str) else ', '.join(map(str, r[k]))}")
    for q in r.get("perguntas", []):
        print(f"PERGUNTA ESSENCIAL: {q}")
    tipos = set(r["tipos"])
    cmds = []
    if tipos & {"viral"}:
        cmds += ['python scripts/rv.py ideias -n 8 --max-saturacao media', "python scripts/rv.py nota ideias.json  (formato: rv nota --modelo)"]
    if tipos & {"estudo", "pesquisa"}:
        cmds += ['python scripts/rv.py jogo <link-do-jogo> --imagens .roviral/img   (dados reais + thumbnails para ver)',
                 'python scripts/rv.py web buscar "<nicho> roblox 2026"   (se não houver ferramenta de web nativa)']
    if images or "imagem" in tipos:
        cmds += ["abra cada imagem anexada com a ferramenta de leitura (Read/read) ANTES de decidir estilo; várias? rv img folha",
                 "python scripts/rv.py img paleta <imagem>   (hex exatos para o tema)"]
    if (tipos & {"gui", "build"}) and not (tipos & {"bug"}):
        cmds += ["python scripts/rv.py img paleta <referência>   (cores exatas da imagem do usuário)",
                 "python scripts/rv.py img folha <imgs...> -o .roviral/img/refs.png   (várias referências numa leitura)"]
    cmds.append(f"python scripts/rv.py check{' --level 3' if r['complexidade'] >= 4 else ''}   (depois de editar)")
    print("\n## comandos sugeridos\n" + "\n".join("- " + c for c in cmds))
    print("\n## leitura (essencial já incluído abaixo; abra o arquivo inteiro só se faltar algo)")
    used = 0
    for t in r["skills"]:
        p = resolve(t)
        if not p:
            print(f"\n### {t}\n(não encontrado neste ambiente)")
            continue
        rel = os.path.relpath(p, ROOT).replace(os.sep, "/")
        if full:
            with open(p, encoding="utf-8") as f:
                chunk = f.read()
        else:
            chunk = essentials(p)
        if not full and used + len(chunk) > TOTAL:
            print(f"\n### {t} → {rel}\n(orçamento do brief atingido: abra se for necessário)")
            continue
        used += len(chunk)
        print(f"\n### {t} → {rel}\n{chunk}")
    for s in r.get("suposicoes", []):
        print(f"\nassumido: {s}")
    return 0


def main(argv: list[str] | None = None) -> int:
    utf8_console()
    argv = list(sys.argv[1:] if argv is None else argv)
    if not argv or argv[0] in ("-h", "--help", "ajuda"):
        print(__doc__)
        return 0
    cmd, rest = argv[0], argv[1:]
    if cmd == "brief":
        full = "--completo" in rest
        images = "--imagens" in rest
        words = [w for w in rest if w not in ("--completo", "--imagens")]
        if not words:
            print("uso: python scripts/rv.py brief \"<pedido>\"", file=sys.stderr)
            return 2
        return brief(" ".join(words), full, images)
    if cmd not in TOOLS:
        print(f"comando desconhecido: {cmd}. Use: brief, " + ", ".join(TOOLS), file=sys.stderr)
        return 2
    path = os.path.join(HERE, TOOLS[cmd])
    if not os.path.isfile(path):
        print(f"{TOOLS[cmd]} não existe neste pacote (no zip do Claude.ai só vêm os scripts essenciais).", file=sys.stderr)
        return 2
    old = sys.argv
    sys.argv = [path] + rest
    try:
        runpy.run_path(path, run_name="__main__")
    except SystemExit as e:
        code = e.code
        return code if isinstance(code, int) else (0 if code is None else 1)
    finally:
        sys.argv = old
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except BrokenPipeError:  # saída cortada por "| head": não é erro (receita da documentação do Python)
        os.dup2(os.open(os.devnull, os.O_WRONLY), sys.stdout.fileno())
        sys.exit(0)
    except KeyboardInterrupt:
        sys.exit(130)
