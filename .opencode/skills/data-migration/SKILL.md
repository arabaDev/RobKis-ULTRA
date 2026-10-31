---
name: data-migration
description: "Migração de dados entre versões do esquema."
metadata:
  id: SK-15-07
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-migration

Migração de dados entre versões do esquema.

**Quando usar:** Mudanças que alteram o formato salvo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Passos pequenos por versão.
- Teste com dados reais ou amostras.
- Backup antes.

**Verificação:** Dados migrados passam por validação.

**Complementares (sugeridas por similaridade):** `luau-legacy-migration`, `regr-data-compat`, `bpy-safe-execution`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
