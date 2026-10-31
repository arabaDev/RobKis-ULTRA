---
name: sec-secrets-handling
description: "Segredos, chaves e tokens fora do código."
metadata:
  id: SK-08-09
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-secrets-handling

Segredos, chaves e tokens fora do código.

**Quando usar:** Integração com serviços externos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Nunca grave chave em script, repositório ou LocalScript.
- Use o armazenamento de segredos do Roblox quando disponível.
- Requisições HTTP partem do servidor.

**Verificação:** Busca por tokens no projeto não encontra nada.

**Complementares (sugeridas por similaridade):** `luau-error-handling`, `bpy-error-handling-verify`, `game-respawn-handling`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
