---
name: flow-ui-feature
description: "Fluxo de uma tela ou HUD: layout, estados, entrada, desempenho e testes."
metadata:
  id: SK-44-08
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-ui-feature

Fluxo de uma tela ou HUD: layout, estados, entrada, desempenho e testes.

**Quando usar:** Nova interface ou refatoração de UI.

**Procedimento**
1. Monte o layout com `ui-scale-layout` e `ui-layout-objects`.
2. Defina estados com `ui-state-management`.
3. Trate entrada com `ui-input-handling` e `ui-gamepad-navigation`.
4. Respeite `ui-safe-areas`.
5. Anime com `ui-tween-animation`.
6. Otimize com `ui-update-optimization`.
7. Acessibilidade com `ui-accessibility-controls`.
8. Teste tamanhos com `test-ui-responsive`.
9. Teste uso com `ui-usability-testing`.

**Regras do fluxo**
- A UI só pede ações; o servidor decide.

**Verificação:** A tela funciona em celular e desktop, com teclado, toque e gamepad.

**Skills complementares:** `ui-scale-layout`, `ui-layout-objects`, `ui-state-management`, `ui-input-handling`, `ui-gamepad-navigation`, `ui-safe-areas`, `ui-tween-animation`, `ui-update-optimization`, `ui-accessibility-controls`, `test-ui-responsive`, `ui-usability-testing`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
