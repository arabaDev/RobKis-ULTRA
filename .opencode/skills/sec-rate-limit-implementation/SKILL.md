---
name: sec-rate-limit-implementation
description: "Limite de frequência por jogador e por Remote."
metadata:
  id: SK-08-02
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-rate-limit-implementation

Limite de frequência por jogador e por Remote.

**Quando usar:** Ações que podem ser disparadas em rajada.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Guarde o instante da última chamada com os.clock por jogador.
- Use balde de fichas para ações que aceitam pequenas rajadas.
- Limpe em PlayerRemoving.

**Verificação:** Mil chamadas em um segundo geram poucos efeitos.

**Complementares (sugeridas por similaridade):** `secan-rate-abuse`, `combat-fire-rate`, `tool-server-validation`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
