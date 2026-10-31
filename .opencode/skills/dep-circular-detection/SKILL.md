---
name: dep-circular-detection
description: "Detectar dependências circulares entre módulos que travam o require."
metadata:
  id: SK-34-02
  department: "Análise de dependências"
  version: "1.0"
  revised: "2026-10-18"
---

# dep-circular-detection

Detectar dependências circulares entre módulos que travam o require.

**Quando usar:** Erros de require ou travamentos.

**Regras**
- Mapeie os requires de cada módulo por busca.
- Procure caminhos que voltam ao ponto de partida.
- Quebre o ciclo extraindo a parte comum para um terceiro módulo.
- Rode o jogo e confira que o require não trava mais.

**Verificação:** O mapa de requires não tem ciclos e o jogo inicia sem travar.

**Complementares (sugeridas por similaridade):** `orch-contradiction-detection`, `dep-require-graph`, `arq-module-dependencies`

**Limites e recuperação:** Confirme com busca real; não presuma dependências. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
