--!strict
-- Local: ReplicatedStorage.RobKisGUI.Shared.Validators
-- Tipo: ModuleScript (lógica pura, sem Instances, testável) | Função: validar payloads de remotes e configurações salvas.
-- O servidor NUNCA confia no cliente: tudo que chega passa por aqui e só sai o que está no esquema.

local Presets = require(script.Parent.ThemePresets)

local Validators = {}

Validators.MAX_ID_LENGTH = 32
local ID_PATTERN = "^[%w_]+$"
local HEX_PATTERN = "^#%x%x%x%x%x%x$"

function Validators.isFiniteNumber(v: any): boolean
	return type(v) == "number" and v == v and v > -math.huge and v < math.huge
end

function Validators.isId(v: any): boolean
	return type(v) == "string" and #v >= 1 and #v <= Validators.MAX_ID_LENGTH and string.match(v, ID_PATTERN) ~= nil
end

function Validators.isHex(v: any): boolean
	return type(v) == "string" and string.match(v, HEX_PATTERN) ~= nil
end

local NUMBER_RANGES: { [string]: { number } } = {
	CornerRadius = { 0, 32 },
	Scale = { 0.5, 2 },
	AnimationDuration = { 0, 1 },
}

-- Retorna (ok, configuraçãoLimpa | códigoDoErro)
function Validators.validateSettings(raw: any): (boolean, any)
	if type(raw) ~= "table" then
		return false, "settings_invalid"
	end
	local out: { [string]: any } = {}
	if raw.Style ~= nil then
		if type(raw.Style) ~= "string" or table.find(Presets.Order, raw.Style) == nil then
			return false, "style_invalid"
		end
		out.Style = raw.Style
	end
	for _, key in { "Primary", "Secondary", "Background" } do
		local v = raw[key]
		if v ~= nil then
			if not Validators.isHex(v) then
				return false, key .. "_invalid"
			end
			out[key] = v
		end
	end
	for key, range in NUMBER_RANGES do
		local v = raw[key]
		if v ~= nil then
			if not Validators.isFiniteNumber(v) then
				return false, key .. "_invalid"
			end
			out[key] = math.clamp(v, range[1], range[2])
		end
	end
	for _, key in { "ReducedMotion", "SoundsEnabled", "TutorialDone" } do
		local v = raw[key]
		if v ~= nil then
			if type(v) ~= "boolean" then
				return false, key .. "_invalid"
			end
			out[key] = v
		end
	end
	return true, out
end

-- Esquema de cada ação: campo -> tipo. Campos fora do esquema são descartados.
local SCHEMAS: { [string]: { [string]: string } } = {
	RequestSync = {},
	Purchase = { itemId = "id" },
	Equip = { itemId = "id" },
	Unequip = { slot = "id" },
	UseSkill = { skillId = "id" },
	ClaimQuest = { questId = "id" },
	SelectClass = { classId = "id" },
	SaveSettings = { settings = "settings" },
}

Validators.Actions = SCHEMAS

-- Retorna (ok, payloadLimpo | códigoDoErro, requestId?)
function Validators.validateAction(action: any, payload: any): (boolean, any, number?)
	if type(action) ~= "string" then
		return false, "action_invalid", nil
	end
	local schema = SCHEMAS[action]
	if schema == nil then
		return false, "action_unknown", nil
	end
	if payload ~= nil and type(payload) ~= "table" then
		return false, "payload_invalid", nil
	end
	local p: any = payload or {}
	local rid: number? = nil
	if p.rid ~= nil then
		if not Validators.isFiniteNumber(p.rid) or p.rid < 0 or p.rid > 2147483647 then
			return false, "rid_invalid", nil
		end
		rid = math.floor(p.rid)
	end
	local data: { [string]: any } = {}
	for field, kind in schema do
		local v = p[field]
		if kind == "id" then
			if not Validators.isId(v) then
				return false, field .. "_invalid", rid
			end
			data[field] = v
		elseif kind == "settings" then
			local ok, clean = Validators.validateSettings(v)
			if not ok then
				return false, clean, rid
			end
			data[field] = clean
		end
	end
	return true, data, rid
end

return Validators
