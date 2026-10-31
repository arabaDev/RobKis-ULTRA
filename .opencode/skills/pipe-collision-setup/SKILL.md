---
name: pipe-collision-setup
description: "Colisão do asset importado."
metadata:
  id: SK-28-04
  department: "Integração Blender–Roblox"
  version: "1.0"
  revised: "2026-10-18"
---

# pipe-collision-setup

Colisão do asset importado.

**Quando usar:** Objetos que o jogador toca.

**Requer:** Blender disponível, Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Colisão simples sempre que possível.
- Malha de colisão separada.
- Teste caminhando.

**Verificação:** O personagem colide como esperado.

**Complementares (sugeridas por similaridade):** `phys-collision-groups`, `phys-collision-fidelity`, `topo-collision-hulls`

**Limites e recuperação:** Sem importação automática, entregue o passo a passo manual e marque como pendente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
