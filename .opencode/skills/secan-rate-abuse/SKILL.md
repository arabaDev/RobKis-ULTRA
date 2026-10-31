---
name: secan-rate-abuse
description: "Auditar abuso por frequência: Remotes e recursos que podem ser disparados em rajada."
metadata:
  id: SK-39-09
  department: "Análise de segurança"
  version: "1.0"
  revised: "2026-10-18"
---

# secan-rate-abuse

Auditar abuso por frequência: Remotes e recursos que podem ser disparados em rajada.

**Quando usar:** Spam de Remotes e recursos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Liste os Remotes e ações que consomem recurso, criam objetos ou gravam dados.
- Verifique se cada um tem limite por jogador.
- Dispare em rajada no seu próprio jogo de teste e meça o efeito.
- Exija penalidade gradual e registro.

**Verificação:** Nenhuma ação consegue gerar efeito ilimitado por segundo em teste de rajada.

**Complementares (sugeridas por similaridade):** `sec-rate-limit-implementation`, `secan-datastore-abuse`, `combat-fire-rate`

**Limites e recuperação:** Auditoria só no seu próprio jogo; reporte o que não foi revisado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
