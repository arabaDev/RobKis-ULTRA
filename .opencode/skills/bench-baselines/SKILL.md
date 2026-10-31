---
name: bench-baselines
description: "Registrar a linha de base de desempenho e qualidade antes de otimizar."
metadata:
  id: SK-40-09
  department: "Benchmark e qualidade"
  version: "1.0"
  revised: "2026-10-18"
---

# bench-baselines

Registrar a linha de base de desempenho e qualidade antes de otimizar.

**Quando usar:** Antes de otimizar.

**Regras**
- Meça a versão atual nas tarefas fixas antes de mudar algo.
- Registre tempo, taxa de sucesso, erros e ambiente.
- Guarde o resultado em arquivo versionado.
- Reuse as mesmas condições nas medições seguintes.

**Verificação:** Existe um arquivo de baseline com métricas e o ambiente em que foram medidas.

**Complementares (sugeridas por similaridade):** `regr-baseline-capture`, `bench-gameplay-metrics`, `light-technology-modes`

**Limites e recuperação:** Nunca invente resultados nem compare com ferramenta que não foi testada. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
