# viral-validation — provar (ou matar) uma ideia com protótipo e métricas

**Quando usar:** depois que uma ideia recebe PROTOTIPAR, e em toda atualização de jogo que mexa no início, no loop ou na monetização. Potencial viral é hipótese; isto é como testar.

## 1. Protótipo mínimo (MVP) — o que entra
Só o necessário para medir a hipótese principal:
1. Os primeiros 60 s completos (spawn → ação central → primeira recompensa).
2. O loop central com feedback (som, número, partícula) — feio é aceitável, mudo e sem feedback não.
3. Um gancho de retorno funcionando de verdade (salvo em DataStore).
4. O multiplicador social mínimo (ex.: a ação de dupla).
5. Thumbnail e título honestos.
Fica de fora: loja completa, muitos mapas, cosméticos, lore. Use `rk-game-scaffold` e `rk-genre-templates` para não reinventar a arquitetura.

## 2. Instrumentação (antes de abrir para jogadores)
Use `AnalyticsService` (funis, economia e eventos customizados, que aparecem no Creator Analytics) e eventos próprios para o que o painel não mostra:
- **Funil de onboarding:** passos `entrou` → `primeira_acao` → `primeira_recompensa` → `primeiro_uau` → `primeira_meta`. Mede onde está o bounce.
- **Economia:** fontes e sumidouros de cada moeda (evita inflação invisível).
- **Retorno curto (return rate):** registre início/fim de sessão; calcule quantos jogadores com sessão < 5 min voltam em até ~30 min. Referência de leitura (heurística de mercado, não oficial): < 10% = loop fraco, > 30% = loop funcionando.
- **Co-play:** sessões com amigo no servidor / total de sessões.
- **Erros:** Output/erros do servidor e cliente por sessão (bug derruba o bounce).
Confirme nomes e assinaturas atuais das APIs na documentação do Studio instalado antes de escrever o código; não invente métodos.

## 3. O que olhar e quando
| Pergunta | Métrica | Onde |
|---|---|---|
| A thumbnail funciona? | play-through rate | Creator Analytics → Acquisition → Home Recommendations |
| O início segura? | bounce < 60 s e 61–180 s; funil de onboarding | Home Recommendations + Funnels |
| O loop prende? | playtime/usuário, return rate | Engagement + eventos próprios |
| Voltam? | play days D1, D2–7, D8–28 | Home Recommendations / Retention |
| Trazem amigos? | dias de co-play | Home Recommendations |
| A monetização é saudável? | dias com gasto, Robux/usuário, reclamações | Monetization + comentários |
Compare com os **benchmarks** que o próprio painel mostra (são só referência; não afetam o algoritmo). Com poucas centenas de sessões, os números são ruidosos: relate o tamanho da amostra junto com a métrica.

## 4. Decisão depois do teste
- **Escalar:** início segura (bounce abaixo do benchmark), return rate saudável, D1 dentro do benchmark → investir em conteúdo D8–28 e live ops.
- **Iterar:** um ponto do funil claramente fraco → mude SÓ aquele ponto e meça de novo (uma variável por vez).
- **Pivotar:** loop não prende mesmo com início bom → troque o twist ou o padrão secundário, mantendo o que funcionou.
- **Matar:** nada melhora depois de 2–3 iterações → arquive com aprendizado registrado em `.roviral/aprendizados.md`.

## 5. Playtest com humanos (barato e rápido)
Observe 3–5 pessoas jogando sem explicar nada. Anote: segundo em que entenderam, primeira risada/susto, primeira confusão, momento em que pararam. Pergunte só no fim: "o que você contaria para um amigo sobre esse jogo?". Se a resposta não for parecida com a frase de 5 s, a promessa está errada.

## 6. A/B honesto
Thumbnail e título: teste variações que mostram a MESMA verdade de formas diferentes. Nunca teste promessa falsa: sobe play-through e derruba bounce/retenção.

**Verificação:** relatório com amostra, métrica, comparação com benchmark e decisão (escalar/iterar/pivotar/matar). Sem dados reais, escreva "NÃO VALIDADO — sem jogadores ainda".
