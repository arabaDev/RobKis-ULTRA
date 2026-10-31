---
name: orch-latency-measurement
description: "Medição de latência por etapa e por ferramenta."
metadata:
  id: SK-35-16
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-latency-measurement

Medição de latência por etapa e por ferramenta.

**Quando usar:** Encontrar gargalos.

**Regras**
- Anote o tempo de cada etapa.
- Separe ferramenta e raciocínio.
- Compare com o baseline.

**Verificação:** Há uma tabela de tempos por etapa.

**Complementares (sugeridas por similaridade):** `combat-latency-testing`, `mcp-latency-logging`, `net-latency-jitter`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
