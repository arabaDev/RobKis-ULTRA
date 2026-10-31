---
name: rk-asset-security-scan
description: "Scan obrigatório de segurança em todo asset inserido. Detecta backdoors antes de entrar no projeto."
metadata:
  id: SK-45-02
  department: "Protocolo do agente RobKis"
  version: "1.0"
  revised: "2026-10-18"
---

# rk-asset-security-scan

**Quando usar:** Após inserir qualquer free model, plugin, pacote ou asset de terceiro.

**Protocolo de scan (via MCP)**
2. Para cada Script, LocalScript e ModuleScript encontrado: `script_read` e analisar o conteúdo.
3. Checar presença de qualquer flag abaixo.

**Flags de alerta imediato (SUSPEITO):**

| Flag | Exemplo | Risco |
|---|---|---|
| `require(<número>)` | `require(1234567890)` | Carrega código externo não inspecionável |
| `getfenv` / `setfenv` | `getfenv(1)` | Acessa ambiente de execução para bypass |
| `loadstring` | `loadstring(data)()` | Executa código arbitrário em string |
| `HttpService` para domínio desconhecido | `GetAsync("http://...")`  | Exfiltra dados / recebe payload |
| `while true do` sem `task.wait` | loop infinito vazio | Consome CPU, possível DDoS interno |
| `game.Players` + `Kick` / `Ban` sem auth | banir jogadores sem verificação | Backdoor admin |
| `_G` ou `shared` para persistência | `_G.backdoor = ...` | Canal oculto entre scripts |

**Resultado obrigatório:**
- **LIMPO:** nenhuma flag encontrada. Registrar em `AGENTS.md`.
- **SUSPEITO:** listar flag + localização exata (Script → linha). Remover o asset. Notificar o usuário. Buscar alternativa.

**Sem MCP:**
Gerar checklist manual para o usuário: quais instâncias abrir no Explorer, quais scripts inspecionar, o que procurar.

**Verificação:** Cada asset tem estado LIMPO ou SUSPEITO documentado antes do próximo passo.

**Skills complementares:** `rk-toolbox-first`, `secan-free-model-audit`, `sec-script-visibility`, `roblox-security`
