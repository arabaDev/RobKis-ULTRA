---
name: orch-contradiction-detection
description: "Detectar contradições entre subagentes ou fontes e resolvê-las com evidência."
metadata:
  id: SK-35-08
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-contradiction-detection

Detectar contradições entre subagentes ou fontes e resolvê-las com evidência.

**Quando usar:** Vários agentes ou fontes.

**Regras**
- Compare conclusões e números de cada agente sobre o mesmo ponto.
- Para cada diferença, reproduza a verificação em vez de escolher no palpite.
- Prefira o resultado com evidência, como saída de teste ou linha de código.
- Reporte ao usuário o que ficou sem resolução.

**Verificação:** Cada contradição foi resolvida com evidência ou listada como pendente.

**Complementares (sugeridas por similaridade):** `dep-circular-detection`, `orch-handoff-format`, `test-multiplayer-local-server`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
