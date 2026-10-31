---
name: dep-removal-safety
description: "Remoção segura de código e assets."
metadata:
  id: SK-34-10
  department: "Análise de dependências"
  version: "1.0"
  revised: "2026-10-18"
---

# dep-removal-safety

Remoção segura de código e assets.

**Quando usar:** Limpeza de projeto.

**Regras**
- Confirme que não há usos.
- Remova em passo isolado.
- Teste.

**Verificação:** Nada quebrou com a remoção.

**Complementares (sugeridas por similaridade):** `mcp-permissions-safety`, `orch-parallel-safety`, `bpy-scene-setup`

**Limites e recuperação:** Confirme com busca real; não presuma dependências. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
