---
name: test-determinism
description: "Testes reproduzíveis com Random com semente."
metadata:
  id: SK-18-07
  department: "Testes automatizados"
  version: "1.0"
  revised: "2026-10-18"
---

# test-determinism

Testes reproduzíveis com Random com semente.

**Quando usar:** Sorteios e geração procedural.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Random.new(semente) em vez de aleatoriedade solta.
- Registre a semente.
- Teste com várias sementes.

**Verificação:** A mesma semente produz o mesmo resultado.

**Complementares (sugeridas por similaridade):** `proc-seeded-randomness`, `bpy-geometry-nodes-scripting`, `proc-geometry-nodes-intro`

**Limites e recuperação:** Diga o que foi executado e o que depende de teste manual no Studio. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
