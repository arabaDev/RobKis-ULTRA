---
name: bpy-data-vs-ops
description: "Quando usar bpy.data e quando usar bpy.ops."
metadata:
  id: SK-20-07
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-data-vs-ops

Quando usar bpy.data e quando usar bpy.ops.

**Quando usar:** Escrever scripts robustos.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- bpy.data não depende de contexto.
- bpy.ops depende de seleção e modo.
- Prefira data para criação e ops quando não houver alternativa.

**Verificação:** O script não depende do objeto ativo.

**Complementares (sugeridas por similaridade):** `inv-data-model`, `regr-data-compat`, `test-bpy-headless`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
