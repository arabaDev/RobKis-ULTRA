---
name: secan-remote-audit
description: "Auditoria de todos os Remotes."
metadata:
  id: SK-39-02
  department: "Análise de segurança"
  version: "1.0"
  revised: "2026-10-18"
---

# secan-remote-audit

Auditoria de todos os Remotes.

**Quando usar:** Revisão de segurança.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Liste todos os Remotes.
- Cheque validação e limite de taxa.
- Registre achados.

**Verificação:** Nenhum Remote sem handler validado.

**Complementares (sugeridas por similaridade):** `secan-audit-report-format`, `secan-economy-exploit-audit`, `secan-free-model-audit`

**Limites e recuperação:** Auditoria só no seu próprio jogo; reporte o que não foi revisado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
