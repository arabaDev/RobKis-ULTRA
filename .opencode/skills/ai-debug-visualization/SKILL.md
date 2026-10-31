---
name: ai-debug-visualization
description: "Visualizar caminhos, alcance e estado de IA."
metadata:
  id: SK-12-11
  department: "Inteligência artificial para jogos"
  version: "1.0"
  revised: "2026-10-18"
---

# ai-debug-visualization

Visualizar caminhos, alcance e estado de IA.

**Quando usar:** Depurar comportamento de NPC.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Partes ou Beams temporários só no modo de depuração.
- Flag de config para ligar e desligar.
- Remova antes de publicar.

**Verificação:** O modo de depuração desligado não deixa nada no jogo.

**Complementares (sugeridas por similaridade):** `perf-script-profiling`, `ui-viewport-frames`, `combat-hitscan-weapons`

**Limites e recuperação:** Meça o custo de CPU da IA antes de aumentar a complexidade. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
