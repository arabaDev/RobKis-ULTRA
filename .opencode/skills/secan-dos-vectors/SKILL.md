---
name: secan-dos-vectors
description: "Vetores de negação de serviço do jogo."
metadata:
  id: SK-39-10
  department: "Análise de segurança"
  version: "1.0"
  revised: "2026-10-18"
---

# secan-dos-vectors

Vetores de negação de serviço do jogo.

**Quando usar:** Jogos com muita simulação.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Criação ilimitada de objetos.
- Loops disparados pelo cliente.
- Limite os recursos.

**Verificação:** Nenhuma ação do cliente cria carga ilimitada.

**Complementares (sugeridas por similaridade):** `luau-math-vectors-cframe`, `eco-currency-design`, `rec-circuit-breaker`

**Limites e recuperação:** Auditoria só no seu próprio jogo; reporte o que não foi revisado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
