---
name: perf-debris-cleanup
description: "Limpeza de instâncias temporárias com Debris ou task.delay."
metadata:
  id: SK-16-15
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-debris-cleanup

Limpeza de instâncias temporárias com Debris ou task.delay.

**Quando usar:** Efeitos, projéteis e itens temporários.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Debris:AddItem agenda a destruição.
- Ou use task.delay com Destroy, verificando se o objeto ainda existe.
- Reaproveite o objeto quando for criado com frequência.

**Verificação:** Nenhuma instância temporária permanece após o tempo definido.

**Complementares (sugeridas por similaridade):** `luau-cleanup-patterns`, `tool-respawn-cleanup`, `anim-cleanup-tracks`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
