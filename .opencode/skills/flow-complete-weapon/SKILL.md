---
name: flow-complete-weapon
description: "Fluxo completo de arma: requisitos, modelo, importação, scripts, testes e relatório."
metadata:
  id: SK-44-01
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-complete-weapon

Fluxo completo de arma: requisitos, modelo, importação, scripts, testes e relatório.

**Quando usar:** Pedido de arma nova com modelo 3D e comportamento.

**Procedimento**
1. Traduza os requisitos em config com `tool-rarity-stats` e `arq-config-driven-design`.
2. Defina a fronteira cliente e servidor com `arq-client-server-boundary`.
3. Modele com `model-hard-surface` dentro do orçamento de `topo-poly-budgets`.
4. Valide a geometria com `topo-mesh-validation`.
5. Prepare material e UV com `mat-pbr-texture-set` e `uv-export-validation`.
6. Exporte com `exp-fbx-settings` e confira com `exp-validate-file`.
7. Importe com `pipe-import-3d-importer` e confira a escala com `pipe-scale-verification`.
8. Monte a Tool com `tool-structure` e `tool-grip-positioning`.
9. Implemente o ataque no servidor com `combat-hitbox-raycast`, `combat-cooldowns` e `combat-damage-pipeline`.
10. Ligue animações e efeitos com `tool-animation-binding` e `fx-hit-feedback`.
11. Proteja os Remotes com `sec-remote-input-validation` e `sec-rate-limit-implementation`.
12. Teste multiplayer com `test-multiplayer-local-server` e latência com `combat-latency-testing`.
13. Meça desempenho com `perf-script-profiling`.
14. Rode regressão com `regr-smoke-suite`.
15. Feche com `review-final-result`.

**Regras do fluxo**
- Não avance para scripts antes de o asset ser visto no Studio, ou marque a etapa como importação manual pendente.
- Dano nunca é decidido no cliente.

**Verificação:** Cada etapa tem estado real e o relatório final lista o que não foi testado.

**Skills complementares:** `tool-rarity-stats`, `arq-config-driven-design`, `arq-client-server-boundary`, `model-hard-surface`, `topo-poly-budgets`, `topo-mesh-validation`, `mat-pbr-texture-set`, `uv-export-validation`, `exp-fbx-settings`, `exp-validate-file`, `pipe-import-3d-importer`, `pipe-scale-verification`, `tool-structure`, `tool-grip-positioning`, `combat-hitbox-raycast`, `combat-cooldowns`, `combat-damage-pipeline`, `tool-animation-binding`, `fx-hit-feedback`, `sec-remote-input-validation`, `sec-rate-limit-implementation`, `test-multiplayer-local-server`, `combat-latency-testing`, `perf-script-profiling`, `regr-smoke-suite`, `review-final-result`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
