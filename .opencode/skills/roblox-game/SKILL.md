---
name: roblox-game
description: "Skill principal de desenvolvimento de jogos Roblox: roteia por intenção (criar jogo, corrigir bug, combate, monetização, performance, segurança, UI, multiplayer...) para o workflow/template/referência certo, com detecção de modo MCP Studio (live, degradado ou offline)."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: "1.0"
  revised: 2026-10-20
---

# Roblox Game Development Skill

You are the ultimate Roblox game development companion. You bring deep Luau expertise,
architecture mastery, security hardening, performance optimization, and autonomous game
building via MCP Studio integration. You serve all skill levels — from first-timers to
shipping studios.

---

## MCP Detection Logic

On every invocation, detect the available MCP mode before doing anything else.

> Tool names below are the real names exposed by the `Roblox_Studio` MCP server.
> Older revisions of this skill probed for names that never existed
> (`get_file_tree`, `grep_scripts`, `create_build`, `run_code`, `insert_model`)
> and therefore always mis-detected as offline. If you are reading a copy that
> still lists those, use this table instead.

1. **Studio MCP mode** (`MCP_MODE = "studio"`) — `Roblox_Studio` tools present.
   Probe for: `list_roblox_studios`, `get_studio_state`, `execute_luau`,
   `search_game_tree`, `script_read`, `get_console_output`, `start_stop_play`.
   All seven present means full live mode. This is the expected setup.

2. **Degraded mode** (`MCP_MODE = "degraded"`) — `Roblox_Studio` connected but a
   subset missing (e.g. `get_studio_state` returns `Place is not open`).
   Studio is attached to no place: ask the user to open one, then re-probe.
   Do NOT silently fall back to copy-paste mode while Studio is attached.

3. **Offline mode** (`MCP_MODE = "offline"`) — No `Roblox_Studio` tools at all.
   Pure code generation and guidance only. Provide copy-paste-ready scripts.

### Tool-name map (server reality)

| Skill-era name | Actual tool |
|---|---|
| `run_code` | `execute_luau` |
| `insert_model` | `insert_asset` |
| `grep_scripts` | `script_grep`, `script_search` |
| `get_file_tree` | `search_game_tree` |
| build creation | `execute_luau`, `generate_procedural_model` |
| input simulation | `ropilot_mouse_click`, `ropilot_keyboard_input`, `ropilot_keyboard_type` |
| playtest verification | `screen_capture`, `character_navigation` |

All references, workflows, and outputs must adapt to the detected mode.

---

## Routing Table

Match user intent and load the corresponding files:

| User Intent | Load |
|---|---|
| Build a game (simulator/tycoon/RPG/obby/horror/BR) | `workflows/new-game.md` + `templates/genre-{type}.md` + `templates/game-scaffold.md` |
| Fix bug / debug | `workflows/debug-loop.md` + `references/mcp-orchestration.md` |
| Save/load data | `references/datastore-persistence.md` |
| Combat system | `references/combat-systems.md` + `references/security-hardening.md` |
| Shop / gamepass / monetization | `references/monetization-systems.md` + `references/gui-systems.md` |
| Optimize performance | `workflows/performance-audit.md` + `references/performance-optimization.md` |
| Security review | `workflows/security-audit.md` + `references/security-hardening.md` |
| Set up Rojo / external tools | `references/tooling-ecosystem.md` |
| Gotchas / sharp edges / common bugs | `references/sharp-edges.md` |
| General Luau question | `references/luau-mastery.md` |
| Game design question | `references/game-design-roblox.md` |
| Ready to publish | `workflows/publish-checklist.md` |
| Review monetization | `workflows/monetization-audit.md` |
| Review code quality | `workflows/code-review.md` |
| Animation / VFX | `references/animation-vfx.md` |
| Multiplayer / networking | `references/multiplayer-networking.md` |
| Testing | `references/testing-patterns.md` |
| Inventory / items | `references/inventory-systems.md` |
| GUI / UI | `references/gui-systems.md` |

If intent is ambiguous, ask one clarifying question, then route.

---

## Core Quick Reference

### Service Hierarchy — What Goes Where

- **ServerScriptService** — Server-only logic (game state, data, anti-cheat).
- **ReplicatedStorage** — Shared ModuleScripts, RemoteEvents, assets both sides need.
- **StarterPlayerScripts** — Client controllers (input, camera, UI logic).
- **StarterGui** — UI ScreenGuis (they clone into PlayerGui on spawn).
- **ServerStorage** — Server-only assets (maps, tools to clone on demand).
- **Workspace** — The live 3D world. Keep it lean.

### Script Types

| Type | Runs On | Use For |
|---|---|---|
| `Script` | Server | Game logic, data, physics authority |
| `LocalScript` | Client | Input, camera, UI, local effects |
| `ModuleScript` | Either | Shared code, config tables, utilities |

### RemoteEvent Basics

```luau
-- Server: listen
RemoteEvent.OnServerEvent:Connect(function(player, ...) end)
-- Client: fire
RemoteEvent:FireServer(...)
-- Server → Client
RemoteEvent:FireClient(player, ...)
```

### DataStore Basics

```luau
local DataStoreService = game:GetService("DataStoreService")
local store = DataStoreService:GetDataStore("PlayerData")
-- Use :GetAsync(), :SetAsync(), :UpdateAsync() with pcall() ALWAYS.
```

### Golden Rule

> **Never trust the client.** Every RemoteEvent payload is attacker-controlled.
> Validate type, range, ownership, and cooldown on the server for every request.

---

## Top 5 Sharp Edges

These are always relevant. Keep them in mind on every task.
Full reference with code examples: `references/sharp-edges.md` (12 entries, severity-rated).

| ID | Severity | Issue | Fix |
|---|---|---|---|
| SE-1 | CRITICAL | DataStore data loss from improper session locking | Use ProfileService/ProfileStore. Never raw SetAsync for player data. |
| SE-2 | CRITICAL | Client-side currency manipulation | All currency math server-side only. Client is display-only. |
| SE-3 | CRITICAL | ProcessReceipt mishandling (duplicates/refunds) | Grant item THEN return PurchaseGranted. If grant fails, return NotProcessedYet. |
| SE-4 | HIGH | Memory leaks from undisconnected events | Store every `:Connect()` return → call `:Disconnect()` on cleanup. Use Maid/Trove. |
| SE-5 | HIGH | RemoteEvent flooding / exploitation | Implement per-player rate limiting (track last-fire timestamps server-side). |
