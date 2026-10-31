---
name: review-integration
description: "Revisão de integração entre sistemas."
metadata:
  id: SK-32-05
  department: "Revisão independente"
  version: "1.0"
  revised: "2026-10-18"
---

# review-integration

Revisão de integração entre sistemas.

**Quando usar:** Vários sistemas alterados.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Contratos entre módulos.
- Eventos conectados.
- Ordem de inicialização.

**Verificação:** Os sistemas funcionam juntos em teste.

**Complementares (sugeridas por similaridade):** `test-integration-studio`, `review-performance`, `review-regressions`

**Limites e recuperação:** Não aprove o que não verificou; reporte evidência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
