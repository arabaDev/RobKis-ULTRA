---
name: bug-race-conditions
description: "Condições de corrida entre scripts e eventos."
metadata:
  id: SK-17-04
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-race-conditions

Condições de corrida entre scripts e eventos.

**Quando usar:** Falhas que dependem do tempo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Garanta ordem com eventos ou WaitForChild.
- Evite assumir que objetos já existem.
- Inicialize em ordem definida.

**Verificação:** O bug não reaparece em várias execuções.

**Complementares (sugeridas por similaridade):** `net-gameplay-sync-timing`, `move-sprint-stamina`, `compat-blender-versions`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
