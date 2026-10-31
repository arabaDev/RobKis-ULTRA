---
name: phys-anchoring-strategy
description: "Quando ancorar e quando deixar a física agir."
metadata:
  id: SK-06-09
  department: "Física e colisões"
  version: "1.0"
  revised: "2026-10-18"
---

# phys-anchoring-strategy

Quando ancorar e quando deixar a física agir.

**Quando usar:** Cenários com muitas partes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Ancore o que não se move; é a maior economia de física.
- Objetos dinâmicos mantêm pouca massa e poucas partes.
- Mude Anchored com cuidado, pois afeta a propriedade de rede.

**Verificação:** Número de partes não ancoradas medido e justificado.

**Complementares (sugeridas por similaridade):** `rec-strategy-switching`, `perf-physics-cost`, `proc-weapon-generator`

**Limites e recuperação:** Física varia com latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
