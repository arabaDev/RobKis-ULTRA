#!/usr/bin/env python3
"""Testes do Viral Engine (idea_forge.py + viral_score.py). Rode: python scripts/test_viral.py"""
from __future__ import annotations
import sys as _sys
for _s in (_sys.stdout, _sys.stderr):  # console do Windows (cp1252)
    if hasattr(_s, "reconfigure"):
        _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
import copy, json, os, subprocess, sys, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import idea_forge, viral_score  # noqa: E402

FAILS: list[str] = []


def check(cond, msg):
    print(("ok     " if cond else "FALHOU ") + msg)
    if not cond:
        FAILS.append(msg)


db = idea_forge.load()
ids = [p["id"] for p in db["padroes"]]
check(len(ids) == len(set(ids)), "ids de padrões únicos")
need = {"id", "nome", "estrutura", "verbos", "por_que_funciona", "sinais", "momento_clipe", "gancho_retorno",
        "monetizacao_saudavel", "riscos", "saturacao", "referencias_genero", "twists"}
check(all(need <= set(p) for p in db["padroes"]), "todo padrão tem todos os campos")
check(all(p["saturacao"] in idea_forge.SAT for p in db["padroes"]), "saturação válida em todos os padrões")
check(all(len(p["twists"]) >= 3 for p in db["padroes"]), "todo padrão tem pelo menos 3 twists")
sinais_validos = {"play_through", "first_play_bounce", "play_days", "playtime", "co_play", "qualified_sessions", "spend_days"}
check(all(set(p["sinais"]) <= sinais_validos for p in db["padroes"]), "sinais citados existem no algoritmo documentado")

s1 = idea_forge.forge(db, 6, seed=7)
s2 = idea_forge.forge(db, 6, seed=7)
check(s1 == s2, "mesma seed = mesmo resultado")
check(len({s["padrao_principal"] for s in s1}) == 6, "6 sementes = 6 padrões principais diferentes")
check(len({s["tema"] for s in s1}) == 6, "6 sementes = 6 temas diferentes")
check(len({s["twist_id"] for s in s1}) == 6, "6 sementes = 6 twists diferentes")
check(all(s["padrao_principal"] != s["padrao_secundario"] for s in s1), "secundário nunca igual ao principal")
low = idea_forge.forge(db, 5, seed=1, max_sat="media")
check(all(s["saturacao_principal"] != "alta" for s in low), "--max-saturacao media exclui padrões saturados")
forced = idea_forge.forge(db, 3, seed=2, padrao="anomalia", tema="aeroporto")
check(all(s["padrao_principal"] == "anomalia" and s["tema"] == "aeroporto" for s in forced), "padrão e tema forçados respeitados")
check("## " in idea_forge.catalog_md(db) and "`anomalia`" in idea_forge.catalog_md(db), "catálogo Markdown gerado")

boa = viral_score.modelo()[0]
boa["nome"] = "Boa"
for i, k in enumerate(viral_score.CRITERIOS):
    boa["notas"][k]["nota"] = 8 + (i % 2)
boa["notas"]["retencao"].update(evidencia="verificado", fonte="protótipo: D1 interno")
r = viral_score.avaliar(boa)
check(r["veredito"] == "PROTOTIPAR" and not r["portoes_falhos"], f"ideia forte sem portão falho = PROTOTIPAR ({r['final']})")

ruim = copy.deepcopy(boa); ruim["nome"] = "Reskin"; ruim["portoes"]["nao_reskin"] = False
r = viral_score.avaliar(ruim)
check(r["final"] <= viral_score.LIMITE_PORTAO and "nao_reskin" in r["portoes_falhos"], "portão falho limita a nota a 6")

inflada = copy.deepcopy(boa); inflada["nome"] = "Inflada"
for k in viral_score.CRITERIOS:
    inflada["notas"][k].update(nota=10, evidencia="hipotese")
r = viral_score.avaliar(inflada)
check(any("inflação" in x for x in r["alertas"]), "detecta notas infladas")
check(any("nenhuma nota verificada" in x for x in r["alertas"]), "avisa quando tudo é hipótese")

semfonte = copy.deepcopy(boa); semfonte["notas"]["publico"].update(evidencia="verificado", fonte="")
check(any("sem fonte" in x for x in viral_score.avaliar(semfonte)["alertas"]), "verificado sem fonte é apontado")

longa = copy.deepcopy(boa); longa["frase_5s"] = " ".join(["palavra"] * 20)
check("frase_5s" in viral_score.avaliar(longa)["portoes_falhos"], "frase com mais de 15 palavras falha o portão")

check(abs(sum(p for p, _ in viral_score.CRITERIOS.values()) - 1.0) < 1e-9, "pesos somam 1")
gemea = copy.deepcopy(boa); gemea["nome"] = "Gêmea"
check(viral_score.diversidade([boa, gemea]), "detecta ideias parecidas demais no lote")

with tempfile.NamedTemporaryFile("w", suffix=".json", delete=False, encoding="utf-8") as f:
    json.dump([boa, ruim], f, ensure_ascii=False)
out = subprocess.run([sys.executable, os.path.join(HERE, "viral_score.py"), f.name], capture_output=True, text=True)
os.unlink(f.name)
check(out.returncode == 0 and "PROTOTIPAR" in out.stdout, "CLI do viral_score roda e ranqueia")
out = subprocess.run([sys.executable, os.path.join(HERE, "idea_forge.py"), "-n", "3", "--seed", "3"], capture_output=True, text=True)
check(out.returncode == 0 and "Semente 3" in out.stdout, "CLI do idea_forge roda")

ex = os.path.join(os.path.dirname(HERE), "references", "exemplos-ideias.json")
if os.path.isfile(ex):
    rk = {r["nome"]: r for r in (viral_score.avaliar(i) for i in json.load(open(ex, encoding="utf-8")))}
    check(rk["Corda Curta"]["portoes_falhos"] == ["motivo_voltar"] and rk["Corda Curta"]["final"] == 6.0, "exemplo calibrado: Corda Curta trava no portão de retorno")
    check(all(r["veredito"].startswith("AJUSTAR") for r in rk.values()), "exemplos-ideias.md continua coerente com o script")

print("\n" + ("todos passaram" if not FAILS else f"{len(FAILS)} falha(s)"))
sys.exit(1 if FAILS else 0)
