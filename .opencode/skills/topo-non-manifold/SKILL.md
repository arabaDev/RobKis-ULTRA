---
name: topo-non-manifold
description: "Detectar e corrigir geometria não manifold."
metadata:
  id: SK-22-05
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-non-manifold

Detectar e corrigir geometria não manifold.

**Quando usar:** Furos e arestas soltas.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Selecionar não manifold.
- Fechar ou remover.
- Revalidar.

**Verificação:** Sem arestas soltas.

**Complementares (sugeridas por similaridade):** `uv-stretch-checking`, `topo-edge-flow`, `pipe-pivot-fix`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
