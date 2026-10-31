---
name: doc-api-reference
description: "Referência de APIs internas com assinatura, parâmetros, retorno, erros e exemplo."
metadata:
  id: SK-33-03
  department: "Documentação técnica"
  version: "1.0"
  revised: "2026-10-18"
---

# doc-api-reference

Referência de APIs internas com assinatura, parâmetros, retorno, erros e exemplo.

**Quando usar:** Módulos usados por muitos sistemas.

**Regras**
- Para cada função pública: assinatura, parâmetros e retorno.
- Liste erros e condições de falha.
- Inclua um exemplo curto que funcione.
- Revise junto com o código para não divergir.

**Verificação:** Cada exemplo da referência roda e bate com o código atual.

**Complementares (sugeridas por similaridade):** `arq-api-contracts`, `compat-roblox-api-changes`, `data-studio-api-access`

**Limites e recuperação:** Documente só o que é verdade no código atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
