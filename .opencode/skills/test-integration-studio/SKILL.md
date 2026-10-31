---
name: test-integration-studio
description: "Testes de integração dentro do Studio."
metadata:
  id: SK-18-02
  department: "Testes automatizados"
  version: "1.0"
  revised: "2026-10-18"
---

# test-integration-studio

Testes de integração dentro do Studio.

**Quando usar:** Sistemas que usam serviços e instâncias.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Rode em Play ou Run e observe o Output.
- Cubra o fluxo principal de ponta a ponta.
- Registre o que não pôde ser automatizado.

**Verificação:** O fluxo principal funcionou e foi observado.

**Complementares (sugeridas por similaridade):** `review-integration`, `anim3d-validation-in-studio`, `compat-studio-vs-live`

**Limites e recuperação:** Diga o que foi executado e o que depende de teste manual no Studio. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
