---
name: dep-asset-ids-tracking
description: "Rastreio de IDs de assets."
metadata:
  id: SK-34-06
  department: "Análise de dependências"
  version: "1.0"
  revised: "2026-10-18"
---

# dep-asset-ids-tracking

Rastreio de IDs de assets.

**Quando usar:** Assets referenciados por ID.

**Regras**
- Módulo único de IDs.
- Nome, tipo e dono.
- Remova IDs mortos.

**Verificação:** Todo ID usado está registrado.

**Complementares (sugeridas por similaridade):** `doc-asset-manifest`, `perf-fps-regression-tracking`, `regr-asset-rechecks`

**Limites e recuperação:** Confirme com busca real; não presuma dependências. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
