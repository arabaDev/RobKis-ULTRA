---
name: mat-normal-maps
description: "Normal maps: espaço tangente, convenção e uso."
metadata:
  id: SK-23-13
  department: "Materiais e texturas"
  version: "1.0"
  revised: "2026-10-18"
---

# mat-normal-maps

Normal maps: espaço tangente, convenção e uso.

**Quando usar:** Detalhe de relevo sem geometria extra.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Faça o bake em espaço tangente a partir da malha de alta resolução.
- Confirme a convenção do canal verde esperada pelo destino.
- Configure o espaço de cor como não-cor.

**Verificação:** O relevo ilumina na direção correta no Studio.

**Complementares (sugeridas por similaridade):** `light-denoising`, `anim3d-root-motion`, `bpy-bmesh-modeling`

**Limites e recuperação:** Confirme os limites de textura atuais do Roblox. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
