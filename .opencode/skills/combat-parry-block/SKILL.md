---
name: combat-parry-block
description: "Bloqueio e parry com janelas de tempo no servidor."
metadata:
  id: SK-04-16
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-parry-block

Bloqueio e parry com janelas de tempo no servidor.

**Quando usar:** Combate corpo a corpo com defesa.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Estado de bloqueio com início, fim e custo guardado no servidor.
- Parry é uma janela curta no início do bloqueio.
- Dano reduzido ou anulado pelo pipeline único de dano.

**Verificação:** Golpe dentro da janela é aparado e fora dela só é reduzido.

**Complementares (sugeridas por similaridade):** `combat-hitbox-overlap`, `combat-melee-combos`, `move-sprint-stamina`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
