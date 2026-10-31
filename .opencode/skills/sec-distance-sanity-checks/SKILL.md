---
name: sec-distance-sanity-checks
description: "Valida distância e linha de visão no servidor."
metadata:
  id: SK-08-04
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-distance-sanity-checks

Valida distância e linha de visão no servidor.

**Quando usar:** Ações de alcance como pegar, abrir e atacar.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Meça entre as posições reais do personagem e do alvo.
- Use margem pequena para latência.
- Linha de visão com raycast quando importa.

**Verificação:** Ação a distância absurda é rejeitada.

**Complementares (sugeridas por similaridade):** `net-server-movement-sanity`, `mat-export-checks`, `sec-ownership-checks`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
