---
name: data-studio-api-access
description: "Acesso do Studio às APIs para testar DataStore."
metadata:
  id: SK-15-10
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-studio-api-access

Acesso do Studio às APIs para testar DataStore.

**Quando usar:** DataStore falha no Studio.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Habilite Studio Access to API Services nas configurações do jogo.
- Use um DataStore de teste separado.
- Não escreva dados de teste em produção.

**Verificação:** O DataStore funciona no Studio sem tocar em dados reais.

**Complementares (sugeridas por similaridade):** `compat-studio-vs-live`, `mcp-roblox-studio-usage`, `arq-api-contracts`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
