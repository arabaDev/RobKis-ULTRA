---
name: phys-raycast-filtering
description: "Filtros de raycast e consultas espaciais."
metadata:
  id: SK-06-07
  department: "Física e colisões"
  version: "1.0"
  revised: "2026-10-18"
---

# phys-raycast-filtering

Filtros de raycast e consultas espaciais.

**Quando usar:** Raios que acertam coisas indesejadas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- FilterType Exclude com lista de instâncias a ignorar.
- CanQuery e CanTouch desligados em partes decorativas.
- Colision groups podem ser usados no RaycastParams.

**Verificação:** O raio ignora o que deve e acerta o que deve.

**Complementares (sugeridas por similaridade):** `combat-hitbox-raycast`, `fx-beams-trails`, `fx-sound-design`

**Limites e recuperação:** Física varia com latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
