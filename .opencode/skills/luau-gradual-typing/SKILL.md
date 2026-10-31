---
name: luau-gradual-typing
description: "Adoção gradual de tipos com nocheck, nonstrict e strict."
metadata:
  id: SK-02-14
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-gradual-typing

Adoção gradual de tipos com nocheck, nonstrict e strict.

**Quando usar:** Código legado sem tipos ou módulos grandes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- --!nocheck, --!nonstrict e --!strict controlam o rigor por arquivo.
- Comece pelas APIs públicas e módulos de dados e avance para dentro.
- Corrija os erros do analisador em vez de espalhar any.

**Verificação:** O arquivo migrado passa na análise estática no modo escolhido.

**Complementares (sugeridas por similaridade):** `luau-legacy-migration`, `luau-table-performance`, `luau-strict-types`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
