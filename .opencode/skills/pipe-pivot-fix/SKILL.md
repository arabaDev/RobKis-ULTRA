---
name: pipe-pivot-fix
description: "Corrigir pivô de modelos importados."
metadata:
  id: SK-28-05
  department: "Integração Blender–Roblox"
  version: "1.0"
  revised: "2026-10-18"
---

# pipe-pivot-fix

Corrigir pivô de modelos importados.

**Quando usar:** Rotação e posicionamento estranhos.

**Requer:** Blender disponível, Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Model:PivotTo e WorldPivot.
- Corrija na origem do Blender quando possível.
- Verifique ao clonar.

**Verificação:** PivotTo posiciona o modelo no ponto esperado.

**Complementares (sugeridas por similaridade):** `rig-naming-roblox`, `rig-apply-scale`, `tool-grip-positioning`

**Limites e recuperação:** Sem importação automática, entregue o passo a passo manual e marque como pendente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
