---
name: move-sprint-stamina
description: "Corrida com estamina decidida no servidor, com consumo e regeneração por tempo."
metadata:
  id: SK-41-02
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-sprint-stamina

Corrida com estamina decidida no servidor, com consumo e regeneração por tempo.

**Quando usar:** Jogos com sprint.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- A estamina é decidida no servidor e o cliente só pede o sprint.
- Consumo e regeneração por tempo.
- WalkSpeed muda ao ligar e desligar.

**Verificação:** A estamina nunca fica negativa e a velocidade volta ao normal ao esgotar.

**Complementares (sugeridas por similaridade):** `bug-race-conditions`, `combat-parry-block`, `net-gameplay-sync-timing`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
