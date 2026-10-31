---
name: tool-equip-lifecycle
description: "Eventos Equipped, Unequipped, Activated e Deactivated."
metadata:
  id: SK-05-02
  department: "Ferramentas e armas"
  version: "1.0"
  revised: "2026-10-18"
---

# tool-equip-lifecycle

Eventos Equipped, Unequipped, Activated e Deactivated.

**Quando usar:** Ao ligar lógica a uma Tool.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Conecte no Equipped e desconecte no Unequipped.
- Activated respeita Tool.Enabled e ManualActivationOnly.
- Limpe animações e efeitos ao desequipar.

**Verificação:** Equipar e desequipar várias vezes não duplica efeitos.

**Complementares (sugeridas por similaridade):** `inv-equip-system`, `net-player-lifecycle`, `tool-server-validation`

**Limites e recuperação:** Confirme se o jogo usa R6, R15 ou rigs próprios antes de ajustar empunhadura. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
