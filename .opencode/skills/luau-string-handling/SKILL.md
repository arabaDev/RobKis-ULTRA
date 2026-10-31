---
name: luau-string-handling
description: "Manipulação de strings: format, split, padrões e utf8."
metadata:
  id: SK-02-07
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-string-handling

Manipulação de strings: format, split, padrões e utf8.

**Quando usar:** Ao montar textos, validar nomes ou processar comandos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Concatene muitos pedaços com table.concat, não com .. em loop.
- Padrões do Luau não são regex completo; teste os casos de borda.
- Para texto com acentos use a biblioteca utf8 ao contar caracteres.

**Verificação:** Casos com acento, string vazia e entrada longa testados.

**Complementares (sugeridas por similaridade):** `ui-text-handling`, `mcp-untrusted-content-handling`, `bpy-error-handling-verify`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
