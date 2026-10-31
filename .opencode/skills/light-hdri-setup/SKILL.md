---
name: light-hdri-setup
description: "Iluminação por HDRI no Blender."
metadata:
  id: SK-30-13
  department: "Iluminação e renderização"
  version: "1.0"
  revised: "2026-10-18"
---

# light-hdri-setup

Iluminação por HDRI no Blender.

**Quando usar:** Renders de inspeção com luz realista.

**Requer:** Blender disponível, Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Nó Environment Texture no mundo.
- Intensidade ajustada para não estourar.
- O mesmo HDRI entre assets permite comparação justa.

**Verificação:** Os assets são comparáveis sob a mesma luz.

**Complementares (sugeridas por similaridade):** `light-camera-setup`, `bpy-scene-setup`, `mcp-setup-troubleshooting`

**Limites e recuperação:** Confirme identificadores de motor de render na versão do Blender em uso. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
