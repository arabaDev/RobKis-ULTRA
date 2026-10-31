---
name: test-edge-cases
description: "Casos de borda: nil, vazio, limites e concorrência."
metadata:
  id: SK-18-04
  department: "Testes automatizados"
  version: "1.0"
  revised: "2026-10-18"
---

# test-edge-cases

Casos de borda: nil, vazio, limites e concorrência.

**Quando usar:** Antes de entregar um sistema.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Liste os limites das entradas.
- Teste valores extremos.
- Teste sequências rápidas.

**Verificação:** Cada caso de borda tem resultado esperado e observado.

**Complementares (sugeridas por similaridade):** `topo-edge-flow`, `orch-concurrency-limits`, `luau-linting-formatting`

**Limites e recuperação:** Diga o que foi executado e o que depende de teste manual no Studio. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
