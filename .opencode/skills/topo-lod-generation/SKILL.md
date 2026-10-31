---
name: topo-lod-generation
description: "Gerar níveis de detalhe com redução."
metadata:
  id: SK-22-08
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-lod-generation

Gerar níveis de detalhe com redução.

**Quando usar:** Assets muito instanciados.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Decimate com razão por nível.
- Conferir silhueta.
- Nomear por nível.

**Verificação:** Cada nível mantém a silhueta.

**Complementares (sugeridas por similaridade):** `proc-variations-lod`, `perf-lod-roblox`, `bpy-batch-generation`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
