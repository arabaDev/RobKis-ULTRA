---
name: rk-math-rng
description: "RNG seeded, weighted loot, spawn orgânico com math.noise e progressão com curvas."
metadata:
  id: SK-45-07
  department: "Protocolo do agente RobKis"
  version: "1.0"
  revised: "2026-10-18"
---

# rk-math-rng

**Quando usar:** Qualquer sistema que usa aleatoriedade, loot ou progressão de stats.

Matemática correta para randomização, loot, spawn e progressão. `math.random` nu nunca entra em código de produção.

## RNG reproduzível — sempre no servidor

```luau
-- Seed explícita para resultado reproduzível (debugging, fairness)
local rng = Random.new(seed or os.time())

-- Uso básico
local valor = rng:NextNumber(min, max)   -- float
local inteiro = rng:NextInteger(min, max) -- int
```

**Regra:** `Random.new` no servidor. Cliente nunca usa RNG para decisões de jogo (loot, dano, spawn).

## Weighted loot table

```luau
-- Definição: pesos somam qualquer valor (não precisam ser %)
local LOOT_TABLE = {
    { id = "common",    weight = 70,  item = "WoodSword"  },
    { id = "rare",      weight = 25,  item = "IronSword"  },
    { id = "legendary", weight = 5,   item = "DragonBlade"},
}

-- Função genérica, reutilizável
local function weightedRoll(rng: Random, table: {any}): any
    local totalWeight = 0
    for _, entry in table do totalWeight += entry.weight end

    local roll = rng:NextNumber(0, totalWeight)
    local accumulated = 0
    for _, entry in table do
        accumulated += entry.weight
        if roll <= accumulated then return entry end
    end
    return table[#table] -- fallback
end

local result = weightedRoll(rng, LOOT_TABLE)
```

## Spawn orgânico com math.noise

```luau
-- math.noise retorna [-1, 1]; mapear para [0, 1] para densidade
local function shouldSpawn(x: number, z: number, threshold: number): boolean
    local noise = (math.noise(x * 0.05, z * 0.05) + 1) / 2
    return noise > threshold -- threshold 0.6 = 40% de chance aprox
end

-- Rejeição de posição: garantir distância mínima entre spawns
local function isPositionValid(pos: Vector3, existingPositions: {Vector3}, minDist: number): boolean
    for _, existing in existingPositions do
        if (pos - existing).Magnitude < minDist then return false end
    end
    return true
end
```

## Stat scaling com curvas

```luau
-- HP escala mais rápido que ATK para manter combate interessante
local function calcHp(base: number, level: number): number
    return math.clamp(math.round(base * (1 + level ^ 1.2)), base, base * 50)
end

local function calcAtk(base: number, level: number): number
    return math.clamp(math.round(base * (1 + level ^ 1.1)), base, base * 30)
end

-- Curva de XP: cada level exige mais
local function xpToLevel(level: number): number
    return math.round(100 * (level ^ 1.5))
end
```

## Cooldown preciso

```luau
-- os.clock() em vez de tick() (mais preciso, não usa wall clock)
local cooldowns: {[Player]: number} = {}
local COOLDOWN = 0.5 -- segundos

game.ReplicatedStorage.AttackRemote.OnServerEvent:Connect(function(player)
    local now = os.clock()
    if (cooldowns[player] or 0) > now then return end -- rejeitado
    cooldowns[player] = now + COOLDOWN
    -- processar ataque
end)
```

**Verificação:** Pesos da loot table somados e conferidos. Distribuição testada com 1000 rolls em script de teste. Scaling plotado para os primeiros 50 levels.

**Skills complementares:** `combat-cooldowns`, `combat-hit-dedup`, `eco-currency-design`, `eco-pricing-balance`, `luau-math-vectors-cframe`
