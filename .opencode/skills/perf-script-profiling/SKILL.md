---
name: perf-script-profiling
description: "Perfil de scripts com os.clock e debug.profilebegin."
metadata:
  id: SK-16-03
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-script-profiling

Perfil de scripts com os.clock e debug.profilebegin.

**Quando usar:** Código suspeito de custo alto.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- debug.profilebegin e debug.profileend aparecem no MicroProfiler.
- os.clock para tempos pontuais.
- Meça com carga realista.

**Verificação:** O custo por chamada foi medido.

**Complementares (sugeridas por similaridade):** `perf-memory-profiling`, `studio-script-workflow`, `bpy-script-failure-diagnosis`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
