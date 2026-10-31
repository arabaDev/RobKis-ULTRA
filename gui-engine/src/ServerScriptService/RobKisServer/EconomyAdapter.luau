--!strict
-- Local: ServerScriptService.RobKisServer.EconomyAdapter
-- Tipo: ModuleScript (servidor) | Função: interface de economia usada pelas compras e recompensas.
-- Implementação padrão: moedas na sessão (PlayerStore). Para usar a economia REAL do seu jogo, mantenha estas 3 funções
-- e troque o corpo delas. Todo o resto do sistema continua igual.

local PlayerStore = require(script.Parent.PlayerStore)

local Economy = {}

function Economy.balance(player: Player, currency: string): number
	local s = PlayerStore.get(player)
	if s == nil or type(s.Currencies[currency]) ~= "number" then
		return 0
	end
	return s.Currencies[currency]
end

-- Debita somente se houver saldo. Retorna true se debitou.
function Economy.spend(player: Player, currency: string, amount: number): boolean
	local s = PlayerStore.get(player)
	if s == nil or type(amount) ~= "number" or amount < 0 or amount ~= amount then
		return false
	end
	if Economy.balance(player, currency) < amount then
		return false
	end
	s.Currencies[currency] -= amount
	return true
end

function Economy.grant(player: Player, currency: string, amount: number): boolean
	local s = PlayerStore.get(player)
	if s == nil or type(amount) ~= "number" or amount <= 0 or amount ~= amount or s.Currencies[currency] == nil then
		return false
	end
	s.Currencies[currency] += amount
	return true
end

return Economy
