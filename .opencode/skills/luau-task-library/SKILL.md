---
name: luau-task-library
description: "Usa task.spawn, task.defer, task.delay, task.wait e task.cancel."
metadata:
  id: SK-02-02
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-task-library

Usa task.spawn, task.defer, task.delay, task.wait e task.cancel.

**Quando usar:** Sempre que precisar de concorrência ou espera.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Prefira a biblioteca task a wait, spawn e delay legados.
- task.spawn roda já até o primeiro yield; task.defer roda no próximo ciclo.
- Guarde a thread de task.delay ou task.spawn se precisar cancelar com task.cancel.

**Verificação:** Nenhum uso de wait(), spawn() ou delay() restante.

**Complementares (sugeridas por similaridade):** `orch-obsolete-task-cancellation`, `bench-task-suite`, `orch-task-classification`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
