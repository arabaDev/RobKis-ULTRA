---
name: luau-math-vectors-cframe
description: "Vector3, CFrame, Random e matemática de jogo."
metadata:
  id: SK-02-12
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-math-vectors-cframe

Vector3, CFrame, Random e matemática de jogo.

**Quando usar:** Movimento, mira, distâncias e rotações.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Multiplicação de CFrame é ordenada: pai vezes deslocamento.
- .Unit de vetor zero dá NaN; verifique Magnitude antes.
- Random.new(seed) para sequências reproduzíveis; math.clamp para limites.

**Verificação:** Casos com vetor zero e ângulos de borda testados.

**Complementares (sugeridas por similaridade):** `secan-dos-vectors`, `rk-math-rng`, `anim-procedural`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
