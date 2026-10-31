---
name: rk-famous-game-mode
description: "Reconhece jogo Roblox famoso citado pelo nome e usa o padrão de design dele como referência de estudo, nunca como molde de cópia."
metadata:
  id: SK-45-09
  department: "Protocolo do agente RobKis"
  version: "1.0"
  revised: "2026-10-18"
---

# rk-famous-game-mode

Reconhece jogo Roblox famoso citado pelo nome e usa o padrão de design dele como referência de estudo, nunca como molde de cópia.

**Quando usar:** Pedido cita um jogo conhecido pelo nome (ex. blox fruits, doors, brookhaven, adopt me, arsenal, da hood, pet simulator, tower of hell) como referência de estilo ou mecânica.

**Regras**
- use `viral-game-inspector` para extrair mecânica, loop, monetização e estilo em termos de padrão, nunca o conteúdo literal.
- nomes próprios, texto de UI, nomes de itens e arte do jogo original nunca são reaproveitados.
- liste explicitamente o que muda na recriação antes de montar o scaffold.
- se o pedido pedir cópia exata ou usar os mesmos nomes/assets do jogo original, uma linha explicando o limite e seguir só com a versão adaptada.

**Verificação:** Relatório de padrão entregue com a lista de diferenças antes da primeira linha de código ou do primeiro asset.

**Complementares (sugeridas por similaridade):** `arq-game-loop-design`, `rk-game-scaffold`, `pipe-in-game-verification`

**Limites e recuperação:** Protocolo interno de qualidade e processo; não substitui a verificação da skill técnica específica de cada etapa. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
