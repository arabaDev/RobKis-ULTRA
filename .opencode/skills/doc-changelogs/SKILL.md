---
name: doc-changelogs
description: "Changelog por versão: o que mudou, por quê e o que ficou quebrado."
metadata:
  id: SK-33-04
  department: "Documentação técnica"
  version: "1.0"
  revised: "2026-10-18"
---

# doc-changelogs

Changelog por versão: o que mudou, por quê e o que ficou quebrado.

**Quando usar:** Versões e entregas.

**Regras**
- Resumo por versão.
- O que mudou e por quê.
- Itens quebrados.

**Verificação:** O changelog reflete o histórico real.

**Complementares (sugeridas por similaridade):** `compat-blender-versions`, `orch-obsolete-task-cancellation`, `bpy-version-compat`

**Limites e recuperação:** Documente só o que é verdade no código atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
