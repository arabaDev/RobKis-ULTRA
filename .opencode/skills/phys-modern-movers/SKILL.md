---
name: phys-modern-movers
description: "LinearVelocity, AlignPosition e VectorForce no lugar de BodyMovers."
metadata:
  id: SK-06-04
  department: "Física e colisões"
  version: "1.0"
  revised: "2026-10-18"
---

# phys-modern-movers

LinearVelocity, AlignPosition e VectorForce no lugar de BodyMovers.

**Quando usar:** Mover objetos por física.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- BodyVelocity, BodyPosition e similares são legados.
- Use LinearVelocity, AlignPosition, AlignOrientation e VectorForce com Attachment.
- Defina MaxForce e Responsiveness com cuidado.

**Verificação:** Nenhum BodyMover novo no código.

**Complementares (sugeridas por similaridade):** `bug-physics-glitches`, `phys-network-ownership`, `vcs-roblox-file-formats`

**Limites e recuperação:** Física varia com latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
