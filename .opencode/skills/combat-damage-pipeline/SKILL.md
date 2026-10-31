---
name: combat-damage-pipeline
description: "Pipeline único de dano com defesa, crítico e eventos."
metadata:
  id: SK-04-05
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-damage-pipeline

Pipeline único de dano com defesa, crítico e eventos.

**Quando usar:** Quando há várias fontes de dano.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Uma função recebe fonte, alvo, valor e tipo e aplica as regras na mesma ordem.
- Humanoid:TakeDamage respeita ForceField; mudar Health direto ignora.
- Dispare um evento de dano para UI, kill feed e conquistas.

**Verificação:** Todo dano passa pela mesma função; nenhum Humanoid.Health é alterado por fora.

**Complementares (sugeridas por similaridade):** `combat-hit-dedup`, `anim-markers-events`, `arq-event-driven-design`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
