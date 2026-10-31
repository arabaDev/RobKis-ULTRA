---
name: review-export
description: "Revisão de exportação: arquivo existe, reimporta e tem configurações registradas."
metadata:
  id: SK-32-10
  department: "Revisão independente"
  version: "1.0"
  revised: "2026-10-18"
---

# review-export

Revisão de exportação: arquivo existe, reimporta e tem configurações registradas.

**Quando usar:** Depois de exportar.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Confirme que o arquivo existe e tem tamanho maior que zero.
- Reimporte em cena limpa e compare dimensões, orientação e triângulos.
- Compare as configurações usadas (formato, escala, eixos) com as registradas.
- Registre divergências com a causa provável.

**Verificação:** A reimportação foi feita e as diferenças em relação à cena de origem estão listadas.

**Complementares (sugeridas por similaridade):** `exp-failed-export-triage`, `exp-selection-export`, `rig-export-armature`

**Limites e recuperação:** Não aprove o que não verificou; reporte evidência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
