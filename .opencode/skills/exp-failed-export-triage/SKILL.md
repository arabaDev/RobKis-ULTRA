---
name: exp-failed-export-triage
description: "Diagnóstico de exportações que falham."
metadata:
  id: SK-27-12
  department: "Exportação de assets"
  version: "1.0"
  revised: "2026-10-18"
---

# exp-failed-export-triage

Diagnóstico de exportações que falham.

**Quando usar:** Erro ou arquivo vazio.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Modo de objeto.
- Seleção válida.
- Permissão de escrita no caminho.

**Verificação:** A causa foi identificada e corrigida.

**Complementares (sugeridas por similaridade):** `mcp-error-triage`, `review-export`, `anim3d-bake-export`

**Limites e recuperação:** Só dê a exportação por concluída com arquivo verificado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
