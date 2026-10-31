#!/usr/bin/env python3
"""Testes do motor de decisão: comportamento esperado e integridade do mapa de skills (existem no disco)."""
from __future__ import annotations
import sys as _sys
for _s in (_sys.stdout, _sys.stderr):  # console do Windows (cp1252)
    if hasattr(_s, "reconfigure"):
        _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import decide, skill_search  # noqa: E402

failed = 0
def check(name, cond):
    global failed
    print(("ok     " if cond else "FALHOU ") + name)
    failed += 0 if cond else 1

r = decide.decide("criar um tycoon de fazenda com loja e inventário")
check("tycoon/fazenda detectado", r["genero"] in ("tycoon", "fazenda"))
check("modo autônomo sem preferências", r["modo"] == "autônomo")
check("GUI de tycoon ou fazenda", r["estilo_gui"] in ("Tycoon", "Farm"))
check("loja aciona segurança + economia", {"seguranca", "progressao_economia"} <= set(r["especialidades"]))
check("loja pede Fast Check nível 3 (segurança)", r["fastcheck_nivel"] == 3)

r = decide.decide("tycoon com loja")
check("loja inclui skill de segurança de remotes", "net-remote-event-design" in r["skills"])

r = decide.decide("vila ninja com ponte", style="Medieval")
check("estilo do usuário vence o gênero", r["estilos_build"] == ["Medieval"])
check("modo misto com estilo", r["modo"] == "misto")

r = decide.decide("quero escolher tudo, modo personalizado: loja")
check("modo personalizado detectado", r["modo"] == "personalizado")

r = decide.decide("mapa")
check("pedido vago gera pergunta essencial", len(r["perguntas"]) == 1)
r = decide.decide("criar casa de dois andares com varanda")
check("pedido claro não pergunta", r["perguntas"] == [])
r = decide.decide("apagar todo o projeto e recriar a interface")
check("ação destrutiva pede autorização", any("autoriza" in q for q in r["perguntas"]))
r = decide.decide("corrigir bug no inventário")
check("bug aciona depuração", "depuracao" in r["especialidades"])
r = decide.decide("terra surreal onírica com torres impossíveis")
check("surrealismo detectado", "surrealismo" in r["abordagem"])
r = decide.decide("ilha", has_images=True)
check("imagens contam como preferência", r["modo"] == "misto" and "build" in r["tipos"])

# integridade: toda skill do mapa existe
missing = sorted({s for lst in decide.SPECIALTIES.values() for s in lst if not decide.target_exists(s)})
check("todas as skills do mapa existem no disco" + (f" (faltam: {missing})" if missing else ""), not missing)
check("bug em jogo existente não vira projeto gigante", decide.decide("o jogo dá erro quando compro na loja")["complexidade"] <= 4)
check("bug carrega depuração", "debugging-testing" in decide.decide("o jogo dá erro quando compro na loja")["skills"])
check("25 especializações mapeadas", len(decide.SPECIALTIES) == 25)
check("print/imagem carrega o guia de visão", "references/vision.md" in decide.decide("analise esse print da minha gui")["skills"])
check("--images carrega o guia de visão", "references/vision.md" in decide.decide("faça um mapa", has_images=True)["skills"])
check("'terror' não é confundido com 'erro'", "bug" not in decide.decide("ideias de jogos de terror")["tipos"])
# busca enxerga skills fora do índice
check("busca de skills encontra o Idea Engine do catálogo", any(n == "viral-viral-ideas" for n, _, _ in skill_search.search(["ideias", "virais"], 5)))
check("SKILL.md da raiz tem name roviral-ultra (Claude.ai exige pasta com o mesmo nome)", "\nname: roviral-ultra\n" in open(os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "SKILL.md"), encoding="utf-8").read())
r = decide.decide("me da 5 ideias de jogos virais de terror")
check("pedido de ideias carrega o Idea Engine primeiro", r["skills"][:3] == ["references/viral-science.md", "references/idea-engine.md", "references/viral-scorecard.md"])
r = decide.decide("estude o jogo tipo o doors e crie um jogo completo do zero")
check("estudo + criação carrega trend-research e o gerador", "references/trend-research.md" in r["skills"] and "viral-game-generator" in r["skills"])
check("jogo completo inclui o protocolo de equipe", "references/team-protocol.md" in r["skills"] or r["complexidade"] < 3)
r = decide.decide("meu jogo tem bounce alto, como validar a retencao")
check("validação carrega viral-validation", "references/viral-validation.md" in r["skills"])
print(f"\n{'todos passaram' if not failed else str(failed) + ' falharam'}")
sys.exit(1 if failed else 0)
