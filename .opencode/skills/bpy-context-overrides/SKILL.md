---
name: bpy-context-overrides
description: "Operadores bpy.ops com contexto explícito."
metadata:
  id: SK-20-05
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-context-overrides

Operadores bpy.ops com contexto explícito.

**Quando usar:** Operadores que falham por contexto.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Use bpy.context.temp_override quando necessário.
- Entre em Object Mode antes.
- Prefira bpy.data e bmesh.

**Verificação:** O operador executa sem erro de contexto.

**Complementares (sugeridas por similaridade):** `orch-context-minimization`, `bpy-data-vs-ops`, `bpy-script-failure-diagnosis`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
