---
name: compat-os-paths
description: "Caminhos e sistemas operacionais."
metadata:
  id: SK-37-09
  department: "Compatibilidade de versões"
  version: "1.0"
  revised: "2026-10-18"
---

# compat-os-paths

Caminhos e sistemas operacionais.

**Quando usar:** Scripts em Windows, macOS e Linux.

**Regras**
- Use caminhos absolutos.
- Separadores com os.path ou pathlib.
- Teste no sistema do usuário.

**Verificação:** O script roda no sistema alvo.

**Complementares (sugeridas por similaridade):** `ai-debug-visualization`, `npc-path-following`, `arq-api-contracts`

**Limites e recuperação:** Confirme versões na documentação e no ambiente do usuário. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
