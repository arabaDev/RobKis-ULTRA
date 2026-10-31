---
name: combat-hit-dedup
description: "Evita dano duplicado por golpe, projétil ou colisão repetida."
metadata:
  id: SK-04-06
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-hit-dedup

Evita dano duplicado por golpe, projétil ou colisão repetida.

**Quando usar:** Quando Touched dispara várias vezes ou o golpe atravessa várias partes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Tabela de alvos já atingidos por golpe, descartada ao final.
- Desconecte a conexão do projétil ao primeiro acerto, se não perfura.
- Não use Touched sozinho para dano crítico.

**Verificação:** Um golpe aplica dano exatamente uma vez por alvo.

**Complementares (sugeridas por similaridade):** `fx-hit-feedback`, `combat-damage-pipeline`, `phys-touched-pitfalls`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
