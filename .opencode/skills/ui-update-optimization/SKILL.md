---
name: ui-update-optimization
description: "Reduzir o custo de atualizar a UI."
metadata:
  id: SK-09-18
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-update-optimization

Reduzir o custo de atualizar a UI.

**Quando usar:** UI com muitos elementos ou atualizações frequentes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Atualize só o que mudou.
- Agrupe atualizações por frame.
- Reaproveite elementos em vez de recriar.

**Verificação:** O tempo de script de UI medido cai com muitos elementos.

**Complementares (sugeridas por similaridade):** `light-sample-optimization`, `perf-loop-optimization`, `perf-particle-optimization`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
