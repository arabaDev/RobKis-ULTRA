---
name: topo-hard-surface-bevels
description: "Chanfros em hard surface com poucos segmentos e normais ponderadas."
metadata:
  id: SK-22-07
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-hard-surface-bevels

Chanfros em hard surface com poucos segmentos e normais ponderadas.

**Quando usar:** Armas e veículos.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Aplique Bevel só nas bordas que pegam luz ou definem a forma.
- Largura pequena e 1 a 2 segmentos para economizar triângulos.
- Use normais ponderadas para sombreamento limpo.
- Aplique o modificador antes de exportar.

**Verificação:** As bordas pegam luz sem estourar o orçamento de triângulos.

**Complementares (sugeridas por similaridade):** `model-hard-surface`, `topo-boolean-operations`, `proc-symmetry-mirroring`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
