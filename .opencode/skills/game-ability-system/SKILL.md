---
name: game-ability-system
description: "Sistema de habilidades reutilizável."
metadata:
  id: SK-42-10
  department: "Sistemas completos de jogo"
  version: "1.0"
  revised: "2026-10-18"
---

# game-ability-system

Sistema de habilidades reutilizável.

**Quando usar:** Várias habilidades com cooldown e custo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- A habilidade tem id, custo, cooldown e efeito em config.
- A ativação valida estado, recurso e cooldown no servidor.
- Efeitos visuais no cliente.

**Verificação:** Uma habilidade nova entra só por dados e um módulo de efeito.

**Complementares (sugeridas por similaridade):** `ui-ability-indicators`, `game-class-system`, `combat-stun-system`

**Limites e recuperação:** Sistemas completos tocam dados salvos e economia; valide segurança e persistência antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
