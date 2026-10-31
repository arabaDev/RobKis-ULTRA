---
name: roblox-development
description: "Estrutura de projeto, serviços e ordem de trabalho para criar experiências Roblox completas. Use ao iniciar jogo/sistema novo ou decidir onde cada script vive."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: 1.0
  revised: 2026-10-18
---
# Roblox Development

## Onde cada coisa vive

| Local | Conteúdo |
|---|---|
| `ServerScriptService` | Scripts de servidor, bootstrap, serviços de jogo |
| `ServerStorage` | Assets/módulos que o cliente **não** pode ver |
| `ReplicatedStorage` | Módulos compartilhados, Remotes, assets replicados |
| `StarterPlayer/StarterPlayerScripts` | LocalScripts de jogador (input, câmera, HUD logic) |
| `StarterGui` | ScreenGuis (use `ResetOnSpawn = false` se não devem recriar) |

Estrutura sugerida: `ReplicatedStorage/Shared` (módulos/config/tipos), `ReplicatedStorage/Remotes`, `ServerScriptService/Services`, `StarterPlayerScripts/Controllers`.

## Ordem de construção

1. Mecânica principal jogável (um loop completo: ação → feedback → recompensa).
2. Autoridade do servidor e validação.
3. UI/feedback.
4. Persistência (DataStore).
5. Conteúdo, balanceamento, polimento, mobile.

## Padrões

- Um `Script` de bootstrap por lado que `require` serviços/controllers e inicia; lógica fica em `ModuleScript`.
- Configuração em módulo (`Config`), nunca números mágicos espalhados.
- `CollectionService` + tags para comportamento em muitos objetos iguais.
- `DataStoreService`: sempre `pcall`, retry limitado com espera, `UpdateAsync`, salvar em `PlayerRemoving` e `game:BindToClose`; nunca sobrescrever dados bons com vazios.
- NPCs: `PathfindingService:CreatePath` + recomputar em bloqueio; não rodar IA a cada frame sem necessidade.
- Confirme APIs na documentação atual (create.roblox.com/docs). Não invente propriedades.

**Verificação:** A mecânica principal roda de ponta a ponta e cada script está no serviço certo.
