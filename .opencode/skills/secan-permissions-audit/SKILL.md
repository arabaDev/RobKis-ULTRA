---
name: secan-permissions-audit
description: "Auditar quem pode editar, publicar e acessar dados do jogo."
metadata:
  id: SK-39-07
  department: "Análise de segurança"
  version: "1.0"
  revised: "2026-10-18"
---

# secan-permissions-audit

Auditar quem pode editar, publicar e acessar dados do jogo.

**Quando usar:** Projeto com colaboradores.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Liste colaboradores e o nível de acesso de cada um.
- Aplique o mínimo necessário por pessoa.
- Confira quem pode publicar e quem acessa chaves ou dados.
- Remova acessos de quem saiu.

**Verificação:** A lista de acessos bate com a equipe atual e segue o mínimo necessário.

**Complementares (sugeridas por similaridade):** `anim-ownership-permissions`, `mcp-permissions-safety`, `mcp-operation-audit-log`

**Limites e recuperação:** Auditoria só no seu próprio jogo; reporte o que não foi revisado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
