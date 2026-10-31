---
name: bpy-material-editing
description: "Edição de materiais existentes por script."
metadata:
  id: SK-20-16
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-material-editing

Edição de materiais existentes por script.

**Quando usar:** Trocar cores ou texturas em lote.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Localize o material por nome.
- Ajuste as entradas do Principled BSDF.
- Verifique os slots nos objetos.

**Verificação:** Os materiais alterados têm os valores esperados.

**Complementares (sugeridas por similaridade):** `mat-shader-nodes-scripting`, `light-batch-rendering`, `mat-principled-bsdf`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
