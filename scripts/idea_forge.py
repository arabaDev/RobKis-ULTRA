#!/usr/bin/env python3
"""ROViral Idea Forge: gera SEMENTES de ideias virais diferentes entre si (só biblioteca padrão).

  python scripts/idea_forge.py                       5 sementes, temas e padrões todos diferentes
  python scripts/idea_forge.py -n 8 --seed 42        reproduzível
  python scripts/idea_forge.py --max-saturacao media evita padrões com saturação alta
  python scripts/idea_forge.py --padrao anomalia     força um padrão principal
  python scripts/idea_forge.py --tema "fundo do mar" força um tema
  python scripts/idea_forge.py --json                saída estruturada (entrada para o dossiê)
  python scripts/idea_forge.py --catalogo            imprime o catálogo de padrões em Markdown

Semente NÃO é ideia pronta: é um ponto de partida combinatório (padrão + padrão secundário + tema + twist +
multiplicador social + gancho de retorno) que o agente precisa transformar em conceito com o método de
references/idea-engine.md e avaliar com scripts/viral_score.py. O objetivo do script é forçar DIVERSIDADE
(nenhum padrão principal, tema ou twist repetido no lote) e fugir do primeiro clichê que vem à cabeça.
"""
from __future__ import annotations
import argparse, json, os, random, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CANDIDATES = [os.path.join(ROOT, "references", "viral_patterns.json")]
SAT = {"baixa": 0, "media": 1, "alta": 2}


def load():
    for p in CANDIDATES:
        if os.path.isfile(p):
            with open(p, encoding="utf-8") as f:
                return json.load(f)
    sys.exit("viral_patterns.json não encontrado (procurei na pasta references/ da skill roviral-ultra)")


def compatible(a, b):
    """Padrões secundários precisam trazer um verbo novo, senão a mistura é só repetição."""
    return a["id"] != b["id"] and not set(a["verbos"]) >= set(b["verbos"])


def forge(db, n=5, seed=None, max_sat="alta", padrao=None, tema=None):
    rng = random.Random(seed)
    pats = [p for p in db["padroes"] if SAT[p["saturacao"]] <= SAT[max_sat]]
    if padrao:
        forced = [p for p in db["padroes"] if p["id"] == padrao]
        if not forced:
            raise SystemExit(f"padrão desconhecido: {padrao}. Use --catalogo para ver os ids.")
    if not pats and not padrao:
        raise SystemExit("nenhum padrão com essa saturação máxima")
    primaries = list(pats)
    rng.shuffle(primaries)
    # menos saturado primeiro, mas sem eliminar diversidade
    primaries.sort(key=lambda p: SAT[p["saturacao"]])
    themes = list(db["temas"]); rng.shuffle(themes)
    twists = list(db["operadores_twist"]); rng.shuffle(twists)
    socials = list(db["multiplicadores_sociais"]); rng.shuffle(socials)
    hooks = list(db["ganchos_retorno"]); rng.shuffle(hooks)
    out = []
    used_secondary = set()
    for i in range(n):
        prim = forced[0] if padrao else primaries[i % len(primaries)]
        sec_pool = [p for p in db["padroes"] if compatible(prim, p) and p["id"] not in used_secondary
                    and (padrao or p["id"] not in {x["id"] for x in primaries[:n]})]
        if not sec_pool:
            sec_pool = [p for p in db["padroes"] if compatible(prim, p)]
        sec = rng.choice(sec_pool)
        used_secondary.add(sec["id"])
        out.append({
            "n": i + 1,
            "padrao_principal": prim["id"],
            "padrao_principal_nome": prim["nome"],
            "padrao_secundario": sec["id"],
            "padrao_secundario_nome": sec["nome"],
            "tema": tema or themes[i % len(themes)],
            "twist": twists[i % len(twists)]["texto"],
            "twist_id": twists[i % len(twists)]["id"],
            "twist_exemplo_do_padrao": rng.choice(prim["twists"]),
            "multiplicador_social": socials[i % len(socials)],
            "gancho_retorno": hooks[i % len(hooks)],
            "verbos": sorted(set(prim["verbos"]) | set(sec["verbos"][:1])),
            "saturacao_principal": prim["saturacao"],
            "riscos_herdados": prim["riscos"],
            "referencias_de_padrao": prim["referencias_genero"],
        })
    return out


def catalog_md(db):
    lines = ["# Catálogo de padrões virais (gerado de references/viral_patterns.json)", "",
             f"> {db['aviso']}", "",
             "| id | padrão | verbos | saturação (out/2026, estimativa) | sinais do algoritmo |", "|---|---|---|---|---|"]
    for p in db["padroes"]:
        lines.append(f"| `{p['id']}` | {p['nome']} | {', '.join(p['verbos'])} | {p['saturacao']} | {', '.join(p['sinais'])} |")
    for p in db["padroes"]:
        lines += ["", f"## {p['nome']} (`{p['id']}`)", "",
                  f"- **Estrutura:** {p['estrutura']}",
                  f"- **Por que funciona:** {p['por_que_funciona']}",
                  f"- **Momento de clipe:** {p['momento_clipe']}",
                  f"- **Gancho de retorno:** {p['gancho_retorno']}",
                  f"- **Monetização saudável:** {p['monetizacao_saudavel']}",
                  f"- **Riscos:** {'; '.join(p['riscos'])}",
                  f"- **Referências de padrão (não copiar):** {', '.join(p['referencias_genero'])}",
                  "- **Twists possíveis:** " + " · ".join(p["twists"])]
    return "\n".join(lines) + "\n"


def render(seeds):
    out = []
    for s in seeds:
        out.append(
            f"### Semente {s['n']}: {s['padrao_principal_nome']} + {s['padrao_secundario_nome']} · tema: {s['tema']}\n"
            f"- Twist (operador): {s['twist']}\n"
            f"- Twist sugerido pelo padrão: {s['twist_exemplo_do_padrao']}\n"
            f"- Multiplicador social: {s['multiplicador_social']}\n"
            f"- Gancho de retorno: {s['gancho_retorno']}\n"
            f"- Verbos: {', '.join(s['verbos'])} · saturação do padrão principal: {s['saturacao_principal']}\n"
            f"- Riscos herdados: {'; '.join(s['riscos_herdados'])}\n")
    out.append("Próximo passo: transforme cada semente em conceito (frase de 5 s, primeiros 60 s, loop, retorno D1/D7/D28), "
               "descarte as fracas e avalie com scripts/viral_score.py.")
    return "\n".join(out)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-n", type=int, default=5)
    ap.add_argument("--seed", type=int)
    ap.add_argument("--max-saturacao", choices=list(SAT), default="alta")
    ap.add_argument("--padrao")
    ap.add_argument("--tema")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--catalogo", action="store_true")
    a = ap.parse_args()
    db = load()
    if a.catalogo:
        print(catalog_md(db)); return
    if a.n < 1 or a.n > 20:
        sys.exit("-n deve ficar entre 1 e 20")
    seeds = forge(db, a.n, a.seed, a.max_saturacao, a.padrao, a.tema)
    print(json.dumps(seeds, ensure_ascii=False, indent=2) if a.json else render(seeds))


if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    main()
