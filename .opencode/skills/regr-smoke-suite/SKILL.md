---
name: regr-smoke-suite
description: "Suíte rápida de poucos testes que cobrem o essencial do jogo após cada mudança."
metadata:
  id: SK-36-02
  department: "Testes de regressão"
  version: "1.0"
  revised: "2026-10-18"
---

# regr-smoke-suite

Suíte rápida de poucos testes que cobrem o essencial do jogo após cada mudança.

**Quando usar:** Depois de qualquer mudança.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Escolha de 5 a 10 verificações do fluxo principal: entrar, jogar, morrer, comprar e sair.
- Deve rodar em poucos minutos.
- Falhe rápido e mostre qual passo quebrou.
- Atualize a suíte quando surgir um bug novo.

**Verificação:** A suíte roda completa e cada passo tem resultado registrado.

**Complementares (sugeridas por similaridade):** `bench-task-suite`, `test-performance-smoke`, `mcp-state-verification`

**Limites e recuperação:** Compare sempre com um baseline registrado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
