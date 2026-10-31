---
name: topo-decimation-safely
description: "Redução de polígonos sem destruir a forma."
metadata:
  id: SK-22-10
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-decimation-safely

Redução de polígonos sem destruir a forma.

**Quando usar:** Estourou o orçamento.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Decimate como último recurso.
- Preservar bordas importantes.
- Revisar visualmente.

**Verificação:** A forma continua reconhecível.

**Complementares (sugeridas por similaridade):** `arq-refactor-safely`, `bpy-mesh-stats`, `topo-merge-doubles`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
