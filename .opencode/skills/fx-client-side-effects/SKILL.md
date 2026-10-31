---
name: fx-client-side-effects
description: "Efeitos só no cliente, decisões no servidor."
metadata:
  id: SK-29-12
  department: "Áudio e efeitos"
  version: "1.0"
  revised: "2026-10-18"
---

# fx-client-side-effects

Efeitos só no cliente, decisões no servidor.

**Quando usar:** Efeitos visuais e sonoros.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Servidor avisa o evento.
- Cliente cria o efeito.
- Não replicar o que cada cliente pode criar.

**Verificação:** O servidor não cria partículas desnecessárias.

**Complementares (sugeridas por similaridade):** `arq-client-server-boundary`, `mcp-side-effect-verification`, `combat-status-effects`

**Limites e recuperação:** Teste o custo de efeitos em dispositivo móvel. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
