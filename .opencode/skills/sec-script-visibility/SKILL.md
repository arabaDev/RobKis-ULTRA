---
name: sec-script-visibility
description: "O que o cliente consegue ver e o que fica oculto."
metadata:
  id: SK-08-13
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-script-visibility

O que o cliente consegue ver e o que fica oculto.

**Quando usar:** Decidir onde guardar lógica e dados.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- ServerScriptService e ServerStorage não replicam.
- LocalScripts e ReplicatedStorage são visíveis ao cliente.
- Segredos e regras sensíveis só no servidor.

**Verificação:** Nenhuma lógica sensível em ReplicatedStorage ou LocalScripts.

**Complementares (sugeridas por similaridade):** `net-replication-model`, `studio-script-workflow`, `bpy-script-failure-diagnosis`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
