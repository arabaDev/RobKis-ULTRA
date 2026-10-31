---
name: arq-extensibility-patterns
description: "Padrões para adicionar armas, habilidades e itens sem reescrever sistemas."
metadata:
  id: SK-01-08
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-extensibility-patterns

Padrões para adicionar armas, habilidades e itens sem reescrever sistemas.

**Quando usar:** Quando o jogo precisa de muitas variações do mesmo comportamento.

**Regras**
- Registro (tabela id para definição) em vez de cadeias de if.
- Interface comum para cada variação, por exemplo Activate e Cleanup.
- Dados em config e comportamento em módulos plugáveis.

**Verificação:** Adicionar um item novo toca no máximo um arquivo de dados e um módulo.

**Complementares (sugeridas por similaridade):** `arq-design-patterns-luau`, `ai-boss-patterns`, `luau-modulescript-patterns`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
