---
name: model-hard-surface
description: "Modelagem hard surface para armas e veículos."
metadata:
  id: SK-43-01
  department: "Modelagem 3D"
  version: "1.0"
  revised: "2026-10-18"
---

# model-hard-surface

Modelagem hard surface para armas e veículos.

**Quando usar:** Superfícies mecânicas com bordas definidas.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Formas primárias primeiro, depois secundárias e terciárias.
- Bevel nas bordas relevantes.
- Normais ponderadas e painéis por corte.

**Verificação:** A silhueta lê bem de longe e o orçamento é respeitado.

**Complementares (sugeridas por similaridade):** `topo-hard-surface-bevels`, `topo-boolean-operations`, `proc-symmetry-mirroring`

**Limites e recuperação:** Defina o orçamento de triângulos e o estilo antes de modelar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
