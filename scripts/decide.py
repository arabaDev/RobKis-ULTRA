#!/usr/bin/env python3
"""Motor de decisão do ROViral ULTRA (heurístico, determinístico, só biblioteca padrão).

  python scripts/decide.py "criar um tycoon de fazenda com loja e inventário"
  python scripts/decide.py "loja medieval" --style "Japonês tradicional" --detail alto --json

Entrada: pedido em texto + preferências opcionais (--style, --detail, --platform, --mode).
Saída: modo (autônomo | personalizado | misto), gênero, estilo de build e de GUI, abordagem (realismo/surrealismo/estilização),
tipos de tarefa, complexidade 1-5, skills a carregar (já verificadas no disco), nível de Fast Check e perguntas ESSENCIAIS.

Regras: o que o usuário escolheu SEMPRE vence; o resto é decidido aqui, com o motivo. Isto é um ponto de partida
baseado em palavras-chave, não entende imagens nem substitui o julgamento do agente.
"""
from __future__ import annotations
import argparse, json, os, re, sys, unicodedata

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import skill_search  # noqa: E402

def norm(s):
    return unicodedata.normalize("NFKD", s.lower()).encode("ascii", "ignore").decode()

BUILD_STYLES = ["Roblox clássico", "Low-poly", "Realista", "Semirrealista", "Medieval", "Fantasia", "Anime", "Japonês tradicional",
                "Moderno", "Futurista", "Industrial", "Urbano", "Fazenda", "Tycoon", "Terror", "Natureza", "Pós-apocalíptico",
                "Cartoon", "Minimalista", "Surrealista", "Híbrido"]
GUI_STYLES = {"AnimeAdventure": "Anime", "WesternSurvival": "Western Survival", "Simulator": "Simulator", "RPGFantasy": "RPG Fantasy",
              "MilitaryTactical": "Military Tactical", "SciFi": "Sci-Fi", "Horror": "Horror", "Classic": "Clássico", "Farm": "Fazenda",
              "Tycoon": "Tycoon", "Competitive": "Competitivo", "Minimalist": "Minimalista", "Custom": "Custom"}

# gênero -> (palavras-chave, estilo de GUI, estilos de build)
GENRES = {
    "tycoon": (["tycoon", "fabrica", "esteira", "dropper", "producao"], "Tycoon", ["Tycoon", "Cartoon", "Industrial"]),
    "fazenda": (["fazenda", "farm", "jardim", "garden", "plantar", "colheita", "agricultura"], "Farm", ["Fazenda", "Cartoon", "Natureza"]),
    "simulator": (["simulator", "simulador", "pets", "mascote", "rebirth"], "Simulator", ["Cartoon", "Low-poly"]),
    "terror": (["terror", "horror", "assombr", "lobby escuro", "maniaco", "killer"], "Horror", ["Terror", "Semirrealista"]),
    "ninja": (["ninja", "shinobi", "samurai", "japon", "vila oculta", "jutsu"], "AnimeAdventure", ["Japonês tradicional", "Anime"]),
    "rpg": (["rpg", "fantasia", "medieval", "dragao", "masmorra", "dungeon", "castelo"], "RPGFantasy", ["Medieval", "Fantasia"]),
    "sobrevivencia": (["sobreviv", "western", "faroeste", "velho oeste", "apocalip", "trem"], "WesternSurvival", ["Pós-apocalíptico", "Semirrealista"]),
    "militar": (["militar", "fps", "tatico", "tiro", "guerra", "swat"], "MilitaryTactical", ["Realista", "Industrial"]),
    "scifi": (["sci-fi", "scifi", "futurista", "espaco", "espacial", "cyber", "robo", "nave"], "SciFi", ["Futurista", "Moderno"]),
    "aventura-anime": (["pirata", "ilha", "blox fruits", "akuma", "anime"], "AnimeAdventure", ["Anime", "Fantasia"]),
    "competitivo": (["competitivo", "pvp", "ranked", "arena", "torneio", "rodadas"], "Competitive", ["Moderno", "Minimalista"]),
    "roleplay": (["roleplay", "cidade", "brookhaven", "casas", "urbano", "bairro"], "Minimalist", ["Urbano", "Moderno", "Semirrealista"]),
    "obby": (["obby", "parkour", "torre de", "tower of hell"], "Classic", ["Roblox clássico", "Cartoon"]),
}

# tipo de tarefa -> (palavras-chave, especialidades)
KINDS = {
    "gui": (["gui", "hud", "interface", "menu", "loja", "inventario", "botao", "tela", "barra de vida"], ["gui_ux"]),
    "build": (["mapa", "cenario", "construc", "build", "predio", "casa", "cidade", "ilha", "vila", "ambiente", "terreno"], ["construcao", "procedural", "analise_imagem"]),
    "modelo3d": (["blender", "modelo", "mesh", "rig", "uv", "exportar", "malha"], ["blender", "automacao_python"]),
    "sistema": (["sistema", "script", "combate", "arma", "habilidade", "missao", "npc", "inventario", "economia", "tycoon", "dados", "datastore"], ["arquitetura_luau"]),
    "bug": (["bug", "erro", "corrigir", "quebrado", "nao funciona", "falha"], ["depuracao", "testes_estatica"]),
    "otimizacao": (["lag", "otimiz", "desempenho", "fps baixo", "performance"], ["otimizacao"]),
    "seguranca": (["exploit", "seguranca", "anti-cheat", "remote", "hack"], ["seguranca"]),
    "viral": (["viral", "virais", "viralizar", "robux", "ideia", "ideias", "conceito", "tendencia", "trend", "bombar", "sucesso", "popular", "hit"], ["ideias_virais"]),
    "estudo": (["estudar", "estude", "analisar o jogo", "analise o jogo", "tipo o", "parecido com", "inspirado", "teardown", "por que viralizou", "nicho", "concorrente", "recriar", "reconstruir"], ["estudo_jogo"]),
    "validacao": (["metrica", "retencao", "analytics", "validar", "bounce", "playtest", "d1", "d7"], ["validacao_viral"]),
    "imagem": (["imagem", "imagens", "foto", "print", "screenshot", "captura", "referencia visual", "thumbnail", "miniatura", "nesse estilo", "desse jeito"], ["visao"]),
    "pesquisa": (["pesquis", "web", "internet", "site", "link", "tendencia", "em alta", "dados do jogo", "quantos jogadores"], ["estudo_jogo"]),
}
EXTRA_BY_WORD = {
    "combate": ["combate_hitbox"], "hitbox": ["combate_hitbox"], "arma": ["combate_hitbox"], "npc": ["npc_ia"], "inimigo": ["npc_ia"],
    "inventario": ["inventario"], "equipamento": ["inventario"], "economia": ["progressao_economia"], "nivel": ["progressao_economia"],
    "xp": ["progressao_economia"], "tycoon": ["tycoon_simulador"], "simulador": ["tycoon_simulador"], "simulator": ["tycoon_simulador"],
    "fazenda": ["tycoon_simulador"], "datastore": ["datastore"], "salvar": ["datastore"], "persist": ["datastore"],
    "animacao": ["animacao_efeitos"], "efeito": ["animacao_efeitos"], "refator": ["refatoracao"], "mcp": ["mcp"],
    "compra": ["seguranca", "progressao_economia"], "loja": ["seguranca", "progressao_economia"],
}
# 20 especializações -> skills EXISTENTES (verificadas por test_decide.py); novas só onde havia lacuna
SPECIALTIES = {
    "arquitetura_luau": ["roblox-luau-architecture", "arq-design-patterns-luau", "luau-gradual-typing"],
    "combate_hitbox": ["combat-hitbox-overlap", "combat-hitbox-raycast", "combat-animation-sync"],
    "npc_ia": ["ai-pathfinding-service", "ai-behavior-trees"],
    "inventario": ["flow-inventory-system", "ui-inventory-grids"],
    "progressao_economia": ["game-progression-xp-levels", "roblox-economy-balancing", "eco-anti-exploit-economy"],
    "tycoon_simulador": ["references/tycoon-sim-systems.md"],
    "datastore": ["roblox-datastore-persistence", "bug-datastore-failures"],
    "gui_ux": ["references/gui-design-human.md", "references/gui-engine.md"],
    "animacao_efeitos": ["ui-tween-animation", "fx-tween-vfx", "anim-procedural"],
    "seguranca": ["net-remote-event-design", "net-remote-function-risks"],
    "procedural": ["proc-modular-building-kits", "proc-vegetation-scatter", "proc-seeded-randomness"],
    "otimizacao": ["perf-loop-optimization", "perf-memory-profiling"],
    "depuracao": ["debugging-testing", "bug-bisect-regressions"],
    "mcp": ["mcp-roblox-studio-usage", "compat-mcp-versions"],
    "blender": ["blender-modeling", "blender-python", "bpy-mesh-stats"],
    "automacao_python": ["blender-python", "compat-python-versions"],
    "construcao": ["references/build-direction.md", "proc-architecture-generator", "proc-modular-building-kits"],
    "analise_imagem": ["references/build-direction.md"],
    "testes_estatica": ["references/fast-check.md"],
    "refatoracao": ["arq-refactor-safely", "roblox-code-maintenance-refactor"],
    # ROViral (estratégia viral): referências da skill roviral-ultra + skills viral-* do catálogo
    "ideias_virais": ["references/viral-science.md", "references/idea-engine.md", "references/viral-scorecard.md", "viral-viral-ideas"],
    "estudo_jogo": ["references/trend-research.md", "viral-game-inspector"],
    "validacao_viral": ["references/viral-validation.md", "viral-prototype-validation"],
    "equipe": ["references/team-protocol.md"],
    "visao": ["references/vision.md"],
}
SENSITIVE = {"seguranca", "sistema"}
DESTRUCTIVE = ["apagar", "deletar", "sobrescrever", "remover tudo", "limpar o projeto", "resetar"]

def match_style(text, options):
    t = norm(text)
    for o in sorted(options, key=len, reverse=True):
        if norm(o) in t:
            return o
    return None

def target_exists(target):
    """references/x.md vive na pasta da skill roviral-ultra (projeto ou pacote); nomes de skills vivem em .opencode/skills.
    Sem catálogo (pacote Claude.ai) nomes de skills são considerados existentes (não dá para verificar)."""
    if target.startswith("references/"):
        return any(os.path.isfile(os.path.join(b, target)) for b in (ROOT,))
    if not os.path.isdir(skill_search.SKILLS_DIR):
        return True
    return os.path.isfile(os.path.join(skill_search.SKILLS_DIR, target, "SKILL.md"))

def decide(request, style=None, detail=None, platform=None, mode=None, has_images=False):
    t = norm(request)
    words = len(re.findall(r"\w+", t))
    out = {"pedido": request, "motivos": {}, "perguntas": [], "suposicoes": []}

    # preferências explícitas
    prefs = {}
    if style:
        prefs["estilo"] = style
    else:
        # só conta como escolha quando o usuário diz "estilo X" (palavras de gênero como "fazenda" não são escolha)
        m = re.search(r"\bestilo\s+(?:de\s+|do\s+|da\s+)?([^,.;]{1,30})", t)
        if m and match_style(m.group(1), BUILD_STYLES + list(GUI_STYLES.values())):
            prefs["estilo"] = match_style(m.group(1), BUILD_STYLES + list(GUI_STYLES.values()))
    if detail or re.search(r"\bdetalh", t):
        prefs["detalhe"] = detail or "informado no texto"
    if re.search(r"#[0-9a-f]{6}\b|\bcor(es)?\b", t):
        prefs["cores"] = "informadas no texto"
    if platform:
        prefs["plataforma"] = platform
    if has_images:
        prefs["referencias"] = "imagens fornecidas"
    if mode in ("auto", "custom", "mixed"):
        out["modo"] = {"auto": "autônomo", "custom": "personalizado", "mixed": "misto"}[mode]
    elif "modo personalizado" in t or "eu escolho" in t or "quero escolher" in t:
        out["modo"] = "personalizado"
    elif prefs:
        out["modo"] = "misto"
    else:
        out["modo"] = "autônomo"
    out["preferencias_do_usuario"] = prefs

    # gênero
    scores = {g: sum(1 for k in kw if k in t) for g, (kw, _, _) in GENRES.items()}
    ranked = [g for g, s in sorted(scores.items(), key=lambda x: -x[1]) if s > 0]
    genre = ranked[0] if ranked else None
    out["genero"] = genre
    out["motivos"]["genero"] = ("palavras-chave do pedido" if genre else "nenhum gênero identificado; usar o projeto/imagens ou perguntar só se for decisivo")

    # estilos (usuário sempre vence)
    gui_style = GENRES[genre][1] if genre else "Minimalist"
    build_styles = list(GENRES[genre][2]) if genre else ["Semirrealista"]
    if "estilo" in prefs:
        chosen = match_style(prefs["estilo"], BUILD_STYLES + list(GUI_STYLES.values()) + list(GUI_STYLES))
        if chosen:
            if chosen in BUILD_STYLES:
                build_styles = [chosen]
            for key, label in GUI_STYLES.items():
                if norm(chosen) in (norm(key), norm(label)):
                    gui_style = key
        out["motivos"]["estilo"] = "escolhido pelo usuário (mantido); demais decisões seguem o gênero"
    else:
        out["motivos"]["estilo"] = "derivado do gênero" if genre else "padrão neutro (sem gênero)"
    out["estilo_gui"] = gui_style
    out["estilos_build"] = build_styles

    # abordagem artística
    approaches = []
    if re.search(r"surreal|onirico|impossivel|fantastic", t):
        approaches.append("surrealismo")
    if re.search(r"realista|realismo|fotorreal", t):
        approaches.append("realismo")
    if not approaches:
        approaches.append("realismo" if genre in ("militar", "terror") else "estilização profissional")
    out["abordagem"] = approaches

    # tipos de tarefa
    # início de palavra (prefixo): "otimiz" casa "otimizar", mas "erro" não casa "terror"
    kinds = [k for k, (kw, _) in KINDS.items() if any(re.search(r"(?<![a-z0-9])" + re.escape(w), t) for w in kw)]
    if has_images and "build" not in kinds:
        kinds.append("build")
    if has_images and "imagem" not in kinds:
        kinds.append("imagem")
    out["tipos"] = kinds or ["geral"]

    # complexidade 1-5
    c = 1 + len(kinds)
    if re.search(r"\b(completo|inteiro|do zero|sistema completo)\b|\b(cri\w*|fa[cz]\w*|mont\w*|constru\w*) (um |uma |o |meu )?jogo\b", t):
        c += 2
    if words > 40:
        c += 1
    out["complexidade"] = max(1, min(5, c))

    # skills
    specs = []
    for k in kinds:
        specs += KINDS[k][1]
    for w, sp in EXTRA_BY_WORD.items():
        if w in t:
            specs += sp
    if genre in ("tycoon", "fazenda", "simulator"):
        specs.append("tycoon_simulador")
    specs += ["testes_estatica"]
    # segurança, dados e economia primeiro: são as que mais custam se forem esquecidas
    if out["complexidade"] >= 3:
        specs.append("equipe")  # ROViral especifica, RobKis executa, ROViral revisa
    # estratégia viral antes de tudo (decide O QUE construir); depois segurança, dados e economia (custam caro se esquecidas)
    specs.sort(key=lambda x: 0 if x in ("ideias_virais", "estudo_jogo", "visao") else 1 if x in ("seguranca", "datastore", "progressao_economia") else 2)
    seen, skills = set(), []
    for sp in specs:
        for s in SPECIALTIES.get(sp, []):
            if s not in seen:
                seen.add(s)
                skills.append(s)
    if ("viral" in kinds or "estudo" in kinds) and re.search(r"\b(cri[ae]r?|fa[cz]a|fazer|monte|construa|jogo completo|do zero)\b", t):
        skills.insert(min(4, len(skills)), "viral-game-generator")
    out["especialidades"] = sorted(set(specs))
    out["skills"] = skills[:10]
    out["skills_ausentes_no_disco"] = [t for t in out["skills"] if not target_exists(t)]
    if not os.path.isdir(skill_search.SKILLS_DIR):
        out["suposicoes"].append("Sem catálogo .opencode/skills: nomes de skills sem 'references/' pertencem ao projeto completo; use as referências embutidas.")

    # verificação
    level = 1
    if out["complexidade"] >= 2 or "sistema" in kinds or "gui" in kinds:
        level = 2
    if out["complexidade"] >= 4 or any(k in SENSITIVE for k in kinds) or "datastore" in out["especialidades"]:
        level = 3
    out["fastcheck_nivel"] = level
    out["paralelizavel"] = [k for k in kinds if k in ("gui", "build", "modelo3d")] if len(kinds) > 1 else []

    # perguntas: só o essencial
    if words < 3 and not has_images:
        out["perguntas"].append("O que você quer criar ou corrigir? (o pedido não diz o objeto da tarefa)")
    if any(d in t for d in DESTRUCTIVE):
        out["perguntas"].append("Isso apaga ou sobrescreve arquivos. Confirma a autorização?")
    if "build" in kinds and "estilo" not in prefs and not genre and not has_images:
        out["suposicoes"].append("Sem gênero, estilo ou imagem: assumir Semirrealista e ajustar quando o usuário revelar o gênero.")
    if not platform:
        out["suposicoes"].append("Plataformas: PC, celular e tablet (padrão).")
    out["suposicoes"].append("Detalhe: decidido pela complexidade e pelo orçamento de desempenho." if "detalhe" not in prefs else "Detalhe conforme o usuário.")
    return out

def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("pedido", nargs="+")
    ap.add_argument("--style")
    ap.add_argument("--detail")
    ap.add_argument("--platform")
    ap.add_argument("--mode", choices=("auto", "custom", "mixed"))
    ap.add_argument("--images", action="store_true", help="há imagens de referência anexadas")
    ap.add_argument("--json", action="store_true")
    a = ap.parse_args()
    r = decide(" ".join(a.pedido), a.style, a.detail, a.platform, a.mode, a.images)
    if a.json:
        print(json.dumps(r, indent=2, ensure_ascii=False))
        return
    print(f"modo: {r['modo']} | gênero: {r['genero']} | complexidade: {r['complexidade']}/5 | Fast Check nível {r['fastcheck_nivel']}")
    print(f"GUI: {r['estilo_gui']} | build: {', '.join(r['estilos_build'])} | abordagem: {', '.join(r['abordagem'])}")
    print(f"tipos: {', '.join(r['tipos'])}")
    print("skills: " + ", ".join(r["skills"]))
    for q in r["perguntas"]:
        print("PERGUNTAR:", q)
    for s in r["suposicoes"]:
        print("assumido:", s)

if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    main()
