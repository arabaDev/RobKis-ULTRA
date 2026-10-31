---
name: inv-rarity-sorting
description: "Ordenação e filtro de itens por raridade e tipo."
metadata:
  id: SK-13-12
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-rarity-sorting

Ordenação e filtro de itens por raridade e tipo.

**Quando usar:** Inventários grandes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- table.sort com comparador consistente.
- Filtros na UI, dados intactos.
- Ordenação estável por ID como desempate.

**Verificação:** A ordenação não gera o erro de ordem inválida.

**Complementares (sugeridas por similaridade):** `tool-rarity-stats`, `test-acceptance-checklists`, `inv-stacking-rules`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
