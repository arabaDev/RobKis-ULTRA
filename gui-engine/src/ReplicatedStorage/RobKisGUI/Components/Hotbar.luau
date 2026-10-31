--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.Hotbar
-- Tipo: ModuleScript (componente cliente) | Função: barra de atalhos inferior (toque, clique ou teclas 1-9).
-- Config.Source = "Skills" (usa habilidades do catálogo; o servidor valida recarga/energia)
--              | "Equipped" (mostra itens equipados e dispara ctx.Events.HotbarSelected(itemId) para o seu sistema de tools).
-- Config.Slots = quantidade de slots (máx. 9).

local UserInputService = game:GetService("UserInputService")

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

local DIGITS = {
	[Enum.KeyCode.One] = 1, [Enum.KeyCode.Two] = 2, [Enum.KeyCode.Three] = 3, [Enum.KeyCode.Four] = 4,
	[Enum.KeyCode.Five] = 5, [Enum.KeyCode.Six] = 6, [Enum.KeyCode.Seven] = 7, [Enum.KeyCode.Eight] = 8, [Enum.KeyCode.Nine] = 9,
}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local source: string = config.Source or "Skills"
	local slotCount: number = math.clamp(config.Slots or 4, 1, 9)
	local slots: { any } = {}
	local entries: { any } = {}
	local cooldownEnds: { [string]: number } = {}
	local pending: { [number]: boolean } = {}
	local selected = 0

	local bar = UIUtils.create("Frame", { Name = "Hotbar", BackgroundTransparency = 1 })
	local layout = UIUtils.create("UIListLayout", {
		Parent = bar, FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 8),
		HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local function collect()
		table.clear(entries)
		local catalog = ctx.State:Get("Catalog")
		if type(catalog) ~= "table" then
			return
		end
		if source == "Equipped" then
			local items = UIUtils.indexById(catalog.Items)
			local equipped = ctx.State:Get("Equipped") or {}
			for _, slotId in catalog.Slots or {} do
				local itemId = equipped[slotId]
				if itemId and items[itemId] then
					table.insert(entries, { Kind = "Item", Data = items[itemId] })
				end
			end
		else
			for _, skill in catalog.Skills or {} do
				table.insert(entries, { Kind = "Skill", Data = skill })
			end
		end
	end

	local function activate(index: number)
		local entry = entries[index]
		if entry == nil then
			return
		end
		if entry.Kind == "Item" then
			selected = index
			ctx.Events.HotbarSelected:Fire(entry.Data.Id)
			self:Refresh()
			return
		end
		local skill = entry.Data
		local ends = cooldownEnds[skill.Id]
		if (ends and ends > os.clock()) or pending[index] then
			return
		end
		pending[index] = true
		ctx.Request("UseSkill", { skillId = skill.Id }, function(ok: boolean)
			pending[index] = nil
			if ok then
				-- a recarga é iniciada pelo evento SkillUsed (duração vem do servidor)
				return
			end
		end)
	end

	local function startCooldown(skillId: string, duration: number)
		cooldownEnds[skillId] = os.clock() + duration
		for index, entry in entries do
			if entry.Kind == "Skill" and entry.Data.Id == skillId and slots[index] then
				slots[index].Cooldown:Start(duration)
			end
		end
	end

	function self:Refresh()
		collect()
		for _, slot in slots do
			slot.Cleaner:Clean()
			slot.Button:Destroy()
		end
		table.clear(slots)
		local level = ctx.State:Get("Level") or 1
		local small = ctx.Device == "Mobile"
		local size = 56
		if small then
			size = 46
		end
		for index = 1, slotCount do
			local entry = entries[index]
			local slotCleaner = UIUtils.newCleaner()
			local btn = UIUtils.create("TextButton", {
				Name = "Slot" .. index, Parent = bar, Text = "", AutoButtonColor = false, BorderSizePixel = 0,
				Size = UDim2.fromOffset(size, size), LayoutOrder = index,
			})
			self:Skin(btn, "Surface")
			local stroke = btn:FindFirstChildOfClass("UIStroke") :: UIStroke
			local name = ""
			if entry then
				name = tostring(entry.Data.Name)
			end
			local glyph = UIUtils.create("TextLabel", {
				Parent = btn, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = string.upper(string.sub(name, 1, 1)),
			})
			self:Text(glyph, "Title", 1.2)
			local key = UIUtils.create("TextLabel", {
				Parent = btn, BackgroundTransparency = 1, Position = UDim2.fromOffset(4, 1), Size = UDim2.fromOffset(16, 14),
				Text = tostring(index), TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 3,
			})
			self:Text(key, "Muted", 0.7)
			local locked = entry ~= nil and entry.Kind == "Skill" and (entry.Data.MinLevel or 1) > level
			if entry == nil or locked then
				btn.BackgroundTransparency = 0.6
				glyph.TextTransparency = 0.5
			end
			if entry and entry.Kind == "Item" and selected == index then
				stroke.Color = self:Theme().Colors.Primary
				stroke.Thickness = self:Theme().StrokeThickness + 2
			end
			local cooldown: any = ctx.Registry:Create("CooldownIndicator", { Parent = btn }, ctx)
			slotCleaner:Add(cooldown)
			slotCleaner:Add(btn.Activated:Connect(function()
				self:Sound("Click")
				if locked then
					self:Notify("Warning", "Requer nível " .. tostring(entry.Data.MinLevel))
					return
				end
				activate(index)
			end))
			if ctx.Tooltip and entry then
				slotCleaner:Add(ctx.Tooltip:Attach(btn, function()
					return entry.Data.Name, entry.Data.Description
				end))
			end
			slots[index] = { Button = btn, Cooldown = cooldown, Cleaner = slotCleaner }
			if entry and entry.Kind == "Skill" then
				local ends = cooldownEnds[entry.Data.Id]
				if ends and ends > os.clock() then
					cooldown:Start(ends - os.clock())
				end
			end
		end
	end

	self.Cleaner:Add(ctx.State:Subscribe("Catalog", function()
		self:Refresh()
	end))
	self.Cleaner:Add(ctx.State:Subscribe("Equipped", function()
		if source == "Equipped" then
			self:Refresh()
		end
	end))
	self.Cleaner:Add(ctx.State:Subscribe("Level", function()
		self:Refresh()
	end))
	self.Cleaner:Add(ctx.Events.SkillUsed:Connect(startCooldown))
	self.Cleaner:Add(UserInputService.InputBegan:Connect(function(input: InputObject, processed: boolean)
		if processed then
			return
		end
		local index = DIGITS[input.KeyCode]
		if index and index <= slotCount then
			activate(index)
		end
	end))
	self.Cleaner:Add(function()
		for _, slot in slots do
			slot.Cleaner:Clean()
		end
	end)
	self.Cleaner:Add(ctx.DeviceChanged:Connect(function()
		self:Refresh()
	end))

	self:Mount(bar, {
		Layer = "HUD", AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.new(0.5, 0, 1, -12), Size = UDim2.fromOffset(0, 60),
	})
	bar.AutomaticSize = Enum.AutomaticSize.X
	self:Refresh()
	return self
end

return M
