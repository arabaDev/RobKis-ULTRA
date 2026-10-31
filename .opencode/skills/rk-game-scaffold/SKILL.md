---
name: rk-game-scaffold
description: "Estrutura mínima funcional para jogo novo. Sempre antes da primeira feature."
metadata:
  id: SK-45-08
  department: "Protocolo do agente RobKis"
  version: "1.0"
  revised: "2026-10-18"
---

# rk-game-scaffold

**Quando usar:** Jogo novo do zero ou quando o projeto não tem estrutura definida.

## Hierarquia no DataModel

```
ServerScriptService/
  GameManager (Script)          -- lifecycle: rounds, events globais, join/leave
  Services/
    DataManager (ModuleScript)  -- DataStore + session lock + schema
    RemoteHandler (Script)      -- único ponto de entrada de RemoteEvents

ReplicatedStorage/
  Shared/ (Folder)              -- ModuleScripts lidos por servidor E cliente

StarterPlayerScripts/
  PlayerController (LocalScript) -- input, câmera, predição visual

StarterGui/
  HUDController (LocalScript)   -- UI; zero lógica de jogo aqui

ServerStorage/
  Models/ (Folder)              -- modelos do servidor não replicados
  Assets/ (Folder)              -- assets de uso interno

Workspace/
  Map (Model)                   -- geometria do mapa
  Dynamic (Folder)              -- objetos criados em runtime (limpar aqui)
```

## DataManager mínimo

```luau
-- Services/DataManager.lua
--!strict
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local STORE_NAME = "PlayerData_v1" -- versão no nome para migração limpa
local SESSION_LOCK_KEY = "_lock"
local RETRY_MAX = 3
local RETRY_DELAY = 2

local store = DataStoreService:GetDataStore(STORE_NAME)
local activeSessions: {[number]: any} = {} -- userId → data

local DataManager = {}

local DEFAULT_DATA = {
    version = 1,
    coins   = 0,
    level   = 1,
    xp      = 0,
}

local function withRetry(fn: () -> any): (boolean, any)
    for attempt = 1, RETRY_MAX do
        local ok, result = pcall(fn)
        if ok then return true, result end
        if attempt < RETRY_MAX then task.wait(RETRY_DELAY * attempt) end
    end
    return false, nil
end

function DataManager.load(player: Player)
    local key = tostring(player.UserId)
    local ok, data = withRetry(function()
        return store:UpdateAsync(key, function(saved)
            if saved and saved[SESSION_LOCK_KEY] then
                -- session lock: outro servidor ainda ativo, aguardar
                return nil
            end
            local d = saved or table.clone(DEFAULT_DATA)
            d[SESSION_LOCK_KEY] = true
            return d
        end)
    end)
    if not ok or not data then
        warn("[DataManager] falhou ao carregar " .. key)
        data = table.clone(DEFAULT_DATA)
    end
    data[SESSION_LOCK_KEY] = nil
    activeSessions[player.UserId] = data
    return data
end

function DataManager.save(player: Player)
    local key = tostring(player.UserId)
    local data = activeSessions[player.UserId]
    if not data then return end
    data[SESSION_LOCK_KEY] = nil
    withRetry(function()
        store:SetAsync(key, data)
    end)
    activeSessions[player.UserId] = nil
end

function DataManager.get(player: Player): any
    return activeSessions[player.UserId]
end

-- Salvar ao fechar servidor
game:BindToClose(function()
    if RunService:IsStudio() then task.wait(2) end
    for _, player in Players:GetPlayers() do
        DataManager.save(player)
    end
end)

return DataManager
```

## RemoteHandler mínimo

```luau
-- Services/RemoteHandler.lua (Script)
--!strict
local Remotes = game.ReplicatedStorage.Remotes

-- Padrão: cada Remote tem handler explícito, nunca catch-all
local handlers: {[string]: (player: Player, ...any) -> ()} = {
    -- Registrar aqui ao criar cada Remote
    -- ["ActionName"] = function(player, ...) end,
}

for name, handler in handlers do
    local remote = Remotes:FindFirstChild(name)
    if remote and remote:IsA("RemoteEvent") then
        remote.OnServerEvent:Connect(function(player, ...)
            -- Rate limit básico (expandir com sec-rate-limit-implementation)
            handler(player, ...)
        end)
    end
end
```

## Verificação do scaffold

- [ ] DataManager carrega sem erro no Output.
- [ ] `game:BindToClose` dispara e salva em Studio (Run → Stop, verificar Output).
- [ ] RemoteHandler conecta sem erro.
- [ ] Estrutura de pastas verificada no Explorer.
- [ ] Constants congelada com `table.freeze`.

**Skills complementares:** `rk-genre-templates`, `arq-service-layering`, `arq-client-server-boundary`, `data-session-locking`, `data-autosave-bindtoclose`, `data-updateasync-pattern`, `sec-remote-input-validation`, `arq-config-driven-design`
