---
name: luau-error-handling
description: "Tratamento de erros com pcall, xpcall, assert e erro estruturado."
metadata:
  id: SK-02-03
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-error-handling

Tratamento de erros com pcall, xpcall, assert e erro estruturado.

**Quando usar:** Em chamadas que podem falhar (DataStore, Marketplace, HTTP).

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- pcall retorna ok e resultado; trate o caso de falha, não ignore.
- xpcall com debug.traceback quando precisar do stack.
- Retorne ok e erro em funções próprias em vez de lançar erro por fluxo normal.

**Verificação:** Cada chamada que pode falhar tem caminho de falha testado.

**Complementares (sugeridas por similaridade):** `bpy-error-handling-verify`, `rec-timeout-handling`, `mcp-error-triage`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
