---
name: ai-group-coordination
description: "Coordenação de grupos: papéis, ataque em turnos e formação."
metadata:
  id: SK-12-08
  department: "Inteligência artificial para jogos"
  version: "1.0"
  revised: "2026-10-18"
---

# ai-group-coordination

Coordenação de grupos: papéis, ataque em turnos e formação.

**Quando usar:** Inimigos em bando.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Um coordenador decide quem ataca.
- Limite de atacantes simultâneos.
- Papéis em config.

**Verificação:** Não mais que o limite ataca ao mesmo tempo.

**Complementares (sugeridas por similaridade):** `game-matchmaking-queue`, `game-class-system`, `ai-steering-avoidance`

**Limites e recuperação:** Meça o custo de CPU da IA antes de aumentar a complexidade. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
