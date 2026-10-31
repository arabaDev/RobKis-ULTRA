---
name: data-session-locking
description: "Bloqueio de sessão para evitar dois servidores sobrescrevendo."
metadata:
  id: SK-15-02
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-session-locking

Bloqueio de sessão para evitar dois servidores sobrescrevendo.

**Quando usar:** Jogadores que trocam de servidor rapidamente.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Marque o dono da sessão no registro com UpdateAsync.
- Libere ao sair.
- Trate bloqueio expirado com cuidado.

**Verificação:** Dois servidores não salvam o mesmo jogador ao mesmo tempo.

**Complementares (sugeridas por similaridade):** `net-session-management`, `anim-r15-vs-r6`, `combat-parry-block`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
