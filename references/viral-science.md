# viral-science — a lógica de um jogo viral no Roblox (edição out/2026)

**Quando usar:** antes de inventar, avaliar, estudar ou reconstruir qualquer jogo com objetivo de viralizar. É a base teórica de `idea-engine.md`, `viral-scorecard.md` e `viral-validation.md`.

> Fatos marcados **[ROBLOX]** vêm da documentação oficial ou do DevForum do Roblox (fontes no fim). O resto é **modelo de design**: hipótese útil, não lei. Revalide com pesquisa atual (`trend-research.md`) quando a decisão depender de tendência.

## 1. O que mudou em 2026 (e por que ideias de 2025 envelhecem mal)

- **[ROBLOX]** Em 2026 o *Recommended For You* (a fileira da Home que mais distribui jogos) passou a medir o comportamento por **28 dias** (antes eram 7), separado em **Dia 1, Dias 2–7 e Dias 8–28**.
- **[ROBLOX]** O antigo "qualified play-through rate" foi substituído por sinais separados. Os principais, em ordem de prioridade: **play-through rate** (quem vê o jogo na Home e entra), **first-play bounce rate** (sai em menos de 60 s ou entre 61 e 180 s; sinal NEGATIVO), **play days por usuário** (D1, D2–7, D8–28) e **playtime por usuário** (limitado a 60 min/dia/jogo). Depois vêm: **dias de co-play intencional** (voltar para jogar com amigos via join, convite ou servidor privado), **sessões qualificadas**, **dias com gasto** e **Robux por usuário**.
- **[ROBLOX]** Os sinais são **médias por usuário**, não totais, e só contam usuários que chegaram **organicamente pela própria recomendação**. Jogo pequeno com jogador muito engajado não é prejudicado. Tráfego de anúncio, influenciador ou busca não entra no ranqueamento (mas pode acelerar a fase de *explore*).
- **[ROBLOX]** Distribuição funciona em fases **explore → expand**: um grupo pequeno de usuários novos recebe o jogo; se esse grupo retém e engaja, o jogo é mostrado a grupos parecidos maiores.
- **[ROBLOX]** É penalizado: título/thumbnail que promete giveaway ou recompensa em dinheiro, metadados que não batem com o jogo, e **jogos muito parecidos com jogos existentes** (nos metadados ou no arquivo do place). A orientação oficial é literalmente "siga tendências, mas com um twist". Thumbnail personalizada é **obrigatória** para receber impressões da Home.
- Consequência relatada pela imprensa (ago/2026): os "virais de 2025" focados em gasto de curto prazo perderam impressões; o top 10 passou a concentrar cerca de 20% das horas jogadas (eram cerca de 30%). Hits de 2026 citados: 99 Nights in the Forest, Steal an Egg, Jujutsu Shenanigans, fórmulas "+1 por X", horror cooperativo e jogos de anomalia.

**Tradução para design:** em 2026, viralizar ≠ pico. **Viral = um pico que o algoritmo decide sustentar**, e ele sustenta quem segura o jogador por 4 semanas e traz amigos. Ideia que só funciona na primeira hora é ideia de 2025.

## 2. O funil viral (cada etapa tem um sinal e uma alavanca)

| Etapa | Sinal [ROBLOX] | Pergunta de design | Alavanca principal |
|---|---|---|---|
| 1. Ver na Home | impressões | Alguém entende o jogo pela imagem em 1 s? | thumbnail honesta com a ação central + título de 2–4 palavras com verbo |
| 2. Entrar | play-through rate | A promessa é irresistível E verdadeira? | "frase de 5 segundos" virar imagem |
| 3. 0–60 s | bounce < 60 s | Ele já fez a coisa divertida? | entrar direto no loop; nada de tela/tutorial longo; primeira recompensa < 30 s |
| 4. 1–3 min | bounce 61–180 s | Ele já percebeu que tem mais? | primeiro "uau" (raridade, escala, susto, risada) + primeira meta visível |
| 5. Sessão | playtime, sessões qualificadas | Por que ficar mais 10 min? | loop de 30 s dentro de meta de 5 min dentro de meta de sessão |
| 6. Dia 1 | play days D1 | Por que voltar hoje à noite/amanhã? | algo dele em andamento (crescendo, em risco, quase pronto) |
| 7. Dias 2–7 | play days D2–7 | Por que voltar no fim de semana? | eventos agendados, coleção incompleta, grupo de amigos esperando |
| 8. Dias 8–28 | play days D8–28 | Ainda tem o que dominar ou descobrir? | profundidade (maestria, build, metajogo), updates semanais, temporada |
| 9. Amigos | co-play days | Fica melhor com amigo? | ação que precisa de 2, rivalidade, resgate, servidores privados |
| 10. Gasto | spend days, Robux/usuário | Gastar melhora a experiência sem quebrar a dos outros? | cosmético, conveniência, identidade; nada que destrua a tensão central |

Regra: **um jogo viral precisa ter resposta para TODAS as linhas.** A maior parte das ideias fracas responde bem às linhas 1–4 e não tem nada para 7–8.

## 3. Anatomia de uma ideia viral (os 8 órgãos)

1. **Promessa (5 s):** verbo + objeto + absurdo/emoção. "Roube monstros dos seus amigos." "Não faça barulho." "+1 de velocidade por segundo." Se precisa de duas frases, não é viral.
2. **Primeiro minuto:** a ação principal acontece antes de qualquer menu. O jogador aprende fazendo.
3. **Loop central (10–30 s):** ação → feedback forte (som, número, partícula, reação de NPC/jogador) → pequena recompensa → repetir com variação.
4. **Escalada:** os números, a escala, o perigo ou a raridade crescem de forma visível. "Estou a um passo de algo melhor."
5. **Tensão não resolvida:** sempre existe algo pendente (crescendo, em risco, incompleto, quase desbloqueado). É o que puxa D1.
6. **Multiplicador social:** o jogo fica claramente melhor com outras pessoas (precisar, competir, salvar, julgar, trocar, assistir).
7. **Momento de clipe:** uma situação que gera vídeo curto sozinha: susto, queda, raridade absurda, virada, comédia física, roubo no último segundo.
8. **Motor de longo prazo:** o que existe na semana 3 que não existia na hora 1: maestria, build, coleção, ranking, temporada, conteúdo novo semanal, criações de jogadores.

## 4. Por que as pessoas compartilham (gatilhos)

- **Ostentação:** "olha o que eu tirei/construí" → raridades anunciadas, criações visíveis, ranking.
- **Emoção forte compartilhada:** medo, risada, raiva leve (rivalidade) → horror coop, roubo, física.
- **Identidade:** "esse jogo é a minha cara" → avatar, moda, base personalizada, papéis.
- **Utilidade social:** "entra aqui comigo" → ação que precisa de 2, servidor privado, presentes.
- **Curiosidade:** "o que acontece se..." → regras absurdas simples, segredos, anomalias, combinações.
- **Narrativa emergente:** "aconteceu uma coisa..." → sistemas que geram histórias diferentes a cada partida.

## 5. Por que a maioria das "ideias virais" falha

- **Reskin:** troca tema/nome de um hit. Em 2026 isso é penalizado pela própria plataforma (jogo não único) e não oferece motivo para trocar o original.
- **Pico sem profundidade:** gancho ótimo, nada para os dias 8–28. Cai junto com a trend.
- **Monetização antes da diversão:** paywall no loop central, gasto de curto prazo, "imunidade paga" que mata a tensão. Penalizado desde a mudança de 2026.
- **Solo vazio:** jogo social que não funciona com o servidor vazio (sem bots, sem modo solo, sem meta individual).
- **Onboarding lento:** tela de carregamento longa, tutorial de texto, menus antes da ação = bounce em menos de 60 s.
- **Thumbnail mentirosa:** sobe o play-through e derruba o bounce; o saldo é negativo.
- **Escopo impossível:** a ideia só funciona com 40 mapas e IA complexa. Não fica pronta antes da trend acabar.
- **Mobile esquecido:** a maior parte do público joga no celular; controles e GUI de PC derrubam o bounce.

## 6. Arquétipos de público (escolha UM primário)

| Público | Quer | Odeia | Sinal mais forte |
|---|---|---|---|
| Casual/infantil (menos de 13) | cores, progresso garantido, coleção, amigos | punição dura, textos longos | play days, co-play |
| Competitivo | maestria, ranking, justiça | pay-to-win, lag | playtime, D8–28 |
| Social/expressivo | identidade, palco, julgamento | grind sem plateia | co-play, sessões |
| Medo/adrenalina (grupo) | susto compartilhado, histórias | repetição previsível | co-play, play-through |
| Colecionador/AFK | raridade, números, ostentação | perder progresso | playtime, play days |

Política: jogos para menores de 13 → monetização ainda mais conservadora, nada de mecânica que imite aposta com Robux, chances sempre visíveis.

## 7. Momento certo (tendências)

- **Trend = linguagem que o público já entende** (formato de título, tipo de mecânica, meme). Usar a linguagem reduz o custo de entender; copiar o jogo não.
- **Janela:** formatos virais costumam saturar em semanas a poucos meses (observação, não dado oficial). Se o MVP não sai a tempo, use o *padrão estrutural* da trend, não o *meme* da trend.
- **Twist obrigatório:** mude pelo menos 3 coisas estruturais (verbo principal, quem é a ameaça, o que se perde, como amigos interagem, o que acontece em tempo real). Tema e nome não contam.

## 8. Checklist da lógica viral (use antes de entregar qualquer ideia)

- [ ] Frase de 5 s com até 15 palavras e um verbo central.
- [ ] Ação divertida em menos de 60 s, sem tutorial longo.
- [ ] Um "uau" antes dos 3 min.
- [ ] Loop de 10–30 s com feedback forte.
- [ ] Tensão pendente que puxa D1.
- [ ] Motivo concreto para D2–7 e para D8–28.
- [ ] Fica melhor com amigos; funciona (ainda que menos) sozinho.
- [ ] Um momento de clipe descrito em uma frase.
- [ ] Monetização que não destrói a tensão central nem penaliza quem não paga.
- [ ] Pelo menos 3 diferenças estruturais em relação a qualquer referência.
- [ ] Thumbnail e título honestos, sem giveaway.
- [ ] MVP viável no prazo; roda bem em celular.

## Fontes (consultadas em 26/10/2026)
- Roblox Creator Docs, *Discovery*: https://create.roblox.com/docs/discovery
- DevForum, *Recommended For You Algorithm Improvements That Better Value Long-Term Retention* (15/06/2026): https://devforum.roblox.com/t/recommended-for-you-algorithm-improvements-that-better-value-long-term-retention/4684575
- Roblox Newsroom, *Optimizing discovery* (jun/2026): https://about.roblox.com/newsroom/2026/06/optimizing-discovery-great-games-reach-millions-players-roblox
- Roblox Creator Docs, *Engagement analytics*: https://create.roblox.com/docs/production/analytics/engagement
- Roblox Creator Docs, *Standout Games*: https://create.roblox.com/docs/creator-programs/standout-games
- GodisaGeek (ago/2026), sobre o efeito da mudança de algoritmo: https://godisageek.com/2026/08/roblox-9-billion-algorithm-change/
- RoWatcher (jun/2026), ranking por jogadores ao vivo: https://rowatcher.com/news/the-most-popular-roblox-games-right-now-ranked-by-live-players
- RoWatcher, *Return rate*: https://rowatcher.com/news/return-rate-is-the-retention-metric-roblox-devs-are-ignoring
- TIKR (out/2026), Steal an Egg e o Q3: https://www.tikr.com/blog/roblox-stock-is-down-37-in-2026-heres-what-its-new-viral-hit-has-to-prove-on-october-29

**Verificação:** toda ideia entregue responde às 10 linhas do funil e ao checklist da seção 8.

**Limites:** os pesos exatos dos sinais não foram publicados em texto (só numa imagem do DevForum). Não invente números; quando precisar de dado atual, pesquise.
