---
name: rk-genre-templates
description: "Templates de arquitetura por gênero: simulator, tycoon, obby, rpg, horror, battle royale."
metadata:
  id: SK-45-03
  department: "Protocolo do agente RobKis"
  version: "1.0"
  revised: "2026-10-18"
---

# rk-genre-templates

Cada gênero de jogo Roblox tem padrões de arquitetura que se repetem. Ativar o template certo no início economiza retrabalho.

**Quando usar:** Ao iniciar um jogo novo. Identifique o gênero pelo contexto e aplique o template como base.

---

## #simulator

**Loop central:** Clicar → produzir recurso → coletar → gastar → upgrade → clicar mais rápido.

**Sistemas obrigatórios:**
- `ClickDetector` ou botão UI + RemoteEvent com cooldown server-side.
- `ResourceManager` (ModuleScript): moeda, recurso, cap por upgrade.
- `UpgradeManager`: tabela de upgrades com multiplicadores (`base * (1 + nivel ^ 1.1)`).
- `PetSystem` (se houver): pets com boost passivo, raridade por weighted table, equip com server validation.
- `Rebirth`: reset de recursos com multiplicador permanente.
- DataStore: salvar moeda, upgrades, pets, rebirth count. Schema versionado.

**World design:** zonas separadas por progressão (área 1 → área 2 desbloqueada com X recurso). Partes modeladas, não Terrain.

**Anti-exploit crítico:** nunca aceitar valor de recurso do cliente. Servidor calcula tudo.

---

## #tycoon

**Loop central:** Comprar droppers → gerar dinheiro passivo → comprar melhorias → expandir base.

**Sistemas obrigatórios:**
- `Tycoon` por jogador: Model no Workspace, atribuído ao jogador no join.
- `DropperSystem`: cada dropper tem `rate` (drops/s) e `value` (valor/drop), loop no servidor.
- `ConveyorSystem`: partes no mapa que coletam drops e convertem em dinheiro.
- `ButtonPurchase`: botão físico no tycoon com preço, verifica saldo, ativa objeto, desabilita botão.
- Persistência: quais botões comprados + saldo. `UpdateAsync` no saída.

**Anti-exploit:** dinheiro gerado no servidor (loop com `task.wait`), nunca calculado no cliente.

**World design:** tycoon pad com bounds definidos, câmera travada na área do jogador opcional.

---

## #obby

**Loop central:** Chegar ao checkpoint → avançar → morrer → respawnar no último checkpoint → completar.

**Sistemas obrigatórios:**
- `CheckpointManager`: `CollectionService` + tag "Checkpoint" + `Touched` + `debounce` por jogador.
- `RespawnManager`: `Player.CharacterAdded` → mover para último checkpoint salvo.
- `StageManager`: contador de estágio, leaderboard, tempo opcional.
- Persistência: último checkpoint e melhor tempo. Leve no DataStore.

**Tipos de obstáculo padrão:** plataformas móveis (TweenService ou LinearVelocity), kill bricks (BasePart Touched + dano/kill), plataformas de desaparecimento (TweenService opacity + disable).

**Anti-exploit:** servidor valida checkpoint touched (distância e estado do personagem), não confia em FireServer com ID.

---

## #rpg

**Loop central:** Aceitar quest → combater inimigos → ganhar XP/loot → subir de nível → missões mais difíceis → boss.

**Sistemas obrigatórios:**
- `CharacterStats`: level, xp, hp, atk, def por jogador. Calculados no servidor.
- `QuestManager`: estado de quests por jogador (ativa/completa/inativa), progresso por objetivo.
- `CombatSystem`: hitbox server-authoritative, pipeline de dano com stats, cooldowns.
- `LootSystem`: drops por inimigo com weighted table, validação de posse no servidor.
- `NPCDialogue`: proximidade → UI de diálogo → branch por flag de quest.
- `DungeonManager` (se houver): instâncias separadas por grupo, round com timer.

**Stat scaling:** `hp = 100 * (1 + level ^ 1.2)`, `atk = 10 * (1 + level ^ 1.1)`. Nunca aceitar stats do cliente.

**Persistência:** level, xp, inventário, quests completas, flags de progresso. Schema versionado.

---

## #horror

**Loop central:** Explorar → encontrar pistas/itens → resolver puzzle → escapar (ou ser eliminado).

**Sistemas obrigatórios:**
- `MonsterAI`: estado machine (patrol → chase → attack → search). PathfindingService. Audição por `GetPartBoundsInRadius`.
- `FlashlightSystem`: client-side com SpotLight, bateria no servidor.
- `ItemSystem`: itens físicos com `ProximityPrompt`, inventário local leve.
- `PuzzleManager`: estado de puzzles por lugar, broadcast quando resolvido.
- `JumpscareSystem`: RemoteEvent para cliente com timing, efeito de câmera e som.
- `Lobby → Round → End` como máquina de estados.

**Atmosfera:** iluminação TechnologyMode Future, Atmosphere densa, FogColor escuro, nenhum Bloom alto. Sons ambientes em loop (SoundGroup "Ambient").

**Anti-exploit:** posição do monstro sempre no servidor, cliente recebe via atributo ou RemoteEvent a cada N frames.

---

## #br (Battle Royale)

**Loop central:** Drop → lootar → combater → zona diminui → último sobrevivente.

**Sistemas obrigatórios:**
- `LobbySystem`: sala de espera, contagem de jogadores, countdown.
- `DropSystem`: avião (Part com TweenService), `ProximityPrompt` ou input para saltar, queda com física.
- `LootSpawner`: pontos de spawn espalhados, spawn aleatório de itens por rarity zone.
- `ZoneSystem`: círculo de zona (cilindro no Workspace) encolhendo com TweenService, dano fora da zona no servidor.
- `MatchManager`: estado (waiting/dropping/playing/ended), contador de vivos, broadcast de eventos.
- `InventorySystem`: slots limitados, swap de itens, drop físico.

**Performance crítica:** com 50+ jogadores, eliminar physics em partes decorativas, limitar ParticleEmitters, usar `StreamingEnabled` com `StreamingMinRadius` calibrado.

**Anti-exploit:** posição de queda validada no servidor (distância do avião), dano só server-side, inventário autoritativo no servidor.

---

**Skills complementares:** `rk-game-scaffold`, `arq-game-loop-design`, `arq-state-management`, `data-session-locking`, `combat-damage-pipeline`, `sec-remote-input-validation`, `perf-mobile-budgets`
