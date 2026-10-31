---
name: regr-asset-rechecks
description: "Recheque de assets após mudanças."
metadata:
  id: SK-36-09
  department: "Testes de regressão"
  version: "1.0"
  revised: "2026-10-18"
---

# regr-asset-rechecks

Recheque de assets após mudanças.

**Quando usar:** Alterações em exportação ou importação.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Reexporte uma amostra.
- Compare escala e contagens.
- Reimporte.

**Verificação:** Os assets mantêm medidas.

**Complementares (sugeridas por similaridade):** `studio-asset-manager`, `rk-asset-security-scan`, `dep-asset-ids-tracking`

**Limites e recuperação:** Compare sempre com um baseline registrado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
