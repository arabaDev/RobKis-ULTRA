---
name: flow-3d-environment
description: "Fluxo de ambiente 3D: modelagem, UV, texturas, exportação, importação e custo."
metadata:
  id: SK-44-11
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-3d-environment

Fluxo de ambiente 3D: modelagem, UV, texturas, exportação, importação e custo.

**Quando usar:** Props e cenários feitos no Blender para o Roblox.

**Procedimento**
1. Modele com `model-low-poly`.
2. Respeite `topo-poly-budgets`.
3. Limpe origem com `topo-scale-origin`.
4. Padronize `uv-texel-density`.
5. Defina resolução com `mat-texture-resolution`.
6. Use `mat-atlases`.
7. Fixe `exp-scale-units`.
8. Valide com `exp-validate-file`.
9. Importe com `pipe-import-3d-importer`.
10. Configure `pipe-meshpart-setup`.
11. Compare com `pipe-source-vs-destination-diff`.
12. Ajuste luz com `light-technology-modes`.
13. Meça com `perf-render-cost`.

**Regras do fluxo**
- Compare sempre o asset em jogo com o modelo de origem.

**Verificação:** Dimensões, orientação e aparência em jogo conferem com a origem.

**Skills complementares:** `model-low-poly`, `topo-poly-budgets`, `topo-scale-origin`, `uv-texel-density`, `mat-texture-resolution`, `mat-atlases`, `exp-scale-units`, `exp-validate-file`, `pipe-import-3d-importer`, `pipe-meshpart-setup`, `pipe-source-vs-destination-diff`, `light-technology-modes`, `perf-render-cost`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
