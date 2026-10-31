---
name: anim-markers-events
description: "Eventos de animação com GetMarkerReachedSignal."
metadata:
  id: SK-10-03
  department: "Animações Roblox"
  version: "1.0"
  revised: "2026-10-18"
---

# anim-markers-events

Eventos de animação com GetMarkerReachedSignal.

**Quando usar:** Sincronizar dano, som ou efeito com o quadro.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Crie marcadores no editor de animação.
- Conecte com GetMarkerReachedSignal(nome).
- Dano continua decidido no servidor.

**Verificação:** O efeito dispara no quadro do marcador.

**Complementares (sugeridas por similaridade):** `anim3d-markers`, `combat-animation-sync`, `net-gameplay-sync-timing`

**Limites e recuperação:** Animações publicadas dependem do dono do jogo; confirme permissões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
