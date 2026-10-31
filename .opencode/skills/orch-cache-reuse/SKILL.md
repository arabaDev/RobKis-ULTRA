---
name: orch-cache-reuse
description: "Reaproveitamento seguro de resultados já verificados."
metadata:
  id: SK-35-14
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-cache-reuse

Reaproveitamento seguro de resultados já verificados.

**Quando usar:** Repetição de leituras ou análises.

**Regras**
- Reaproveite só o que não mudou.
- Registre quando foi verificado.
- Invalide ao mudar o estado relacionado.

**Verificação:** Nenhum resultado vencido foi reutilizado.

**Complementares (sugeridas por similaridade):** `mcp-cache-invalidation`, `mat-naming-reuse`, `luau-modulescript-patterns`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
