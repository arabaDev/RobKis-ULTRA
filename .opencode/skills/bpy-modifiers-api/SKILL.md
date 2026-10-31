---
name: bpy-modifiers-api
description: "Modificadores via objects.modifiers.new e aplicação."
metadata:
  id: SK-20-04
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-modifiers-api

Modificadores via objects.modifiers.new e aplicação.

**Quando usar:** Bevel, Mirror, Array e outros.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- obj.modifiers.new(name, type).
- Aplicar com modifier_apply em contexto correto.
- Ordem dos modificadores importa.

**Verificação:** A malha final conferida após aplicar.

**Complementares (sugeridas por similaridade):** `move-speed-modifiers`, `arq-api-contracts`, `compat-roblox-api-changes`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
