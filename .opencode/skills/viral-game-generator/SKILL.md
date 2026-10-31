---
name: viral-game-generator
description: "Gera um jogo completo do Roblox do zero a partir de uma spec do ROViral: primeiros 60 s jogáveis, loop, retenção D1/D7/D28, modelos, scripts Luau server-authoritative, UI, economia e monetização saudável, com verificação real."
metadata:
  id: SK-VR-03
  department: "Núcleo Roblox"
  version: "2.0"
  revised: "2026-10-26"
---

# Viral Game Generator

## Quando usar

Quando você quer criar um jogo completo do Roblox do zero, com tudo funcionando, pronto para publicar e gerar Robux.

## Níveis de complexidade e tempo esperado

Classifique o pedido antes de começar — isso decide o que entra no escopo:

| Nível | Exemplo | Tempo alvo | Escopo |
|---|---|---|---|
| Simples | "um obby viral simples" | minutos, não horas | 1 mecânica central, 1 fonte de Robux, mapa pequeno |
| Médio | "um simulador de pets com loja" | parte de uma sessão | mecânica + progressão + loja + leaderboard |
| Complexo | "recriar o estilo de um jogo de terror famoso, do zero, com várias fases" | pode levar bem mais tempo, feito em etapas verificadas | várias mecânicas, vários sistemas (combate/IA/progressão), arte mais elaborada |

Não prometa um tempo fixo ao usuário — o tempo real depende do que o MCP consegue
executar e verificar na sessão. Prometer "pronto em 40 segundos" sem ter rodado
nada ainda é a receita para entregar algo quebrado. Primeiro a mecânica principal
jogável, só depois o resto (ver `rk-game-scaffold`).

## Regras

- Servidor é autoridade: valide todos os remotes, cooldowns, propriedade de itens e economia.
- Use `--!strict` em todos os módulos Luau.
- `task.*` em vez de `wait/spawn`.
- DataStore com `UpdateAsync`, retry, session lock e `BindToClose`.
- Modelos com nomes claros, materiais consistentes e colisão simples.
- Monetização (gamepass/developer product) processada com `ProcessReceipt` idempotente.
- UI responsiva para PC e celular.

## Procedimento

0. Sem conceito definido? Rode `viral-viral-ideas` primeiro. Com conceito, escreva a
   spec no formato de `references/team-protocol.md`
   (ROViral especifica, RobKis executa, ROViral revisa).
1. Se o pedido referenciar um jogo ou nicho específico, rode `viral-game-inspector`
   primeiro para extrair os padrões (nunca o conteúdo literal) do que funciona.
   Ordem de construção orientada aos sinais de 2026 (`viral-science.md`):
   primeiros 60 s → loop com feedback → gancho D1 → social → D2–7/D8–28 → loja.
2. Defina gênero, público alvo e ciclo de jogo. Use o template do gênero certo em
   `rk-genre-templates` (simulator/tycoon/obby/rpg/horror/battle royale) e a
   estrutura mínima de `rk-game-scaffold` (GameManager, DataManager, RemoteHandler,
   Constants) em vez de reinventar a arquitetura a cada jogo.
3. Crie a estrutura de pastas (ServerScriptService, ReplicatedStorage, StarterGui, etc.).
4. Gere modelos e partes diretamente no Roblox Studio (não no Blender) seguindo
   `viral-blender-pro-models` — partes/Models com visual estilizado e consistente.
5. Escreva scripts de jogabilidade, monetização, salvamento e anti-exploit.
   Servidor autoritativo em tudo que envolve dano, item ou moeda.
6. Monte a UI (HUD, loja, tela de entrada) sem placeholders óbvios de IA — ver
   seção "GUI sem cara de placeholder" abaixo.
7. Rode o checklist de aceitação (próxima seção) usando as ferramentas MCP
   disponíveis para confirmar, não apenas declarar, que está funcionando.

## GUI sem cara de placeholder

- Nunca usar apenas retângulos cinza com texto branco centralizado — isso é o
  padrão mais reconhecível de "UI gerada rápido".
- Usar cantos arredondados consistentes, uma paleta de 3-5 cores do tema do jogo
  (não azul/roxo genérico default), ícones ou símbolos (`ImageLabel` com
  `Enum.Font` decorativo ou formas vetoriais simples) em vez de só texto puro.
- Hierarquia visual clara: botão principal maior/mais contrastante que os
  secundários; estados de hover/pressed com `UIStroke`/`TweenService`.
- Referência completa de implementação: `roblox-ui`, `ui-hud-design`,
  `ui-shop-screens`, `fx-ui-juice`.

## Verificação

Isto é uma checklist de execução, não uma lista de promessas — cada item precisa
ser checado de verdade antes de declarar o jogo pronto:

- Se houver MCP Studio conectado: rode o jogo (`start_stop_play` ou equivalente)
  e leia o `get_console_output` — zero erros e zero warnings novos no Output.
  Sem MCP: entregue o código e diga explicitamente que não foi testado ao vivo.
- Dados salvam e carregam ao entrar/sair (teste real com `UpdateAsync`, não só
  código que "deveria" funcionar).
- Compra de gamepass/produto concede o item corretamente via `ProcessReceipt`
  idempotente (nunca duplica, nunca trava em `NotProcessedYet` para sempre).
- Jogabilidade tem um loop de retenção identificável (não só uma mecânica solta).
- Os primeiros 60 s entregam a frase de 5 s sem tutorial longo; existe gancho para D1, D2–7 e D8–28.
- Monetização não quebra a tensão central nem vende vantagem que destrói a experiência de quem não paga.
- Instrumentação mínima de `viral-prototype-validation` presente (funil de onboarding + economia).
- Visual é limpo, estilizado e não usa nomes/assets do jogo que inspirou a ideia.

## Complementares

`viral-game-inspector`, `viral-viral-ideas`, `viral-prototype-validation`, `viral-blender-pro-models`, `roblox-combat`, `roblox-economy-balancing`, `roblox-ui`
