---
name: data-memorystore-usage
description: "MemoryStoreService para dados temporários e filas."
metadata:
  id: SK-15-09
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-memorystore-usage

MemoryStoreService para dados temporários e filas.

**Quando usar:** Matchmaking e estado curto entre servidores.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- SortedMap, HashMap e Queue com expiração.
- Não use como armazenamento permanente.
- Respeite os limites.

**Verificação:** Dados expiram conforme o TTL.

**Complementares (sugeridas por similaridade):** `net-messaging-memorystore`, `mcp-blender-usage`, `mcp-roblox-studio-usage`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
