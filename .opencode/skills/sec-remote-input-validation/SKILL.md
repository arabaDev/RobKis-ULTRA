---
name: sec-remote-input-validation
description: "Validação de tipo, faixa e formato de argumentos de Remotes."
metadata:
  id: SK-08-01
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-remote-input-validation

Validação de tipo, faixa e formato de argumentos de Remotes.

**Quando usar:** Todo handler de OnServerEvent ou OnServerInvoke.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Cheque typeof de cada argumento antes de usar.
- Rejeite NaN, infinito, negativos e valores fora da faixa.
- Texto e tabelas com tamanho máximo.

**Verificação:** Entradas inválidas são ignoradas sem erro e sem efeito.

**Complementares (sugeridas por similaridade):** `mcp-argument-validation`, `proc-validation-bounds`, `tool-server-validation`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
