---
name: viral-viral-ideas
description: "ROViral Idea Engine: inventa ideias de jogos Roblox com potencial viral real (retenção de 28 dias, co-play, clipes), diferentes entre si, avaliadas por rubrica de 9 critérios e portões anti-reskin."
metadata:
  id: SK-VR-04
  department: "Núcleo Roblox"
  version: "2.0"
  revised: "2026-10-26"
---

# Viral Ideas (ROViral Idea Engine 2.0)

## Quando usar
Qualquer pedido de ideia de jogo, conceito novo, "o que eu faço", "me dá N ideias", ou quando um projeto existente precisa de um conceito mais forte.

## Leia antes (pasta `references/`)
- `viral-science.md` — a lógica viral de 2026: funil Home → 60 s → D1 → D2–7 → D8–28 → amigos → gasto.
- `idea-engine.md` — método de 10 passos, operadores de invenção, testes de fogo, formato de dossiê.
- `viral-scorecard.md` — 9 critérios, pesos, rótulos de evidência, portões.
- `viral-patterns.md` — 25 padrões estruturais com twists (fonte: `viral_patterns.json`).

## Procedimento
1. Se o pedido cita gênero/jogo e há web: `trend-research.md` (mapa de saturação + 3 lacunas). Sem web: diga que as tendências podem estar desatualizadas.
2. `python scripts/idea_forge.py -n 8 [--max-saturacao media] [--padrao X] [--tema Y]` → sementes diversas.
3. Transforme as melhores sementes em conceitos (passos 4–9 do `idea-engine.md`); aplique os testes de fogo.
4. Preencha o JSON (`python scripts/viral_score.py --modelo`) e rode `python scripts/viral_score.py ideias.json`.
5. Entregue no formato de dossiê (uma ideia) ou ranking + dossiês curtos (várias ideias).

## Regras
- Ideia nova, não cópia: jogos citados são referência de padrão; mínimo de 3 diferenças estruturais.
- Várias ideias = padrão principal, público ou emoção diferentes; inclua uma segura, uma ousada e uma barata.
- Cada ideia responde: frase de 5 s, primeiros 60 s, loop, retorno D1/D2–7/D8–28, social, clipe, monetização saudável, MVP, riscos.
- Notas 0–10 com rótulo `verificado | estimativa | hipotese`; nunca invente dado para justificar nota.
- Potencial viral é hipótese a validar (`viral-prototype-validation`), nunca promessa.
- Proibido como ideia sem twist estrutural: clicker com pets e rebirth puro, tycoon/obby trocando só o tema, "Steal a ___" trocando só o objeto, battlegrounds com personagens de anime reais, giveaway no título.

## Verificação
- `viral_score.py` sem portão falho na ideia recomendada (ou falha explicada) e sem alerta de ideias parecidas demais.
- Toda ideia entregue tem dossiê completo.

## Complementares
`viral-game-inspector`, `viral-game-generator`, `viral-prototype-validation`, `rk-genre-templates`, `roblox-economy-balancing`
