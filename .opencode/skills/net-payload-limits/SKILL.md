---
name: net-payload-limits
description: "O que pode atravessar Remotes: tipos, tabelas e instâncias."
metadata:
  id: SK-07-04
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-payload-limits

O que pode atravessar Remotes: tipos, tabelas e instâncias.

**Quando usar:** Quando um argumento chega nil ou mudado.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Funções não são enviadas; metatables se perdem.
- Instâncias que o destino não enxerga chegam como nil.
- Tabelas com chaves mistas ou não numéricas se comportam de forma inesperada.

**Verificação:** O payload recebido foi conferido com um print e comparado ao enviado.

**Complementares (sugeridas por similaridade):** `data-budget-limits`, `fx-performance-limits`, `inv-capacity-limits`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
