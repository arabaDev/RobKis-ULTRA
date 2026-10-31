---
name: rk-map-budget
description: "Budgets concretos de cena mobile-first. Medir antes de entregar, nunca estimar."
metadata:
  id: SK-45-06
  department: "Protocolo do agente RobKis"
  version: "1.0"
  revised: "2026-10-18"
---

# rk-map-budget

**Quando usar:** Antes de entregar qualquer mapa ou ambiente.

Limites concretos por zona/mapa. **Meça no Developer Stats, não estime.**

## Limites por zona jogável

| Métrica | Limite mobile | Limite PC |
|---|---|---|
| Instances totais (jogo inteiro) | < 20.000 | < 25.000 |
| Parts por zona | < 1.000 | < 1.500 |
| Textures sem atlas | < 30 | < 50 |
| ParticleEmitter ativos | < 10 | < 20 |
| MeshPart por zona | < 60 | < 100 |
| Triângulos visíveis | < 80k | < 150k |
| Scripts ativos (server+client) | < 200 | < 400 |
| Connections abertas por jogador | < 50 | < 80 |

## Como medir

**Instâncias e parts:**
```luau
-- Contar instâncias (rodar no Command Bar do Studio)
local count = #game:GetDescendants()
print("Total instances:", count)
-- Por zona:
local zone = workspace.MinhaZona
print("Zone instances:", #zone:GetDescendants())
```

**Triângulos:** Studio → View → Stats → Render → Triangle Count.

**Memory:** Developer Console (F9 em jogo) → Memory tab.

**Scripts:** Developer Console → Performance tab → Script Activity.

## Estratégias quando ultrapassar

**1. LOD manual (primeiro recurso):**
- Objetos distantes: substituir MeshPart complexo por Part simples com mesmo tamanho.
- Detectar distância com `RunService.Heartbeat` e magnitude do jogador.

**2. Object pooling:**
- Props temporários (explosões, projéteis, loot): criar N instâncias ao iniciar, reutilizar.
- Nunca `Instance.new` em loop quente.

**3. StreamingEnabled:**
- Ativar `Workspace.StreamingEnabled`.
- Configurar `StreamingMinRadius` (300–500 studs para jogo médio).
- Testar com Developer Console → Network → Streaming.

**4. Atlas de texturas:**
- Combinar texturas relacionadas em um único atlas.
- Referenciar por `OffsetStudsU/V` em `SpecialMesh` ou UV no MeshPart.

**5. Simplificação de geometria:**
- Solicitar ao blender-artist: `topo-decimation-safely` + novo export.
- Verificar que a colisão não foi prejudicada.

**Verificação:** Budget medido com comandos acima, resultado em números no relatório final.

**Skills complementares:** `rk-visual-loop`, `perf-instance-count`, `perf-mobile-budgets`, `perf-render-cost`, `perf-object-pooling`, `studio-streaming-enabled`, `topo-decimation-safely`
