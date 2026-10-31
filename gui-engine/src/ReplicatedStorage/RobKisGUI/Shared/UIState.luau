--!strict
-- Local: ReplicatedStorage.RobKisGUI.Shared.UIState
-- Tipo: ModuleScript | Função: estado central observável da interface (dados espelhados do servidor + painel ativo).
-- Só um painel fica ativo por vez, o que mantém abrir/fechar consistente.

local UIUtils = require(script.Parent.UIUtils)

local UIState = {}
UIState.__index = UIState

function UIState.new(initial: { [string]: any }?): any
	local self: any = setmetatable({}, UIState)
	self._data = {}
	self._subs = {}
	if initial then
		for k, v in initial do
			self._data[k] = v
		end
	end
	return self
end

function UIState.Get(self: any, key: string): any
	return self._data[key]
end

-- Tabelas sempre notificam (o servidor envia tabelas novas a cada sincronização).
function UIState.Set(self: any, key: string, value: any)
	local old = self._data[key]
	if old == value and type(value) ~= "table" then
		return
	end
	self._data[key] = value
	local sig = self._subs[key]
	if sig then
		sig:Fire(value, old)
	end
end

function UIState.Merge(self: any, values: { [string]: any })
	for k, v in values do
		self:Set(k, v)
	end
end

function UIState.Subscribe(self: any, key: string, fn: (any, any) -> ()): any
	local sig = self._subs[key]
	if sig == nil then
		sig = UIUtils.Signal.new()
		self._subs[key] = sig
	end
	return sig:Connect(fn)
end

function UIState.OpenPanel(self: any, name: string)
	self:Set("ActivePanel", name)
end

function UIState.ClosePanel(self: any, name: string?)
	if name == nil or self._data.ActivePanel == name then
		self:Set("ActivePanel", nil)
	end
end

function UIState.TogglePanel(self: any, name: string)
	if self._data.ActivePanel == name then
		self:Set("ActivePanel", nil)
	else
		self:Set("ActivePanel", name)
	end
end

-- Chamado após respawn: fecha painéis e estados transitórios, preserva dados do jogador.
function UIState.ResetTransient(self: any)
	self:Set("ActivePanel", nil)
end

return UIState
