---
name: sec-anti-speed-fly
description: "Detecção de velocidade e voo anômalos com tolerância."
metadata:
  id: SK-08-11
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-anti-speed-fly

Detecção de velocidade e voo anômalos com tolerância.

**Quando usar:** Jogos competitivos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Compare deslocamento por tempo com limite generoso.
- Considere veículos, trampolins e quedas.
- Corrija a posição em vez de punir de imediato.

**Verificação:** Ações legítimas de movimento não geram falso positivo.

**Complementares (sugeridas por similaridade):** `anim-looping-speed`, `move-humanoid-speed-jump`, `move-speed-modifiers`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
