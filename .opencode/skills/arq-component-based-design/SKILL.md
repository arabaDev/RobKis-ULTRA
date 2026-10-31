---
name: arq-component-based-design
description: "Arquitetura por componentes com tags do CollectionService."
metadata:
  id: SK-01-14
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-component-based-design

Arquitetura por componentes com tags do CollectionService.

**Quando usar:** Muitos objetos com comportamentos combináveis (portas, inimigos, coletáveis).

**Regras**
- A tag define o componente e um módulo implementa o comportamento.
- GetInstanceAddedSignal inicia e GetInstanceRemovedSignal limpa.
- Dados do componente ficam em atributos.

**Verificação:** Adicionar a tag a um objeto novo ativa o comportamento sem editar scripts.

**Complementares (sugeridas por similaridade):** `luau-attributes-tags`, `arq-game-loop-design`, `eco-currency-design`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
