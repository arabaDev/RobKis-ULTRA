---
name: roblox-security
description: "Segurança de jogos Roblox multiplayer — validação de RemoteEvents, anti-spam, compras e dados. Use ao criar/revisar qualquer Remote, recompensa, compra ou salvamento."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: 1.0
  revised: 2026-10-18
---
# Roblox Security

O cliente é não confiável. O servidor decide.


```lua
--!strict
local lastCall: {[Player]: number} = {}
local MIN_INTERVAL = 0.25

local function allowed(player: Player): boolean
	local now = os.clock()
	if now - (lastCall[player] or 0) < MIN_INTERVAL then return false end
	lastCall[player] = now
	return true
end
game:GetService("Players").PlayerRemoving:Connect(function(p) lastCall[p] = nil end)

remote.OnServerEvent:Connect(function(player: Player, itemId: unknown, amount: unknown)
	if not allowed(player) then return end
	if typeof(itemId) ~= "string" or typeof(amount) ~= "number" then return end
	if amount ~= amount or amount < 1 or amount > 99 or amount % 1 ~= 0 then return end -- NaN, faixa, inteiro
	-- verificar posse, estado do personagem, distância, cooldown; então agir
end)
```

## Regras

- Dano, preço, quantidade e recompensa são calculados no servidor.
- Cheque distância/linha de visão no servidor para ações de alcance.
- Compras: `MarketplaceService.ProcessReceipt` idempotente; conceda e registre antes de retornar `PurchaseGranted`.
- Evite `RemoteFunction` servidor→cliente.
- Não confie em `Player.Character` posições enviadas pelo cliente para teleportes/curas.
- Dados: `pcall`, `UpdateAsync`, nunca salvar tabela vazia por cima de dados existentes.
- Sem chaves/tokens no código.
