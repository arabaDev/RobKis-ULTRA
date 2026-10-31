---
name: topo-triangulation
description: "Triangulação controlada antes da exportação."
metadata:
  id: SK-22-15
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-triangulation

Triangulação controlada antes da exportação.

**Quando usar:** Sombreamento estranho após a importação.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Use o modificador Triangulate ou bmesh.ops.triangulate.
- Faça depois de aplicar os outros modificadores.
- Verifique as normais depois.

**Verificação:** A malha importada sombreia como no Blender.

**Complementares (sugeridas por similaridade):** `regr-asset-rechecks`, `compat-exporter-changes`, `rk-asset-security-scan`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
