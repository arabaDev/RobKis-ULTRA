---
name: ui-hud-design
description: "HUD legível: vida, munição, objetivos."
metadata:
  id: SK-09-08
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-hud-design

HUD legível: vida, munição, objetivos.

**Quando usar:** Interface de jogo em tempo real.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Informação essencial no campo de visão, sem poluir.
- Atualize por evento, não por loop.
- Cores com contraste suficiente.

**Verificação:** O HUD permanece legível sobre fundos claros e escuros.

**Complementares (sugeridas por similaridade):** `eco-currency-design`, `arq-component-based-design`, `arq-config-driven-design`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
