---
name: luau-metatables-oop
description: "Classes simples com setmetatable e __index, tipadas."
metadata:
  id: SK-02-05
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-metatables-oop

Classes simples com setmetatable e __index, tipadas.

**Quando usar:** Quando precisa de objetos com estado e métodos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Tabela de classe com __index apontando para ela e função new.
- Prefira composição a herança profunda.
- Métodos de instância chamados com dois pontos; funções estáticas com ponto.

**Verificação:** Instâncias criadas por new não compartilham estado mutável por engano.

**Complementares (sugeridas por similaridade):** `net-attributes-replication`, `arq-extensibility-patterns`, `arq-refactor-safely`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
