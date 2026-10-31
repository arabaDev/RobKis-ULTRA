---
name: sec-admin-auth
description: "Autorização de comandos de administrador."
metadata:
  id: SK-08-12
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-admin-auth

Autorização de comandos de administrador.

**Quando usar:** Painéis e comandos de staff.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Autorize por UserId ou cargo em grupo, no servidor.
- Nunca por nome de usuário.
- Registre o uso de comandos.

**Verificação:** Jogador comum não executa comando de admin.

**Complementares (sugeridas por similaridade):** `bpy-custom-operators`, `luau-string-handling`, `mcp-untrusted-content-handling`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
