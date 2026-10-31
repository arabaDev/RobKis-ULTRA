---
name: ai-state-machines
description: "Máquinas de estados finitos para IA de inimigos."
metadata:
  id: SK-12-01
  department: "Inteligência artificial para jogos"
  version: "1.0"
  revised: "2026-10-18"
---

# ai-state-machines

Máquinas de estados finitos para IA de inimigos.

**Quando usar:** Comportamento com poucos modos claros (patrulhar, perseguir, atacar).

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Estados e transições em tabela, com uma função por estado.
- Uma única transição por tick.
- Registre o estado atual para depuração.

**Verificação:** Todos os estados são alcançáveis e têm saída.

**Complementares (sugeridas por similaridade):** `ui-state-management`, `arq-state-management`, `rec-state-rollback`

**Limites e recuperação:** Meça o custo de CPU da IA antes de aumentar a complexidade. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
