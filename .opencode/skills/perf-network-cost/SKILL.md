---
name: perf-network-cost
description: "Custo de rede: Remotes, replicação e propriedades."
metadata:
  id: SK-16-07
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-network-cost

Custo de rede: Remotes, replicação e propriedades.

**Quando usar:** Ping alto ou tráfego intenso.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Reduza disparos e tamanho de payload.
- Agrupe mensagens.
- Evite replicar o que o cliente não usa.

**Verificação:** Tráfego medido antes e depois.

**Complementares (sugeridas por similaridade):** `npc-network-ownership`, `phys-network-ownership`, `regr-network-contracts`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
