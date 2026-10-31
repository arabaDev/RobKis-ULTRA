---
name: luau-legacy-migration
description: "Migrar código legado para APIs e práticas atuais."
metadata:
  id: SK-02-17
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-legacy-migration

Migrar código legado para APIs e práticas atuais.

**Quando usar:** Scripts com wait, spawn, BodyMovers ou Velocity.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Liste os usos legados por busca antes de mudar.
- Substitua por equivalentes oficiais em passos pequenos.
- Compare o comportamento antes e depois.

**Verificação:** A busca por APIs legadas retorna vazio e o comportamento é o mesmo.

**Complementares (sugeridas por similaridade):** `data-migration`, `luau-task-library`, `luau-gradual-typing`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
