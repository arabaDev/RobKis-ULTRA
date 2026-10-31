---
name: arq-client-server-boundary
description: "Define o que roda no cliente e o que é autoridade do servidor."
metadata:
  id: SK-01-02
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-client-server-boundary

Define o que roda no cliente e o que é autoridade do servidor.

**Quando usar:** Antes de implementar qualquer mecânica multiplayer.

**Regras**
- Servidor decide dano, recompensa, compra, posse e progressão.
- Cliente cuida de input, animação, previsão visual e feedback.
- Tudo que cruza a fronteira vira um contrato de Remote nomeado e tipado.

**Verificação:** Existe uma lista escrita de cada Remote com quem envia, quem valida e o que valida.

**Complementares (sugeridas por similaridade):** `fx-client-side-effects`, `test-multiplayer-local-server`, `tool-server-validation`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
