---
name: bug-yield-issues
description: "Yield infinito e esperas que nunca terminam."
metadata:
  id: SK-17-07
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-yield-issues

Yield infinito e esperas que nunca terminam.

**Quando usar:** Avisos de infinite yield.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- WaitForChild com timeout.
- Verifique nome e pai esperados.
- Evite yield em lugares onde não é permitido.

**Verificação:** Nenhum aviso de yield no Output.

**Complementares (sugeridas por similaridade):** `doc-known-issues`, `compat-deprecated-apis`, `studio-output-console`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
