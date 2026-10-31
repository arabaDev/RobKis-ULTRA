---
name: compat-studio-vs-live
description: "Diferenças entre Studio e jogo publicado."
metadata:
  id: SK-37-07
  department: "Compatibilidade de versões"
  version: "1.0"
  revised: "2026-10-18"
---

# compat-studio-vs-live

Diferenças entre Studio e jogo publicado.

**Quando usar:** Funciona no Studio e falha em produção.

**Regras**
- Acesso a APIs.
- Permissões e propriedade.
- Latência real.

**Verificação:** O comportamento foi observado fora do Studio.

**Complementares (sugeridas por similaridade):** `data-studio-api-access`, `mcp-roblox-studio-usage`, `anim3d-validation-in-studio`

**Limites e recuperação:** Confirme versões na documentação e no ambiente do usuário. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
