---
name: secan-threat-modeling
description: "Modelagem de ameaças de um jogo."
metadata:
  id: SK-39-01
  department: "Análise de segurança"
  version: "1.0"
  revised: "2026-10-18"
---

# secan-threat-modeling

Modelagem de ameaças de um jogo.

**Quando usar:** Antes de lançar sistemas com valor.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Liste ativos: moeda, itens, dados.
- Liste vetores: Remotes, compras.
- Priorize por impacto.

**Verificação:** Lista de ameaças priorizada.

**Complementares (sugeridas por similaridade):** `bpy-bmesh-modeling`, `perf-low-end-testing`, `topo-mesh-validation`

**Limites e recuperação:** Auditoria só no seu próprio jogo; reporte o que não foi revisado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
