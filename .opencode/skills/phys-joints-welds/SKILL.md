---
name: phys-joints-welds
description: "WeldConstraint, Weld, Motor6D e quando usar cada um."
metadata:
  id: SK-06-11
  department: "Física e colisões"
  version: "1.0"
  revised: "2026-10-18"
---

# phys-joints-welds

WeldConstraint, Weld, Motor6D e quando usar cada um.

**Quando usar:** Ao unir partes de modelos e ferramentas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- WeldConstraint mantém posição relativa de forma simples.
- Motor6D é usado em rigs e animação.
- Evite juntas redundantes.

**Verificação:** O modelo se move como unidade sem partes soltas.

**Complementares (sugeridas por similaridade):** `tool-custom-models`, `secan-free-model-audit`, `bpy-data-vs-ops`

**Limites e recuperação:** Física varia com latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
