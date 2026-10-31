---
name: luau-modulescript-patterns
description: "Padrões de ModuleScript: retorno único, cache do require e estado."
metadata:
  id: SK-02-04
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-modulescript-patterns

Padrões de ModuleScript: retorno único, cache do require e estado.

**Quando usar:** Ao criar módulos compartilhados ou serviços.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- O módulo roda uma vez por ambiente e o resultado do require é compartilhado.
- Cliente e servidor têm cópias separadas do mesmo módulo.
- Não guarde estado por jogador em variável de módulo sem limpar em PlayerRemoving.

**Verificação:** Duas chamadas de require retornam a mesma tabela dentro do mesmo lado.

**Complementares (sugeridas por similaridade):** `ai-boss-patterns`, `arq-design-patterns-luau`, `arq-extensibility-patterns`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
