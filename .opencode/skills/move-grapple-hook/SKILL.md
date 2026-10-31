---
name: move-grapple-hook
description: "Gancho de arremesso com constraint."
metadata:
  id: SK-41-10
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-grapple-hook

Gancho de arremesso com constraint.

**Quando usar:** Mecânicas de deslocamento.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Um raycast encontra o ponto de fixação.
- AlignPosition ou RopeConstraint com limites.
- Alcance e cooldown validados no servidor.

**Verificação:** O gancho puxa até o ponto e solta ao fim.

**Complementares (sugeridas por similaridade):** `model-hard-surface`, `anim3d-root-motion`, `ai-behavior-trees`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
