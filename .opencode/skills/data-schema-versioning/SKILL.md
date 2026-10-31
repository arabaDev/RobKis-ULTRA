---
name: data-schema-versioning
description: "Versão do esquema de dados e valores padrão."
metadata:
  id: SK-15-01
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-schema-versioning

Versão do esquema de dados e valores padrão.

**Quando usar:** Ao criar ou alterar dados salvos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Campo version em todo registro.
- Valores padrão ao carregar campos novos.
- Reconciliação com o modelo atual.

**Verificação:** Dados antigos carregam sem erro.

**Complementares (sugeridas por similaridade):** `regr-data-compat`, `inv-persistence`, `data-migration`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
