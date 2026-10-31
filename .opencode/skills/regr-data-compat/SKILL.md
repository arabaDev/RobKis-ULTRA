---
name: regr-data-compat
description: "Garantir que dados salvos em versões antigas ainda carregam após mudar o esquema."
metadata:
  id: SK-36-07
  department: "Testes de regressão"
  version: "1.0"
  revised: "2026-10-18"
---

# regr-data-compat

Garantir que dados salvos em versões antigas ainda carregam após mudar o esquema.

**Quando usar:** Mudança de esquema.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Mantenha amostras de dados de cada versão do esquema.
- Carregue cada amostra na versão nova e compare os campos.
- Campos novos recebem valores padrão e campos removidos não quebram.
- Nunca teste em dados reais de jogadores.

**Verificação:** Todas as amostras antigas carregam sem erro e sem perda de campos importantes.

**Complementares (sugeridas por similaridade):** `bpy-version-compat`, `inv-data-model`, `bpy-data-vs-ops`

**Limites e recuperação:** Compare sempre com um baseline registrado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
