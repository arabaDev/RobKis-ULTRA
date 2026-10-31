#!/usr/bin/env python3
"""ROViral Viral Score: avalia ideias com a rubrica de 9 critérios (0-10), portões eliminatórios e
checagens de honestidade. Só biblioteca padrão.

  python scripts/viral_score.py ideias.json            tabela + diagnóstico
  python scripts/viral_score.py ideias.json --json     saída estruturada
  python scripts/viral_score.py --modelo               imprime um JSON-modelo de ideia para preencher

Pesos alinhados aos sinais do "Recommended For You" do Roblox (atualização de 2026: janela de 28 dias,
play-through rate, first-play bounce, play days D1/D2-7/D8-28, playtime, co-play, spend). A nota é uma
HIPÓTESE de potencial para priorizar protótipos, nunca previsão de sucesso. Detalhes em references/viral-scorecard.md.
"""
from __future__ import annotations
import argparse, json, re, sys

CRITERIOS = {
    # critério: (peso, sinal do algoritmo que ele aproxima)
    "retencao": (0.18, "play days D1 / D2-7 / D8-28"),
    "diversao_imediata": (0.14, "first-play bounce (<60 s e 61-180 s)"),
    "compreensao": (0.10, "play-through rate e bounce"),
    "compartilhamento": (0.12, "co-play intencional e clipes"),
    "diferenciacao": (0.10, "penalidade de jogo não único"),
    "originalidade": (0.08, "Standout / curadoria"),
    "viabilidade": (0.12, "chance real de terminar bem feito"),
    "expansao": (0.08, "updates e live ops sustentam D8-28"),
    "publico": (0.08, "playtime e spend do público certo"),
}
PORTOES = {
    "frase_5s": "A ideia cabe em uma frase de até 15 palavras que uma criança repete",
    "diversao_60s": "Existe um momento divertido nos primeiros 60 segundos, sem tutorial longo",
    "motivo_voltar": "Existe um motivo concreto para voltar amanhã E na semana 2-4",
    "motivo_amigo": "Jogar com amigo é melhor que jogar sozinho",
    "nao_reskin": "Muda pelo menos 3 coisas estruturais em relação à referência (não só tema/nome)",
    "mvp_viavel": "Um MVP jogável cabe no prazo/equipe declarados",
    "thumbnail_honesta": "A thumbnail/título promete exatamente o que o jogo entrega (sem giveaway)",
}
EVIDENCIAS = {"verificado", "estimativa", "hipotese"}
LIMITE_PORTAO = 6.0


def modelo():
    return [{
        "nome": "Nome curto",
        "frase_5s": "Plante monstros de dia, sobreviva a eles à noite",
        "padroes": ["crescimento-tempo-real", "sobrevivencia-coop-noites"],
        "referencias": ["Grow a Garden (padrão de crescimento)"],
        "mvp_dias": 3,
        "notas": {k: {"nota": 7, "evidencia": "hipotese", "motivo": "por quê, em uma frase", "fonte": ""} for k in CRITERIOS},
        "portoes": {k: True for k in PORTOES},
    }]


def norm_words(s):
    return set(w for w in re.findall(r"[a-z0-9áéíóúâêôãõç]+", (s or "").lower()) if len(w) > 3)


def avaliar(ideia):
    alertas, notas = [], ideia.get("notas", {})
    total = 0.0
    for crit, (peso, _) in CRITERIOS.items():
        n = notas.get(crit)
        if not isinstance(n, dict) or not isinstance(n.get("nota"), (int, float)):
            alertas.append(f"critério '{crit}' sem nota numérica (contado como 0)")
            continue
        v = float(n["nota"])
        if not 0 <= v <= 10:
            alertas.append(f"'{crit}' fora de 0-10 ({v}); limitado")
            v = max(0.0, min(10.0, v))
        ev = n.get("evidencia")
        if ev not in EVIDENCIAS:
            alertas.append(f"'{crit}' sem rótulo de evidência (verificado|estimativa|hipotese)")
        if ev == "verificado" and not n.get("fonte"):
            alertas.append(f"'{crit}' marcado como verificado sem fonte: trate como estimativa")
        if not (n.get("motivo") or "").strip():
            alertas.append(f"'{crit}' sem motivo escrito")
        total += v * peso
    vals = [notas[c]["nota"] for c in CRITERIOS if isinstance(notas.get(c), dict) and isinstance(notas[c].get("nota"), (int, float))]
    if vals and min(vals) >= 9:
        alertas.append("todas as notas >= 9: provável inflação; reavalie com olhar de concorrente")
    if vals and len(set(vals)) == 1 and len(vals) == len(CRITERIOS):
        alertas.append("todas as notas iguais: avaliação não discriminou nada")
    if sum(1 for c in CRITERIOS if isinstance(notas.get(c), dict) and notas[c].get("evidencia") == "verificado") == 0:
        alertas.append("nenhuma nota verificada: ranking é 100% hipótese até haver protótipo/métrica")
    frase = ideia.get("frase_5s", "")
    if len(frase.split()) > 15:
        alertas.append(f"frase de 5 s com {len(frase.split())} palavras (máx. 15)")
    portoes = ideia.get("portoes", {})
    falhas = [k for k in PORTOES if portoes.get(k) is not True]
    if len(frase.split()) > 15 and "frase_5s" not in falhas:
        falhas.append("frase_5s")
    final = round(min(total, LIMITE_PORTAO) if falhas else total, 2)
    if falhas:
        veredito = "AJUSTAR (portão falhou)" if total >= LIMITE_PORTAO else "DESCARTAR"
    elif final >= 7.5:
        veredito = "PROTOTIPAR"
    elif final >= 6.0:
        veredito = "AJUSTAR"
    else:
        veredito = "DESCARTAR"
    fracos = sorted((notas[c]["nota"], c) for c in CRITERIOS if isinstance(notas.get(c), dict) and isinstance(notas[c].get("nota"), (int, float)))[:2]
    return {"nome": ideia.get("nome", "?"), "bruta": round(total, 2), "final": final, "veredito": veredito,
            "portoes_falhos": falhas, "alertas": alertas, "pontos_fracos": [c for _, c in fracos]}


def similaridade(a, b):
    sa = set(a.get("padroes", [])) | norm_words(a.get("frase_5s"))
    sb = set(b.get("padroes", [])) | norm_words(b.get("frase_5s"))
    if not sa or not sb:
        return 0.0
    return len(sa & sb) / len(sa | sb)


def diversidade(ideias):
    avisos = []
    for i in range(len(ideias)):
        for j in range(i + 1, len(ideias)):
            s = similaridade(ideias[i], ideias[j])
            if s >= 0.5:
                avisos.append(f"'{ideias[i].get('nome')}' e '{ideias[j].get('nome')}' são parecidas demais ({s:.0%}): troque uma por algo realmente diferente")
        if ideias[i].get("padroes") and ideias[i]["padroes"][0] in [x.get("padroes", [None])[0] for x in ideias[:i]]:
            avisos.append(f"'{ideias[i].get('nome')}' repete o padrão principal de outra ideia do lote")
    return avisos


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("arquivo", nargs="?")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--modelo", action="store_true")
    a = ap.parse_args()
    if a.modelo:
        print(json.dumps(modelo(), ensure_ascii=False, indent=2)); return 0
    if not a.arquivo:
        ap.error("informe o arquivo JSON de ideias (ou --modelo)")
    with open(a.arquivo, encoding="utf-8-sig") as f:
        ideias = json.load(f)
    if isinstance(ideias, dict):
        ideias = [ideias]
    res = sorted((avaliar(i) for i in ideias), key=lambda r: -r["final"])
    div = diversidade(ideias) if len(ideias) > 1 else []
    if a.json:
        print(json.dumps({"ranking": res, "diversidade": div, "pesos": {k: v[0] for k, v in CRITERIOS.items()}}, ensure_ascii=False, indent=2))
        return 0
    print("| # | ideia | nota | veredito | portões falhos | pontos fracos |")
    print("|---|---|---|---|---|---|")
    for k, r in enumerate(res, 1):
        print(f"| {k} | {r['nome']} | {r['final']:.2f} (bruta {r['bruta']:.2f}) | {r['veredito']} | {', '.join(r['portoes_falhos']) or '-'} | {', '.join(r['pontos_fracos'])} |")
    for r in res:
        for al in r["alertas"]:
            print(f"  aviso [{r['nome']}]: {al}")
    for d in div:
        print(f"  diversidade: {d}")
    print("Nota = hipótese de potencial para escolher o que prototipar. Só métricas reais do protótipo confirmam.")
    return 0


if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    sys.exit(main())
