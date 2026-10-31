---
name: arq-design-patterns-luau
description: "Padrões de projeto úteis em Luau: observer, state, factory e command."
metadata:
  id: SK-01-15
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-design-patterns-luau

Padrões de projeto úteis em Luau: observer, state, factory e command.

**Quando usar:** Quando um problema recorrente tem forma conhecida.

**Regras**
- Observer com sinais desacopla sistemas.
- State para comportamento que muda por modo.
- Command para ações que podem ser repetidas ou desfeitas.

**Verificação:** O padrão reduz código e não adiciona camadas sem uso.

**Complementares (sugeridas por similaridade):** `arq-extensibility-patterns`, `ai-boss-patterns`, `luau-modulescript-patterns`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
