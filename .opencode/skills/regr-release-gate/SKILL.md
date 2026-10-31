---
name: regr-release-gate
description: "Portão de entrega: smoke, regressão e segurança aprovados antes de publicar."
metadata:
  id: SK-36-12
  department: "Testes de regressão"
  version: "1.0"
  revised: "2026-10-18"
---

# regr-release-gate

Portão de entrega: smoke, regressão e segurança aprovados antes de publicar.

**Quando usar:** Antes de publicar ou entregar.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Smoke, regressão e segurança passaram.
- Pendências listadas.
- Autorização para publicar.

**Verificação:** Portão aprovado com evidência.

**Complementares (sugeridas por similaridade):** `vcs-release-tags`, `studio-publishing`, `regr-gameplay-checklist`

**Limites e recuperação:** Compare sempre com um baseline registrado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
