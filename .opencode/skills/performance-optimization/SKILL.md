---
name: performance-optimization
description: "Diagnóstico e otimização de desempenho em Roblox (CPU, memória, renderização, física, rede) para PC e mobile. Use quando houver lag, FPS baixo ou custo alto."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: 1.0
  revised: 2026-10-18
---
# Performance Optimization

**Meça primeiro**: MicroProfiler, Developer Console (Ctrl+Shift+F9 / aba Memory, Network, Scripts), contagem de instâncias e triângulos. Registre antes → depois.

## Alavancas comuns

- **Física:** `Anchored = true` no que não se move; `CanCollide/CanQuery/CanTouch = false` no decorativo; `CollisionFidelity` simples; poucos constraints.
- **Renderização:** reduzir triângulos/partes visíveis, `StreamingEnabled` em mundos grandes, texturas moderadas, `RenderFidelity`/LOD em MeshParts, limitar luzes e partículas.
- **Scripts:** trocar polling por eventos; um loop compartilhado em vez de um por objeto; evitar criar/destruir em massa (object pooling); sem `GetDescendants()` por frame.
- **Rede:** menos disparos de Remote (agrupar), enviar deltas, não replicar o que só o servidor usa.
- **Memória:** limpar conexões e tabelas por jogador; `Destroy` de objetos descartados.

Mobile: orçamento muito menor — teste num dispositivo/emulador real. Não troque correção por FPS.

**Verificação:** Há medição antes e depois, nas mesmas condições.
