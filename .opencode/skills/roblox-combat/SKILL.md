---
name: roblox-combat
description: "Combate em Roblox — Tools, hit detection, cooldown, dano server-authoritative e prevenção de dano duplicado. Use ao criar armas, habilidades ou NPCs que causam dano."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: 1.0
  revised: 2026-10-18
---
# Roblox Combat

## Arquitetura

- **Cliente:** input, animação, efeitos, pedido de ataque (`RemoteEvent`) sem dano.
- **Servidor:** valida cooldown/estado, detecta acerto, aplica dano.

## Hit detection (servidor)

```lua
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Exclude
params.FilterDescendantsInstances = { attacker.Character }
local result = workspace:Raycast(origin, direction * RANGE, params)
local hum = result and result.Instance:FindFirstAncestorOfClass("Model")
	and result.Instance:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid")
if hum and hum.Health > 0 then hum:TakeDamage(DAMAGE) end
```

Para golpes corpo a corpo em área: `workspace:GetPartBoundsInBox` / `GetPartsInPart` com `OverlapParams`, deduplicando por Humanoid.

## Regras

- Cooldown por jogador no servidor (`os.clock()`), ignorando pedidos antes do tempo.
- Debounce por alvo por golpe (tabela `hit[humanoid] = true`) para não dar dano duplo.
- Cheque distância máxima entre atacante e alvo; tolere latência com margem pequena e fixa.
- Dano e alcance vêm de config no servidor, nunca do cliente.
- Ignore pedidos se o atacante estiver morto/atordoado.
- Feedback (som, partícula, hit flash) no cliente para parecer responsivo.

**Verificação:** Dano aplicado uma única vez por golpe e pedido sem cooldown é rejeitado pelo servidor.
