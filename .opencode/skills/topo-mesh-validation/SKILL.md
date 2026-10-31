---
name: topo-mesh-validation
description: "Validação geral da malha antes da entrega."
metadata:
  id: SK-22-12
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-mesh-validation

Validação geral da malha antes da entrega.

**Quando usar:** Fim da modelagem.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Sem não manifold, sem duplicados, normais ok.
- Sem geometria interna oculta.
- Contagens dentro do orçamento.

**Verificação:** Relatório de validação por malha.

**Complementares (sugeridas por similaridade):** `bpy-mesh-stats`, `uv-export-validation`, `proc-validation-bounds`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
