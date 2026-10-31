---
name: phys-vehicles
description: "Veículos com VehicleSeat, constraints e propriedade de rede."
metadata:
  id: SK-06-12
  department: "Física e colisões"
  version: "1.0"
  revised: "2026-10-18"
---

# phys-vehicles

Veículos com VehicleSeat, constraints e propriedade de rede.

**Quando usar:** Carros, barcos e montarias.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Seat ou VehicleSeat para o motorista.
- Defina o dono de rede do motorista para resposta suave.
- Limite de velocidade e recuperação ao capotar.

**Verificação:** Um jogador dirige sem jitter e o veículo não voa.

**Complementares (sugeridas por similaridade):** `phys-network-ownership`, `combat-knockback`, `npc-network-ownership`

**Limites e recuperação:** Física varia com latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
