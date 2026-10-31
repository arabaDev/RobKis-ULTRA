---
name: mcp-side-effect-verification
description: "Verificar efeitos colaterais após chamadas."
metadata:
  id: SK-19-17
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-side-effect-verification

Verificar efeitos colaterais após chamadas.

**Quando usar:** Ferramentas que alteram vários objetos.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Compare o estado antes e depois.
- Procure alterações além do alvo.
- Reporte as diferenças.

**Verificação:** Só o alvo mudou.

**Complementares (sugeridas por similaridade):** `fx-client-side-effects`, `mcp-state-verification`, `tool-respawn-cleanup`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
