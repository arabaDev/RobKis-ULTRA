---
name: pipe-source-vs-destination-diff
description: "Comparar origem (Blender) e destino (Studio)."
metadata:
  id: SK-28-14
  department: "Integração Blender–Roblox"
  version: "1.0"
  revised: "2026-10-18"
---

# pipe-source-vs-destination-diff

Comparar origem (Blender) e destino (Studio).

**Quando usar:** O asset no jogo difere do modelo.

**Requer:** Blender disponível, Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Compare dimensões, orientação, pivô e contagem de triângulos.
- Compare materiais e texturas.
- Registre cada diferença e sua causa.

**Verificação:** Há uma tabela de diferenças com a causa de cada uma.

**Complementares (sugeridas por similaridade):** `regr-diff-impact`, `rk-toolbox-first`, `bpy-scene-setup`

**Limites e recuperação:** Sem importação automática, entregue o passo a passo manual e marque como pendente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
