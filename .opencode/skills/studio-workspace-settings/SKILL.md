---
name: studio-workspace-settings
description: "Configurações globais de Workspace: gravidade, altura de queda e filtragem."
metadata:
  id: SK-03-13
  department: "Roblox Studio"
  version: "1.0"
  revised: "2026-10-18"
---

# studio-workspace-settings

Configurações globais de Workspace: gravidade, altura de queda e filtragem.

**Quando usar:** Ao ajustar a física global ou o mapa.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Workspace.Gravity e FallenPartsDestroyHeight definem física e limite de queda.
- A replicação sempre é filtrada; mudanças do cliente não chegam ao servidor.
- Mudar configuração global afeta todo o jogo; teste depois.

**Verificação:** Cair do mapa remove o objeto como esperado.

**Complementares (sugeridas por similaridade):** `exp-fbx-settings`, `exp-gltf-settings`, `exp-obj-settings`

**Limites e recuperação:** Ações no Studio exigem o Studio aberto; sem MCP, entregue passos manuais exatos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
