---
name: vcs-gitignore-assets
description: ".gitignore e arquivos grandes."
metadata:
  id: SK-31-10
  department: "Controle de versão e recuperação"
  version: "1.0"
  revised: "2026-10-18"
---

# vcs-gitignore-assets

.gitignore e arquivos grandes.

**Quando usar:** Repositório com assets pesados.

**Requer:** repositório git. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Ignore temporários e builds.
- Decida o que versionar entre fonte e exportado.
- Considere armazenamento de arquivos grandes.

**Verificação:** O repositório não cresce com lixo.

**Complementares (sugeridas por similaridade):** `review-3d-assets`, `doc-asset-manifest`, `pipe-bulk-import`

**Limites e recuperação:** Operações destrutivas exigem autorização; faça backup antes. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
