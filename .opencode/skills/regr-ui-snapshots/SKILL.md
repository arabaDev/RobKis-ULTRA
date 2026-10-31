---
name: regr-ui-snapshots
description: "Comparar capturas de UI antes e depois de uma mudança, em vários tamanhos de tela."
metadata:
  id: SK-36-06
  department: "Testes de regressão"
  version: "1.0"
  revised: "2026-10-18"
---

# regr-ui-snapshots

Comparar capturas de UI antes e depois de uma mudança, em vários tamanhos de tela.

**Quando usar:** Mudanças de interface.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Capture as telas principais antes de mexer, com os mesmos tamanhos e estado.
- Repita depois da mudança nas mesmas condições.
- Toda diferença visual precisa ser intencional e explicada.
- Inclua os estados vazio, carregando e erro.

**Verificação:** Cada diferença entre as capturas está marcada como intencional ou como defeito.

**Complementares (sugeridas por similaridade):** `test-ui-responsive`, `review-regressions`, `ui-usability-testing`

**Limites e recuperação:** Compare sempre com um baseline registrado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
