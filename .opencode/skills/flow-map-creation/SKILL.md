---
name: flow-map-creation
description: "Fluxo de criação de mapa: layout, assets, iluminação, navegação e desempenho."
metadata:
  id: SK-44-02
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-map-creation

Fluxo de criação de mapa: layout, assets, iluminação, navegação e desempenho.

**Quando usar:** Pedido de mapa ou cenário novo.

**Procedimento**
1. Planeje o layout e o ciclo de partida com `arq-game-loop-design`.
2. Fixe a escala usando o personagem de referência com `pipe-scale-verification`.
3. Modele peças com `proc-modular-building-kits` e `model-low-poly`.
4. Crie materiais com `mat-roblox-materials-mapping` e `mat-atlases`.
5. Prepare colisões com `topo-collision-hulls` e `pipe-collision-setup`.
6. Exporte com `exp-selection-export` e importe com `pipe-bulk-import`.
7. Configure o streaming com `studio-streaming-enabled`.
8. Ajuste a luz com `light-technology-modes` e `light-atmosphere-sky`.
9. Valide a navegação de NPCs com `ai-pathfinding-service`.
10. Teste o streaming com `net-streaming-replication`.
11. Meça com `perf-instance-count` e `perf-mobile-budgets`.
12. Corrija e repita `regr-smoke-suite`.

**Regras do fluxo**
- Escala e colisão são validadas antes de decorar.
- Meça no celular, não só no computador.

**Verificação:** O mapa abre sem erro de nil com streaming ligado e dentro do orçamento medido.

**Skills complementares:** `arq-game-loop-design`, `pipe-scale-verification`, `proc-modular-building-kits`, `model-low-poly`, `mat-roblox-materials-mapping`, `mat-atlases`, `topo-collision-hulls`, `pipe-collision-setup`, `exp-selection-export`, `pipe-bulk-import`, `studio-streaming-enabled`, `light-technology-modes`, `light-atmosphere-sky`, `ai-pathfinding-service`, `net-streaming-replication`, `perf-instance-count`, `perf-mobile-budgets`, `regr-smoke-suite`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
