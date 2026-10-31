---
name: regr-network-contracts
description: "Compatibilidade de contratos de Remotes."
metadata:
  id: SK-36-08
  department: "Testes de regressão"
  version: "1.0"
  revised: "2026-10-18"
---

# regr-network-contracts

Compatibilidade de contratos de Remotes.

**Quando usar:** Mudança de API entre cliente e servidor.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Compare assinaturas.
- Atualize todos os lados.
- Teste cliente e servidor.

**Verificação:** Nenhum Remote com assinatura desencontrada.

**Complementares (sugeridas por similaridade):** `arq-api-contracts`, `perf-network-cost`, `npc-network-ownership`

**Limites e recuperação:** Compare sempre com um baseline registrado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
