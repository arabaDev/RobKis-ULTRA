---
name: move-slide
description: "Deslizar com velocidade e redução de hitbox."
metadata:
  id: SK-41-12
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-slide

Deslizar com velocidade e redução de hitbox.

**Quando usar:** Jogos de ação.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Estado de slide com duração e cooldown.
- Reduza a altura via animação e cheque o teto.
- A velocidade decai com o tempo.

**Verificação:** O slide termina e o personagem se levanta sem ficar preso.

**Complementares (sugeridas por similaridade):** `sec-anti-speed-fly`, `move-double-jump`, `topo-lod-generation`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
