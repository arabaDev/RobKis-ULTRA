---
name: mat-ambient-occlusion
description: "Oclusão ambiente (AO) em texturas."
metadata:
  id: SK-23-15
  department: "Materiais e texturas"
  version: "1.0"
  revised: "2026-10-18"
---

# mat-ambient-occlusion

Oclusão ambiente (AO) em texturas.

**Quando usar:** Dar profundidade a frestas.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Faça o bake de AO em Cycles.
- Combine com a cor ou use mapa próprio se o destino suportar.
- Não duplique a sombra que a luz já dá.

**Verificação:** As frestas escurecem sem manchas.

**Complementares (sugeridas por similaridade):** `fx-ambient-loops`, `tool-backpack-handling`, `light-horror-mood`

**Limites e recuperação:** Confirme os limites de textura atuais do Roblox. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
