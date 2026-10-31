---
name: proc-variations-lod
description: "Variações e níveis de detalhe gerados juntos."
metadata:
  id: SK-21-09
  department: "Modelagem procedural"
  version: "1.0"
  revised: "2026-10-18"
---

# proc-variations-lod

Variações e níveis de detalhe gerados juntos.

**Quando usar:** Assets usados em muitas instâncias.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Versão detalhada e versão simples.
- Mesma origem e escala.
- Nomes por nível.

**Verificação:** Todos os níveis alinham.

**Complementares (sugeridas por similaridade):** `topo-lod-generation`, `perf-lod-roblox`, `luau-cleanup-patterns`

**Limites e recuperação:** Geração procedural precisa de validação de dimensões e contagens. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
