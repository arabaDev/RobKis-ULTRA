---
name: compat-input-devices
description: "Suporte a teclado, mouse, toque e gamepad, com troca de dispositivo em jogo."
metadata:
  id: SK-37-06
  department: "Compatibilidade de versões"
  version: "1.0"
  revised: "2026-10-18"
---

# compat-input-devices

Suporte a teclado, mouse, toque e gamepad, com troca de dispositivo em jogo.

**Quando usar:** Teclado, mouse, toque e gamepad.

**Regras**
- Detecte o tipo de entrada.
- Suporte a troca em jogo.
- Controles alternativos.

**Verificação:** Todos os dispositivos alvo funcionam.

**Complementares (sugeridas por similaridade):** `ui-input-handling`, `ui-gamepad-navigation`, `sec-remote-input-validation`

**Limites e recuperação:** Confirme versões na documentação e no ambiente do usuário. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
