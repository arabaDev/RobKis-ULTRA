---
name: perf-lod-roblox
description: "Níveis de detalhe no Roblox com RenderFidelity e distância."
metadata:
  id: SK-16-18
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-lod-roblox

Níveis de detalhe no Roblox com RenderFidelity e distância.

**Quando usar:** Muitos MeshParts detalhados.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- RenderFidelity Automatic ajusta o detalhe por distância e Performance usa o mais simples.
- Use malhas simplificadas para objetos distantes.
- Confira o efeito visual.

**Verificação:** Os triângulos renderizados medidos caem sem artefato visível.

**Complementares (sugeridas por similaridade):** `topo-lod-generation`, `proc-variations-lod`, `rig-naming-roblox`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
