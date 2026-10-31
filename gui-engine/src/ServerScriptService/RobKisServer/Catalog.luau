--!strict
-- Local: ServerScriptService.RobKisServer.Catalog
-- Tipo: ModuleScript (servidor) | Função: ÚNICA fonte de preços, itens, habilidades, missões e classes.
-- Os dados abaixo são EXEMPLOS: troque pelos do seu jogo. O cliente só recebe a versão de exibição (View).

local Catalog = {}

Catalog.Slots = { "Weapon", "Armor", "Accessory", "Pet" }
Catalog.SlotNames = { Weapon = "Arma", Armor = "Armadura", Accessory = "Acessório", Pet = "Mascote" }

Catalog.Items = {
	{ Id = "sword_training", Name = "Espada de Treino", Description = "Lâmina simples para começar.", Price = 100, Currency = "Coins", Rarity = "Common", Slot = "Weapon", Category = "Armas" },
	{ Id = "sword_flame", Name = "Espada Flamejante", Description = "Queima os inimigos ao toque.", Price = 1200, Currency = "Coins", Rarity = "Epic", Slot = "Weapon", Category = "Armas" },
	{ Id = "armor_leather", Name = "Armadura de Couro", Description = "Proteção leve.", Price = 250, Currency = "Coins", Rarity = "Common", Slot = "Armor", Category = "Equipamento" },
	{ Id = "armor_knight", Name = "Armadura de Cavaleiro", Description = "Proteção pesada.", Price = 900, Currency = "Coins", Rarity = "Rare", Slot = "Armor", Category = "Equipamento" },
	{ Id = "ring_luck", Name = "Anel da Sorte", Description = "Brilha ao encontrar tesouros.", Price = 30, Currency = "Gems", Rarity = "Rare", Slot = "Accessory", Category = "Equipamento" },
	{ Id = "pet_slime", Name = "Slime", Description = "Pequeno e leal.", Price = 150, Currency = "Coins", Rarity = "Common", Slot = "Pet", Category = "Pet", Multiplier = 1.1 },
	{ Id = "pet_wolf", Name = "Lobo Azul", Description = "Rápido e protetor.", Price = 45, Currency = "Gems", Rarity = "Epic", Slot = "Pet", Category = "Pet", Multiplier = 1.5 },
	{ Id = "pet_dragon", Name = "Dragãozinho", Description = "Lendário e raro.", Price = 120, Currency = "Gems", Rarity = "Legendary", Slot = "Pet", Category = "Pet", Multiplier = 2 },
}

Catalog.Skills = {
	{ Id = "slash", Name = "Golpe Rápido", Description = "Ataque veloz à frente.", Cooldown = 3, EnergyCost = 5, MinLevel = 1 },
	{ Id = "burst", Name = "Explosão", Description = "Dano em área ao redor.", Cooldown = 8, EnergyCost = 20, MinLevel = 3 },
	{ Id = "dash", Name = "Investida", Description = "Avança rapidamente.", Cooldown = 5, EnergyCost = 10, MinLevel = 2 },
	{ Id = "ultimate", Name = "Fúria", Description = "Poder máximo por pouco tempo.", Cooldown = 30, EnergyCost = 50, MinLevel = 5 },
}

Catalog.Quests = {
	{ Id = "q_first_steps", Title = "Primeiros passos", Description = "Derrote 5 inimigos.", Goal = 5, Reward = { Currency = "Coins", Amount = 150 } },
	{ Id = "q_collector", Title = "Colecionador", Description = "Colete 10 recursos.", Goal = 10, Reward = { Currency = "Coins", Amount = 300 } },
	{ Id = "q_gems", Title = "Caça-gemas", Description = "Encontre 3 gemas.", Goal = 3, Reward = { Currency = "Gems", Amount = 5 } },
}

Catalog.Classes = {
	{ Id = "c_adventurer", Name = "Aventureiro", Description = "Equilibrado, ideal para começar.", Price = 0, Currency = "Coins", StartItems = { { Name = "Espada de Treino", Count = 1 } } },
	{ Id = "c_miner", Name = "Minerador", Description = "Começa com ferramentas de coleta.", Price = 500, Currency = "Coins", StartItems = { { Name = "Picareta", Count = 1 }, { Name = "Tocha", Count = 2 } } },
	{ Id = "c_hunter", Name = "Caçador", Description = "Especialista em combate à distância.", Price = 40, Currency = "Gems", StartItems = { { Name = "Arco", Count = 1 }, { Name = "Flechas", Count = 20 } } },
}

local function index(list: { any }): { [string]: any }
	local out = {}
	for _, entry in list do
		out[entry.Id] = entry
	end
	return out
end

Catalog.ItemsById = index(Catalog.Items)
Catalog.SkillsById = index(Catalog.Skills)
Catalog.QuestsById = index(Catalog.Quests)
Catalog.ClassesById = index(Catalog.Classes)

Catalog.SlotSet = {}
for _, slot in Catalog.Slots do
	Catalog.SlotSet[slot] = true
end

-- Versão enviada ao cliente (apenas exibição; preço real é sempre conferido no servidor).
function Catalog.View(): { [string]: any }
	return {
		Slots = Catalog.Slots, SlotNames = Catalog.SlotNames, Items = Catalog.Items,
		Skills = Catalog.Skills, Quests = Catalog.Quests, Classes = Catalog.Classes,
	}
end

return Catalog
