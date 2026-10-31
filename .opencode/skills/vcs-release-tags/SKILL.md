---
name: vcs-release-tags
description: "Tags e versões de entrega."
metadata:
  id: SK-31-11
  department: "Controle de versão e recuperação"
  version: "1.0"
  revised: "2026-10-18"
---

# vcs-release-tags

Tags e versões de entrega.

**Quando usar:** Marcar versões estáveis.

**Requer:** repositório git. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Tag por versão.
- Notas curtas.
- Tag só após validação.

**Verificação:** A versão marcada abre e funciona.

**Complementares (sugeridas por similaridade):** `regr-release-gate`, `luau-attributes-tags`, `regr-bisect`

**Limites e recuperação:** Operações destrutivas exigem autorização; faça backup antes. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
