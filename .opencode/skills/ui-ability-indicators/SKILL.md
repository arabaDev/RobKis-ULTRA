---
name: ui-ability-indicators
description: "Indicadores de habilidade e de cooldown."
metadata:
  id: SK-09-16
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-ability-indicators

Indicadores de habilidade e de cooldown.

**Quando usar:** Botões de habilidade com tempo de recarga.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- O servidor define o instante de fim do cooldown.
- O cliente anima o preenchimento com esse instante.
- Pronto, recarregando e sem recurso têm aparências distintas.

**Verificação:** O indicador termina junto com o cooldown real.

**Complementares (sugeridas por similaridade):** `game-ability-system`, `combat-cooldowns`, `tool-ammo-reload`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
