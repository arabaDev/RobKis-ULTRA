---
name: bug-ui-not-showing
description: "UI que não aparece."
metadata:
  id: SK-17-10
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-ui-not-showing

UI que não aparece.

**Quando usar:** Elemento criado e invisível.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Verifique Parent no PlayerGui, Visible, Enabled e ZIndex.
- Confira tamanho zero e AnchorPoint.
- ResetOnSpawn pode recriar a UI.

**Verificação:** O elemento aparece em teste.

**Complementares (sugeridas por similaridade):** `mcp-setup-troubleshooting`, `compat-luau-versions`, `doc-test-reports`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
