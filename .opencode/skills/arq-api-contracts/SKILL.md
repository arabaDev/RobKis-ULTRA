---
name: arq-api-contracts
description: "Contratos claros e tipados para Remotes e APIs de módulos."
metadata:
  id: SK-01-09
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-api-contracts

Contratos claros e tipados para Remotes e APIs de módulos.

**Quando usar:** Ao expor funções ou eventos entre sistemas ou entre lados.

**Regras**
- Cada API declara tipos de entrada e saída com export type.
- Remotes nomeados com verbo e objeto, como RequestEquipItem.
- Mudança de contrato atualiza todos os chamadores na mesma alteração.

**Verificação:** A análise estática não aponta chamadas com tipos incompatíveis.

**Complementares (sugeridas por similaridade):** `regr-network-contracts`, `doc-api-reference`, `data-studio-api-access`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
