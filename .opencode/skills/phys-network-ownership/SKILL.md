---
name: phys-network-ownership
description: "Propriedade de rede de física e SetNetworkOwner."
metadata:
  id: SK-06-02
  department: "Física e colisões"
  version: "1.0"
  revised: "2026-10-18"
---

# phys-network-ownership

Propriedade de rede de física e SetNetworkOwner.

**Quando usar:** Veículos, objetos arremessáveis e jitter de física.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- BasePart:SetNetworkOwner(player) ou nil para o servidor.
- Partes ancoradas não têm dono de rede.
- Dono do cliente simula localmente e pode manipular; valide efeitos importantes.

**Verificação:** GetNetworkOwner retorna o esperado.

**Complementares (sugeridas por similaridade):** `npc-network-ownership`, `anim-ownership-permissions`, `perf-network-cost`

**Limites e recuperação:** Física varia com latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
