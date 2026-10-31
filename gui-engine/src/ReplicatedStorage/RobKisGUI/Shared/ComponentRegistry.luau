--!strict
-- Local: ReplicatedStorage.RobKisGUI.Shared.ComponentRegistry
-- Tipo: ModuleScript | Função: registro e fábrica de componentes. Cada componente é um ModuleScript
-- com `new(ctx, config)`. Registrar de uma pasta evita listas manuais.

local Registry = {}
Registry.__index = Registry

function Registry.new(): any
	local self: any = setmetatable({}, Registry)
	self._builders = {}
	return self
end

function Registry.Register(self: any, name: string, builder: any)
	if type(builder) ~= "table" or type(builder.new) ~= "function" then
		error("[RobKisGUI] componente inválido: " .. name, 2)
	end
	self._builders[name] = builder
end

function Registry.RegisterFolder(self: any, folder: Instance)
	for _, child in folder:GetChildren() do
		if child:IsA("ModuleScript") then
			local ok, mod = pcall(require, child)
			if ok then
				self:Register(child.Name, mod)
			else
				warn("[RobKisGUI] falha ao carregar componente " .. child.Name .. ": " .. tostring(mod))
			end
		end
	end
end

function Registry.Has(self: any, name: string): boolean
	return self._builders[name] ~= nil
end

function Registry.List(self: any): { string }
	local names = {}
	for name in self._builders do
		table.insert(names, name)
	end
	table.sort(names)
	return names
end

-- Erros de componentes aparecem para quem chama; o mount de nível superior isola cada falha.
function Registry.Create(self: any, name: string, config: { [string]: any }?, ctx: any): any
	local builder = self._builders[name]
	if builder == nil then
		error("[RobKisGUI] componente desconhecido: " .. name, 2)
	end
	return builder.new(ctx, config or {})
end

return Registry
