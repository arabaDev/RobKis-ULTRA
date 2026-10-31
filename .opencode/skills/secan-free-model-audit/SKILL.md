---
name: secan-free-model-audit
description: "Auditoria de modelos gratuitos e plugins."
metadata:
  id: SK-39-06
  department: "Análise de segurança"
  version: "1.0"
  revised: "2026-10-18"
---

# secan-free-model-audit

Auditoria de modelos gratuitos e plugins.

**Quando usar:** Antes de usar assets de terceiros.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Procure scripts ocultos, require por ID e HTTP.
- Remova o que não for necessário.
- Prefira fontes confiáveis.

**Verificação:** Nenhum script suspeito restante.

**Complementares (sugeridas por similaridade):** `secan-audit-report-format`, `secan-economy-exploit-audit`, `secan-remote-audit`

**Limites e recuperação:** Auditoria só no seu próprio jogo; reporte o que não foi revisado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
