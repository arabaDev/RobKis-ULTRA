---
name: luau-best-practices
description: "Boas práticas de Luau — tipagem, tasks, conexões de evento, tratamento de nil e erros. Use ao escrever ou revisar qualquer script Luau."
metadata:
  id: SK-02-18
  department: "Programação Luau"
  version: 1.0
  revised: 2026-10-18
---

# Luau Best Practices

- `--!strict` em ModuleScripts; tipos em funções públicas (`type Config = { Cooldown: number }`).
- Use `task.wait`, `task.spawn`, `task.defer`, `task.delay`. **Não** use `wait()`, `spawn()`, `delay()` (legados).
- `game:GetService("X")` no topo, uma vez, em `local`.
- `FindFirstChild` / `WaitForChild(nome, timeout)` e cheque `nil`. Sem timeout, o script pode travar para sempre.
- Guarde `RBXScriptConnection` e chame `:Disconnect()` quando o objeto/jogador some. Nunca `:Connect` dentro de loop sem controle.
- Limpe estado por jogador em `Players.PlayerRemoving` (tabelas indexadas por `Player` vazam).
- `pcall` em DataStore, MarketplaceService, HttpService.
- Prefira atributos/`ValueObject`s a variáveis globais compartilhadas; prefira eventos a polling.
- Tabelas: `table.create(n)` para arrays grandes; `table.clear`, `table.freeze` para config imutável.
- Medir tempo: `os.clock()`; frame loop: `RunService.Heartbeat`. Evite lógica pesada por frame.
- Nomes claros, funções curtas, comentário só no "porquê".
- Não use `Instance.new(nome, parent)` com parent como segundo argumento em loops quentes: defina propriedades e depois `Parent` por último.

## Padrões de lógica avançada

Checklist acima evita erro básico. Isto aqui é sobre estrutura — a diferença entre um script que "funciona" e um que escala sem virar spaghetti.

### Máquina de estados (em vez de flags booleanas soltas)

```lua
--!strict
type State = "Idle" | "Chasing" | "Attacking" | "Stunned"

local StateMachine = {}
StateMachine.__index = StateMachine

type Transitions = { [State]: { [State]: true } }
local ALLOWED: Transitions = {
	Idle = { Chasing = true },
	Chasing = { Attacking = true, Idle = true, Stunned = true },
	Attacking = { Chasing = true, Stunned = true },
	Stunned = { Idle = true },
}

function StateMachine.new(initial: State)
	local self = setmetatable({ state = initial, onEnter = {} :: { [State]: ((State) -> ())? } }, StateMachine)
	return self
end

function StateMachine:transition(next: State): boolean
	local allowed = ALLOWED[self.state]
	if not allowed or not allowed[next] then
		warn(`transição inválida: {self.state} -> {next}`)
		return false
	end
	local prev = self.state
	self.state = next
	local handler = self.onEnter[next]
	if handler then
		handler(prev)
	end
	return true
end

return StateMachine
```

Por que isso é melhor que `isAttacking = true` espalhado: toda transição passa por uma validação central, então um estado inválido (atacar enquanto atordoado) é impossível em vez de ser um bug que você vai caçar depois.

### Tratamento de erro como valor, não como exceção escondida

```lua
--!strict
type Result<T> = { ok: true, value: T } | { ok: false, error: string }

local function tryPurchase(player: Player, price: number): Result<number>
	local profile = DataStore.get(player)
	if not profile then
		return { ok = false, error = "profile_not_loaded" }
	end
	if profile.coins < price then
		return { ok = false, error = "insufficient_funds" }
	end
	profile.coins -= price
	return { ok = true, value = profile.coins }
end

local result = tryPurchase(player, 100)
if result.ok then
	remoteEvent:FireClient(player, "PurchaseOk", result.value)
else
	remoteEvent:FireClient(player, "PurchaseFailed", result.error)
end
```

Isso evita o padrão comum de "a função retorna `nil` silenciosamente e quebra três camadas acima sem explicação". O chamador é **forçado** pelo tipo a checar `result.ok` antes de acessar `.value`.

### Módulo com injeção de dependência (testável, sem acoplar a `game:GetService` direto)

```lua
--!strict
local EconomyService = {}
EconomyService.__index = EconomyService

type Deps = { dataStore: DataStoreService, marketplace: MarketplaceService }

function EconomyService.new(deps: Deps)
	return setmetatable({ _deps = deps }, EconomyService)
end

function EconomyService:grantCurrency(player: Player, amount: number)
	-- usa self._deps.dataStore em vez de game:GetService("DataStoreService") direto
	-- permite injetar um mock nos testes, sem tocar DataStore real
end

return EconomyService
```

### Regra de bolso

- Flag booleana solta (`isDead`, `isBusy`, `canMove`) que pode combinar de forma inválida com outra → vira máquina de estados.
- Função que pode falhar e quem chama precisa saber **por quê** → retorna `Result<T>`, não `nil` nem `error()` sem contexto.
- Módulo que chama `game:GetService` direto em vários pontos internos → recebe as dependências no `.new()`, fica testável.
- `RemoteEvent` recebido no servidor → **nunca** confie no payload; valide tipo, dono (`player == expected`), e limites de valor antes de agir — trate toda entrada do cliente como hostil por padrão.

**Verificação:** Análise estática sem erros e nenhum uso de wait(), spawn() ou delay().
