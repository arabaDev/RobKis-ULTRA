# viral-scorecard — avaliação profissional de ideias

**Quando usar:** toda vez que uma ideia for apresentada, comparada ou escolhida para prototipar. Ferramenta: `python scripts/viral_score.py ideias.json` (`--modelo` imprime o JSON para preencher).

## Os 9 critérios (0–10) e o que cada um aproxima

| Critério | Peso | Aproxima o sinal | 3 = | 7 = | 10 = |
|---|---|---|---|---|---|
| Retenção | 18% | play days D1/D2–7/D8–28 | nada depois da 1ª hora | ganchos D1 e D7 claros | profundidade + ganchos nas 3 janelas |
| Diversão imediata | 14% | bounce < 60 s e 61–180 s | precisa de tutorial | ação em < 60 s | "uau" em < 30 s |
| Facilidade de compreensão | 10% | play-through + bounce | precisa explicar | uma frase | a thumbnail explica |
| Potencial de compartilhamento | 12% | co-play + clipes | solo | melhor com amigo | precisa de amigo e gera clipe sozinho |
| Diferenciação dos concorrentes | 10% | penalidade de jogo não único | reskin | 3 diferenças estruturais | nada parecido no ar |
| Originalidade | 8% | Standout/curadoria | clichê | combinação fresca | mecânica nova |
| Viabilidade técnica | 12% | terminar bem feito | escopo enorme/IA complexa | MVP em dias | MVP em 1–2 dias com scaffold |
| Potencial de expansão | 8% | live ops sustentam D8–28 | conteúdo finito | updates óbvios | pipeline de conteúdo infinito/criado por jogador |
| Adequação ao público | 8% | playtime/spend do público certo | público indefinido | público claro | encaixe perfeito + mobile |

Pesos: retenção e primeiros minutos dominam porque são os sinais prioritários do algoritmo de 2026 (ver `viral-science.md`). Viabilidade pesa porque ideia não terminada vale zero.

## Rótulos de evidência (obrigatórios em toda nota)
- **verificado:** existe fonte ou métrica (link, dado de protótipo, analytics). Sem fonte, o script rebaixa e avisa.
- **estimativa:** inferência de padrão observado (ex.: "jogos com X costumam reter bem").
- **hipotese:** aposta a validar no protótipo.
Antes do protótipo, quase tudo é estimativa ou hipótese, e isso deve ser dito ao usuário.

## Portões eliminatórios (qualquer falha limita a nota final a 6,0)
`frase_5s` (até 15 palavras) · `diversao_60s` · `motivo_voltar` (amanhã E semana 2–4) · `motivo_amigo` · `nao_reskin` (3 diferenças estruturais) · `mvp_viavel` · `thumbnail_honesta`.

## Veredito
- **PROTOTIPAR:** nota ≥ 7,5 e nenhum portão falho.
- **AJUSTAR:** 6,0–7,5, ou portão falho com nota bruta alta (corrija o portão e reavalie).
- **DESCARTAR:** abaixo de 6,0.

## Checagens de honestidade que o script faz
Notas todas ≥ 9 (inflação) · todas iguais · "verificado" sem fonte · nota sem motivo · nenhuma nota verificada · frase longa demais · ideias parecidas demais no mesmo lote (similaridade ≥ 50%) · padrão principal repetido no lote.

## Como apresentar ao usuário
Tabela curta (ideia, nota, veredito, ponto forte, maior risco) + 1 parágrafo por ideia com pontos fortes, riscos e incertezas. Sempre termine com: "Notas são hipóteses para priorizar o protótipo; só métricas reais confirmam."

**Verificação:** `python scripts/viral_score.py` roda sem alertas não explicados.
