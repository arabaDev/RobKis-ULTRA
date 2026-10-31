---
name: test-datastore-offline
description: "Testar comportamento quando o DataStore falha."
metadata:
  id: SK-18-10
  department: "Testes automatizados"
  version: "1.0"
  revised: "2026-10-18"
---

# test-datastore-offline

Testar comportamento quando o DataStore falha.

**Quando usar:** Salvamento e carregamento.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Simule erro com pcall falso.
- Jogador deve entrar com dados padrão e aviso.
- Nunca sobrescrever dados bons após falha de leitura.

**Verificação:** Falha de leitura não apaga dados existentes.

**Complementares (sugeridas por similaridade):** `secan-datastore-abuse`, `data-studio-api-access`, `bug-datastore-failures`

**Limites e recuperação:** Diga o que foi executado e o que depende de teste manual no Studio. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
