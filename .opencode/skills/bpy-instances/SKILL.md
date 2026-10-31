---
name: bpy-instances
description: "Instâncias e duplicatas ligadas para reduzir custo."
metadata:
  id: SK-20-13
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-instances

Instâncias e duplicatas ligadas para reduzir custo.

**Quando usar:** Muitos objetos iguais.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Objetos podem compartilhar a mesma malha.
- Instâncias de coleção para conjuntos.
- Torne único antes de alterar só uma cópia.

**Verificação:** A contagem de malhas únicas é menor que a de objetos.

**Complementares (sugeridas por similaridade):** `mat-atlases`, `ui-update-optimization`, `review-performance`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
