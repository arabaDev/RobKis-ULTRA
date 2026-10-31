---
name: perf-low-end-testing
description: "Testes em dispositivos de baixo desempenho."
metadata:
  id: SK-16-19
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-low-end-testing

Testes em dispositivos de baixo desempenho.

**Quando usar:** Antes de lançar para mobile.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Use o emulador e, se possível, um aparelho modesto real.
- Reduza a qualidade gráfica no teste.
- Meça FPS e memória.

**Verificação:** FPS e memória ficam dentro do alvo no dispositivo de referência.

**Complementares (sugeridas por similaridade):** `combat-latency-testing`, `ui-usability-testing`, `model-low-poly`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
