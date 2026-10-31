---
name: topo-boolean-operations
description: "Operações booleanas e limpeza posterior."
metadata:
  id: SK-22-13
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-boolean-operations

Operações booleanas e limpeza posterior.

**Quando usar:** Cortes e junções em hard surface.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Modificador Boolean com objeto de corte e operação definida.
- Aplique e limpe a geometria resultante.
- Evite booleans em malhas não manifold.

**Verificação:** A malha resultante é manifold e sem faces degeneradas.

**Complementares (sugeridas por similaridade):** `model-hard-surface`, `topo-hard-surface-bevels`, `mcp-batching-calls`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
