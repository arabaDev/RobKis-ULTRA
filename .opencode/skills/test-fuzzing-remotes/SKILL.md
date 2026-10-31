---
name: test-fuzzing-remotes
description: "Enviar entradas inválidas a Remotes para testar a defesa."
metadata:
  id: SK-18-05
  department: "Testes automatizados"
  version: "1.0"
  revised: "2026-10-18"
---

# test-fuzzing-remotes

Enviar entradas inválidas a Remotes para testar a defesa.

**Quando usar:** Qualquer Remote novo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Dispare com tipos errados, NaN, tabelas enormes e rajadas.
- O servidor deve ignorar sem erro.
- Faça isso só no seu próprio jogo.

**Verificação:** Nenhuma entrada inválida causa efeito ou erro.

**Complementares (sugeridas por similaridade):** `net-unreliable-remotes`, `doc-onboarding-guide`, `sec-remote-input-validation`

**Limites e recuperação:** Diga o que foi executado e o que depende de teste manual no Studio. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
