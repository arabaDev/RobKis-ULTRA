---
name: dep-service-order
description: "Ordem de inicialização de serviços."
metadata:
  id: SK-34-03
  department: "Análise de dependências"
  version: "1.0"
  revised: "2026-10-18"
---

# dep-service-order

Ordem de inicialização de serviços.

**Quando usar:** Serviços que dependem de outros.

**Regras**
- Defina a ordem de início.
- Dependências explícitas.
- Falha de um serviço tratada.

**Verificação:** A inicialização é determinística.

**Complementares (sugeridas por similaridade):** `arq-service-layering`, `ai-pathfinding-service`, `net-teleport-service`

**Limites e recuperação:** Confirme com busca real; não presuma dependências. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
