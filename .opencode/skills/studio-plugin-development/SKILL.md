---
name: studio-plugin-development
description: "Criação de plugins do Studio (toolbar, Selection, waypoints)."
metadata:
  id: SK-03-05
  department: "Roblox Studio"
  version: "1.0"
  revised: "2026-10-18"
---

# studio-plugin-development

Criação de plugins do Studio (toolbar, Selection, waypoints).

**Quando usar:** Quando uma tarefa repetitiva no Studio merece uma ferramenta.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- plugin:CreateToolbar e CreateButton; use o serviço Selection para o alvo.
- Registre desfazer com ChangeHistoryService (waypoints ou gravação).
- Plugin roda só no Studio; não dependa dele no jogo publicado.

**Verificação:** A ação do plugin pode ser desfeita com Ctrl+Z.

**Complementares (sugeridas por similaridade):** `dep-plugin-dependencies`, `studio-undo-waypoints`, `mcp-roblox-studio-usage`

**Limites e recuperação:** Ações no Studio exigem o Studio aberto; sem MCP, entregue passos manuais exatos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
