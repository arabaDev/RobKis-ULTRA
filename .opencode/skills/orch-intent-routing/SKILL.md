---
name: orch-intent-routing
description: "Roteamento de pedidos por intenção."
metadata:
  id: SK-35-13
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-intent-routing

Roteamento de pedidos por intenção.

**Quando usar:** Início de uma tarefa.

**Regras**
- Extraia verbo, objeto e domínio do pedido.
- Procure skills por palavras-chave.
- Escolha um fluxo composto se o pedido cobre várias etapas.

**Verificação:** A intenção mapeia para poucas skills ou para um fluxo.

**Complementares (sugeridas por similaridade):** `rk-visual-direction`, `test-acceptance-checklists`, `orch-report-compaction`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
