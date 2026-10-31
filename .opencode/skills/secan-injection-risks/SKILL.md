---
name: secan-injection-risks
description: "Riscos de injeção e execução de código."
metadata:
  id: SK-39-05
  department: "Análise de segurança"
  version: "1.0"
  revised: "2026-10-18"
---

# secan-injection-risks

Riscos de injeção e execução de código.

**Quando usar:** Código dinâmico ou assets externos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Evite loadstring.
- Cuidado com require de IDs de terceiros.
- Revise tudo que executa texto.

**Verificação:** Nenhuma execução de código não confiável.

**Complementares (sugeridas por similaridade):** `net-remote-function-risks`, `dep-third-party-licenses`, `sec-secrets-handling`

**Limites e recuperação:** Auditoria só no seu próprio jogo; reporte o que não foi revisado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
