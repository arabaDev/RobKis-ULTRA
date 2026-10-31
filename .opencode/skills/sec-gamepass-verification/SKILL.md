---
name: sec-gamepass-verification
description: "Verificação de Game Pass no servidor."
metadata:
  id: SK-08-06
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-gamepass-verification

Verificação de Game Pass no servidor.

**Quando usar:** Benefícios por passe.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- MarketplaceService:UserOwnsGamePassAsync dentro de pcall.
- Cache por jogador e invalide ao comprar.
- Nunca confie em flag do cliente.

**Verificação:** Jogador sem o passe não recebe o benefício.

**Complementares (sugeridas por similaridade):** `pipe-in-game-verification`, `mcp-state-verification`, `orch-incremental-verification`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
