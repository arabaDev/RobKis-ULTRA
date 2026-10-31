---
name: studio-undo-waypoints
description: "Desfazer e refazer em scripts de edição e plugins."
metadata:
  id: SK-03-12
  department: "Roblox Studio"
  version: "1.0"
  revised: "2026-10-18"
---

# studio-undo-waypoints

Desfazer e refazer em scripts de edição e plugins.

**Quando usar:** Quando um script altera o lugar em modo de edição.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Agrupe alterações em um waypoint para um único desfazer.
- Não faça mudanças destrutivas sem waypoint.
- Em runtime não existe desfazer; trate o estado.

**Verificação:** Uma alteração em lote é desfeita com um comando.

**Complementares (sugeridas por similaridade):** `studio-plugin-development`, `studio-script-workflow`, `bpy-material-editing`

**Limites e recuperação:** Ações no Studio exigem o Studio aberto; sem MCP, entregue passos manuais exatos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
