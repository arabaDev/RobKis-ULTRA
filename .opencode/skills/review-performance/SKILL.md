---
name: review-performance
description: "Revisão de desempenho: loops por frame, criação de instâncias e tráfego de rede."
metadata:
  id: SK-32-04
  department: "Revisão independente"
  version: "1.0"
  revised: "2026-10-18"
---

# review-performance

Revisão de desempenho: loops por frame, criação de instâncias e tráfego de rede.

**Quando usar:** Código quente ou sistemas com muitos objetos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Loops por frame.
- Criação de instâncias.
- Tráfego de rede.

**Verificação:** Pontos de custo com evidência.

**Complementares (sugeridas por similaridade):** `luau-table-performance`, `test-performance-smoke`, `ai-performance-throttling`

**Limites e recuperação:** Não aprove o que não verificou; reporte evidência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
