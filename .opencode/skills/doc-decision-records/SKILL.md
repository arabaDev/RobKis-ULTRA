---
name: doc-decision-records
description: "Registro curto de decisões técnicas: contexto, escolha, alternativas e consequências."
metadata:
  id: SK-33-05
  department: "Documentação técnica"
  version: "1.0"
  revised: "2026-10-18"
---

# doc-decision-records

Registro curto de decisões técnicas: contexto, escolha, alternativas e consequências.

**Quando usar:** Escolhas com impacto.

**Regras**
- Escreva contexto, decisão e consequências em poucas linhas.
- Cite as alternativas descartadas e o motivo.
- Date e guarde junto ao código.
- Não reescreva decisões antigas: acrescente uma nova.

**Verificação:** Alguém novo entende por que a escolha foi feita sem perguntar.

**Complementares (sugeridas por similaridade):** `ai-behavior-trees`, `move-dash-roll`, `npc-aggro-targeting`

**Limites e recuperação:** Documente só o que é verdade no código atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
