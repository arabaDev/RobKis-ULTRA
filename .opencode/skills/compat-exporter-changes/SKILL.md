---
name: compat-exporter-changes
description: "Detectar mudanças de comportamento dos exportadores do Blender após atualização."
metadata:
  id: SK-37-04
  department: "Compatibilidade de versões"
  version: "1.0"
  revised: "2026-10-18"
---

# compat-exporter-changes

Detectar mudanças de comportamento dos exportadores do Blender após atualização.

**Quando usar:** Exportação diferente após atualização.

**Regras**
- Compare parâmetros.
- Teste com amostra.
- Atualize o script.

**Verificação:** A saída coincide com a anterior.

**Complementares (sugeridas por similaridade):** `compat-roblox-api-changes`, `regr-asset-rechecks`, `topo-triangulation`

**Limites e recuperação:** Confirme versões na documentação e no ambiente do usuário. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
