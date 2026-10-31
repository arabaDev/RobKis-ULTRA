---
name: studio-terrain-workflow
description: "Terreno por editor e por script (FillBlock, FillBall, Clear)."
metadata:
  id: SK-03-06
  department: "Roblox Studio"
  version: "1.0"
  revised: "2026-10-18"
---

# studio-terrain-workflow

Terreno por editor e por script (FillBlock, FillBall, Clear).

**Quando usar:** Ao criar mapas ou terreno gerado.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Terrain:FillBlock e FillBall preenchem regiões com material.
- Terreno é pesado; use regiões e tamanhos moderados.
- Terreno gerado em runtime deve rodar no servidor.

**Verificação:** Terreno gerado não congela o servidor na inicialização.

**Complementares (sugeridas por similaridade):** `proc-terrain-heightmaps`, `studio-script-workflow`, `pipe-texture-upload-workflow`

**Limites e recuperação:** Ações no Studio exigem o Studio aberto; sem MCP, entregue passos manuais exatos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
