---
name: orch-incremental-verification
description: "Verificação incremental por etapa."
metadata:
  id: SK-35-15
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-incremental-verification

Verificação incremental por etapa.

**Quando usar:** Tarefas com muitas etapas.

**Regras**
- Verifique cada etapa ao terminar.
- Falhe cedo.
- Registre o que passou.

**Verificação:** As falhas são pegas na etapa que as causou.

**Complementares (sugeridas por similaridade):** `mcp-state-verification`, `sec-gamepass-verification`, `pipe-in-game-verification`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
