---
name: tool-server-validation
description: "Validação no servidor de ações disparadas por uma Tool."
metadata:
  id: SK-05-04
  department: "Ferramentas e armas"
  version: "1.0"
  revised: "2026-10-18"
---

# tool-server-validation

Validação no servidor de ações disparadas por uma Tool.

**Quando usar:** Qualquer Tool que cause efeito no jogo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Confirme que o jogador possui e está com a Tool equipada.
- Valide cooldown, distância e estado vivo.
- Efeito e dano são calculados no servidor.

**Verificação:** Chamar o Remote sem a Tool é rejeitado.

**Complementares (sugeridas por similaridade):** `arq-client-server-boundary`, `inv-server-actions`, `proc-validation-bounds`

**Limites e recuperação:** Confirme se o jogo usa R6, R15 ou rigs próprios antes de ajustar empunhadura. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
