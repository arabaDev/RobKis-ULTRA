---
name: light-render-memory
description: "Gerenciamento de memória de render."
metadata:
  id: SK-30-19
  department: "Iluminação e renderização"
  version: "1.0"
  revised: "2026-10-18"
---

# light-render-memory

Gerenciamento de memória de render.

**Quando usar:** Falta de memória ou travamento.

**Requer:** Blender disponível, Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Reduza a resolução de texturas e a subdivisão.
- Renderize em partes.
- Feche cenas não usadas.

**Verificação:** O render termina sem erro de memória.

**Complementares (sugeridas por similaridade):** `perf-memory-leaks`, `perf-memory-profiling`, `light-render-diagnosis`

**Limites e recuperação:** Confirme identificadores de motor de render na versão do Blender em uso. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
