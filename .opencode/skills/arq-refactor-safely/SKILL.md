---
name: arq-refactor-safely
description: "Refatora em passos pequenos sem quebrar o que funciona."
metadata:
  id: SK-01-12
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-refactor-safely

Refatora em passos pequenos sem quebrar o que funciona.

**Quando usar:** Quando um sistema precisa de reorganização.

**Regras**
- Registre o comportamento atual (teste ou checklist) antes de mudar.
- Uma mudança estrutural por vez, com verificação entre elas.
- Não misture refatoração com funcionalidade nova.

**Verificação:** O mesmo checklist passa antes e depois.

**Complementares (sugeridas por similaridade):** `topo-decimation-safely`, `net-attributes-replication`, `arq-extensibility-patterns`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
