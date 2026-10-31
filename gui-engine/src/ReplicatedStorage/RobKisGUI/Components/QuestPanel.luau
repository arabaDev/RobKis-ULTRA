--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.QuestPanel
-- Tipo: ModuleScript (componente cliente) | Função: missões com progresso e botão Resgatar.
-- O progresso é definido pelo servidor (RobKisServer API.AddQuestProgress) e o resgate é validado lá.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local window: any = ctx.Registry:Create("ModalWindow", { Panel = config.Panel or "Quests", Title = config.Title or "Missões", Size = UDim2.fromScale(0.55, 0.7) }, ctx)
	self.Window = window
	self.Instance = window.Instance
	self.Cleaner:Add(window)
	local list = UIUtils.scroller(window.Content, "List", nil, 8)
	local rows: { { Frame: Instance, Bar: any } } = {}
	local pending: { [string]: boolean } = {}

	local function clear()
		for _, row in rows do
			row.Bar:Destroy()
			row.Frame:Destroy()
		end
		table.clear(rows)
	end

	local function rebuild()
		clear()
		local catalog = ctx.State:Get("Catalog")
		local progress = ctx.State:Get("Quests")
		if type(catalog) ~= "table" or type(progress) ~= "table" then
			return
		end
		for index, quest in catalog.Quests or {} do
			local entry = progress[quest.Id] or { Progress = 0, Claimed = false }
			local row = UIUtils.create("Frame", { Parent = list, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 92), LayoutOrder = index })
			self:Skin(row, "Panel")
			local title = UIUtils.create("TextLabel", {
				Parent = row, BackgroundTransparency = 1, Position = UDim2.fromOffset(12, 4), Size = UDim2.new(1, -130, 0, 22),
				TextXAlignment = Enum.TextXAlignment.Left, Text = tostring(quest.Title),
			})
			self:Text(title, "Title", 0.85)
			local desc = UIUtils.create("TextLabel", {
				Parent = row, BackgroundTransparency = 1, Position = UDim2.fromOffset(12, 26), Size = UDim2.new(1, -130, 0, 20),
				TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring(quest.Description or ""),
			})
			self:Text(desc, "Body", 0.8)
			local bar: any = ctx.Registry:Create("ProgressBar", { Parent = row, Size = UDim2.new(1, -140, 0, 16), ColorRole = "Primary", Max = quest.Goal, Value = entry.Progress }, ctx)
			bar.Instance.Position = UDim2.fromOffset(12, 52)
			bar:SetText(string.format("%d/%d", math.min(entry.Progress, quest.Goal), quest.Goal))
			local reward = UIUtils.create("TextLabel", {
				Parent = row, BackgroundTransparency = 1, Position = UDim2.fromOffset(12, 70), Size = UDim2.new(1, -130, 0, 18),
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = "Recompensa: " .. UIUtils.formatNumber(quest.Reward.Amount) .. " " .. tostring(quest.Reward.Currency),
			})
			self:Text(reward, "Muted", 0.75)
			local label = "Resgatar"
			if entry.Claimed then
				label = "Resgatada"
			end
			local claim = self:Button(row, label, "Success", function()
				if pending[quest.Id] then
					return
				end
				pending[quest.Id] = true
				ctx.Request("ClaimQuest", { questId = quest.Id }, function(ok: boolean)
					pending[quest.Id] = nil
					if ok then
						self:Notify("Success", "Recompensa resgatada: " .. tostring(quest.Title))
					end
				end)
			end)
			claim.AnchorPoint = Vector2.new(1, 0.5)
			claim.Position = UDim2.new(1, -10, 0.5, 0)
			claim.Size = UDim2.fromOffset(104, 34)
			self:SetEnabled(claim, entry.Progress >= quest.Goal and not entry.Claimed)
			table.insert(rows, { Frame = row, Bar = bar })
		end
	end

	self.Cleaner:Add(ctx.State:Subscribe("Quests", rebuild))
	self.Cleaner:Add(ctx.State:Subscribe("Catalog", rebuild))
	self.Cleaner:Add(clear)
	rebuild()
	return self
end

return M
