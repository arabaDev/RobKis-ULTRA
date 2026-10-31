#!/usr/bin/env python3
"""ROViral ULTRA Fast Check: verificação automática em 3 níveis, só biblioteca padrão, relógio monotônico.

  python scripts/fastcheck.py                 Nível 1 (Instant): só arquivos alterados desde a última passagem limpa
  python scripts/fastcheck.py --level 2       Nível 2 (Targeted): + verificadores dos módulos afetados
  python scripts/fastcheck.py --level 3       Nível 3 (Deep): tudo, sem orçamento de tempo, ignora cache
  python scripts/fastcheck.py --paths a b     Verifica só estes arquivos
Opções: --budget SEG (padrão 10; ignorado no nível 3) | --json | --no-cache

O que cada nível NÃO faz está sempre impresso no relatório. Nenhum nível executa Luau nem testa no Roblox Studio.
Saída: 0 sem erros (mesmo INCOMPLETO por orçamento), 1 com erros.
"""
from __future__ import annotations
import argparse, ast, importlib.util, json, os, re, shutil, subprocess, sys, time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CACHE_DIR = os.path.join(ROOT, ".fastcheck")
SKIP_DIRS = {".git", "__pycache__", ".fastcheck", "node_modules", ".venv"}
TEXT_EXT = {".py", ".luau", ".lua", ".json", ".jsonc", ".md", ".txt"}
SECRETS = [
    (re.compile(r"\bsk-[A-Za-z0-9_\-]{20,}"), "chave de API (sk-...)"),
    (re.compile(r"\bAKIA[0-9A-Z]{16}\b"), "chave AWS"),
    (re.compile(r"\bghp_[A-Za-z0-9]{30,}"), "token GitHub"),
    (re.compile(r"-----BEGIN [A-Z ]*PRIVATE KEY-----"), "chave privada"),
    (re.compile(r"_\|WARNING:-DO-NOT-SHARE", re.I), "cookie .ROBLOSECURITY"),
    (re.compile(r"""api[_-]?key\s*[:=]\s*['"][A-Za-z0-9_\-]{16,}['"]""", re.I), "api_key literal"),
]
MOJIBAKE = re.compile("Ã[\u00a0-\u00bf]|â€[\u0090-\u00bf™œ“”]")
LUAU_RISK = [
    (re.compile(r"\brequire\(\s*\d{5,}\s*\)"), "require(<id numérico>): código remoto"),
    (re.compile(r"\bloadstring\s*\("), "loadstring"),
    (re.compile(r"\bgetfenv\s*\("), "getfenv"),
]

def load_luau_lexer():
    path = os.path.join(ROOT, "gui-engine", "tools", "check_luau.py")
    if not os.path.isfile(path):
        return None
    spec = importlib.util.spec_from_file_location("rk_check_luau", path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod

class Report:
    def __init__(self):
        self.errors, self.warnings, self.skipped, self.notes = [], [], [], []

def walk_files():
    for dp, dns, fns in os.walk(ROOT):
        dns[:] = [d for d in dns if d not in SKIP_DIRS]
        for fn in fns:
            if os.path.splitext(fn)[1] in TEXT_EXT:
                yield os.path.join(dp, fn)

def signature(path):
    st = os.stat(path)
    return f"{st.st_size}:{st.st_mtime_ns}"

def check_file(path, rel, text, rep, lexer):
    ext = os.path.splitext(path)[1]
    for rx, label in SECRETS:
        if rx.search(text):
            rep.errors.append(f"{rel}: possível segredo ({label})")
    if ext == ".py":
        try:
            tree = ast.parse(text, filename=rel)
        except SyntaxError as e:
            rep.errors.append(f"{rel}:{e.lineno}: sintaxe Python: {e.msg}")
        else:
            for node in ast.walk(tree):
                if isinstance(node, ast.ExceptHandler) and len(node.body) == 1 and isinstance(node.body[0], ast.Pass):
                    rep.warnings.append(f"{rel}:{node.lineno}: exceção silenciada (except ...: pass)")
    elif ext in (".json",):
        if text.startswith("\ufeff"):
            rep.warnings.append(f"{rel}: BOM no início do JSON (quebra json.load padrão)")
        try:
            json.loads(text.lstrip("\ufeff"))
        except ValueError as e:
            rep.errors.append(f"{rel}: JSON inválido: {e}")
    elif ext in (".luau", ".lua"):
        for rx, label in LUAU_RISK:
            if rx.search(text):
                rep.warnings.append(f"{rel}: padrão de risco: {label}")
        if lexer:
            errs, _ = lexer.check_blocks(lexer.lex(text))
            for err_msg in errs:
                rep.errors.append(f"{rel}: {err_msg}")
    elif ext == ".md" and os.path.basename(path) == "SKILL.md":
        m = re.match(r"---\r?\nname: ?(.+?)\r?\n", text)
        folder = os.path.basename(os.path.dirname(path))
        if not m:
            rep.errors.append(f"{rel}: frontmatter ausente ou sem 'name'")
        elif m.group(1).strip().strip('"') != folder:
            rep.errors.append(f"{rel}: name '{m.group(1).strip()}' difere da pasta '{folder}'")
        if len(re.findall(r"^---\r?\nname:", re.sub(r"```.*?```", "", text, flags=re.S), re.M)) > 1:
            rep.errors.append(f"{rel}: frontmatter duplicado")
        if "description:" not in text.split("\n---", 2)[0]:
            rep.errors.append(f"{rel}: frontmatter sem 'description'")
    probe = re.sub(r"```.*?```|`[^`\n]*`", "", text, flags=re.S) if ext == ".md" else text  # citações em código não contam
    if ext in (".md", ".txt", ".py", ".luau", ".json") and MOJIBAKE.search(probe):
        rep.errors.append(f"{rel}: mojibake (UTF-8 lido como Latin-1)")

def run(cmd, timeout, rep, label):
    t0 = time.monotonic()
    try:
        p = subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired:
        rep.errors.append(f"{label}: estourou {timeout:.0f}s")
        return
    except FileNotFoundError:
        rep.skipped.append(f"{label}: ferramenta indisponível")
        return
    rep.notes.append(f"{label}: {time.monotonic() - t0:.2f}s, saída {p.returncode}")
    if p.returncode != 0:
        tail = (p.stdout + p.stderr).strip().splitlines()[-6:]
        rep.errors.append(f"{label} falhou: " + " | ".join(tail))

def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--level", type=int, choices=(1, 2, 3), default=1)
    ap.add_argument("--budget", type=float, default=10.0)
    ap.add_argument("--paths", nargs="*")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--no-cache", action="store_true")
    a = ap.parse_args()

    start = time.monotonic()
    deadline = None if a.level == 3 else start + a.budget
    over = lambda: deadline is not None and time.monotonic() > deadline
    rep = Report()
    cache_path = os.path.join(CACHE_DIR, "cache.json")
    cache = {}
    if os.path.isfile(cache_path) and not a.no_cache and a.level != 3:
        try:
            cache = json.load(open(cache_path, encoding="utf-8"))
        except ValueError:
            cache = {}
    lexer = load_luau_lexer()

    if a.paths:
        files = [os.path.abspath(p) for p in a.paths if os.path.isfile(p)]
    else:
        files = list(walk_files())
    changed = [f for f in files if cache.get(os.path.relpath(f, ROOT)) != signature(f)]
    total = len(files)
    clean_sigs, checked = {}, 0
    for f in changed:
        if over():
            rep.skipped.append(f"{len(changed) - checked} arquivo(s) por orçamento de tempo")
            break
        rel = os.path.relpath(f, ROOT)
        before = len(rep.errors)
        try:
            text = open(f, encoding="utf-8-sig" if f.endswith(".json") is False else "utf-8").read()
        except UnicodeDecodeError:
            rep.errors.append(f"{rel}: não é UTF-8 válido")
            checked += 1
            continue
        check_file(f, rel, text, rep, lexer)
        checked += 1
        if len(rep.errors) == before:
            clean_sigs[rel] = signature(f)

    touched = {os.path.relpath(f, ROOT).replace(os.sep, "/") for f in changed}
    # um só comando (/ROViral) em dois lugares: OpenCode e Claude Code leem pastas diferentes; o corpo tem de ser igual
    def _body(path, drop=("agent:", "argument-hint:")):
        txt = open(path, encoding="utf-8").read()
        return "\n".join(l for l in txt.splitlines() if not l.startswith(drop) and not l.startswith("> Subagente do ROViral ULTRA"))
    cmd_a, cmd_b = (os.path.join(ROOT, ".opencode", "commands", "ROViral.md"), os.path.join(ROOT, ".claude", "commands", "ROViral.md"))
    if not (os.path.isfile(cmd_a) and os.path.isfile(cmd_b)):
        rep.errors.append("comando ROViral.md ausente em .opencode/commands ou .claude/commands")
    elif _body(cmd_a) != _body(cmd_b):
        rep.errors.append("comando ROViral.md difere entre .opencode/commands e .claude/commands (só 'agent:'/'argument-hint:' podem mudar)")
    oc_agents, cc_agents = os.path.join(ROOT, ".opencode", "agents"), os.path.join(ROOT, ".claude", "agents")
    if os.path.isdir(cc_agents):
        for fn in sorted(os.listdir(cc_agents)):
            src = os.path.join(oc_agents, fn)
            if fn.endswith(".md") and os.path.isfile(src):
                strip = lambda t: re.sub(r"\A---\n.*?\n---\n", "", t, flags=re.S).strip()  # noqa: E731
                if strip(_body(src)) != strip(_body(os.path.join(cc_agents, fn))):
                    rep.warnings.append(f".claude/agents/{fn} difere do corpo de .opencode/agents/{fn} (subagente desatualizado)")
    skill_md = os.path.join(ROOT, "SKILL.md")
    if not os.path.isfile(skill_md) or "\nname: roviral-ultra\n" not in open(skill_md, encoding="utf-8").read():
        rep.errors.append("SKILL.md da raiz ausente ou sem 'name: roviral-ultra' (o Claude.ai exige)")
    if a.level >= 2:
        py = sys.executable
        jobs = []
        if a.level == 3 or any(t.startswith("gui-engine/") for t in touched):
            jobs.append(([py, "gui-engine/tools/check_luau.py"], "gui-engine: referências/blocos Luau"))
            jobs.append(([py, "gui-engine/tools/test_check_luau.py"], "gui-engine: autoteste do verificador"))
        if a.level == 3 or any(t.startswith("scripts/") for t in touched):
            jobs.append(([py, "scripts/test_decide.py"], "scripts: testes do motor de decisão"))
            jobs.append(([py, "scripts/test_viral.py"], "scripts: testes do Viral Engine"))
            jobs.append(([py, "scripts/test_tools.py"], "scripts: testes de web/imagem/rv (offline)"))
        if a.level == 3 or any(t.startswith("factory/") for t in touched):
            jobs.append(([py, "factory/build.py", "--check"], "fábrica de skills (--check)"))
        for cmd, label in jobs:
            if over():
                rep.skipped.append(f"{label}: orçamento de tempo")
                continue
            run(cmd, 60 if a.level == 3 else max(1.0, deadline - time.monotonic()), rep, label)
    if a.level == 3:
        for tool, cmd in (("ruff", ["ruff", "check", "."]), ("mypy", ["mypy", "scripts", "factory", "--ignore-missing-imports"]),
                          ("pytest", ["pytest", "-q"]), ("luau-analyze", None)):
            if shutil.which(tool) is None:
                rep.skipped.append(f"{tool}: não instalado (nada foi instalado para esta verificação)")
            elif cmd:
                run(cmd, 120, rep, tool)
            else:
                rep.skipped.append("luau-analyze: instalado, mas sem comando padrão configurado")

    if not a.no_cache and a.level != 3 and not a.paths:
        new = dict(cache)
        new.update(clean_sigs)
        os.makedirs(CACHE_DIR, exist_ok=True)
        json.dump(new, open(cache_path, "w", encoding="utf-8"))

    elapsed = time.monotonic() - start
    names = {1: "Instant Check", 2: "Targeted Check", 3: "Deep Check"}
    complete = not any("orçamento" in s for s in rep.skipped)
    never = {1: "NÃO executou: testes, requires do Luau, verificadores por módulo, Roblox Studio",
             2: "NÃO executou: Roblox Studio, análise Luau real, testes de integração/multiplayer",
             3: "NÃO executou: Roblox Studio nem testes de gameplay (sem acesso); ferramentas ausentes acima"}[a.level]
    result = {"nivel": a.level, "nome": names[a.level], "segundos": round(elapsed, 3), "arquivos_total": total,
              "arquivos_verificados": checked, "arquivos_inalterados_pulados": total - len(changed),
              "completo": complete, "erros": rep.errors, "avisos": rep.warnings, "pulados": rep.skipped,
              "notas": rep.notes, "limite": never}
    os.makedirs(CACHE_DIR, exist_ok=True)
    with open(os.path.join(CACHE_DIR, "history.jsonl"), "a", encoding="utf-8") as h:
        h.write(json.dumps({**{k: result[k] for k in ("nivel", "segundos", "arquivos_verificados", "completo")}, "erros": len(rep.errors), "t": time.strftime("%Y-%m-%dT%H:%M:%S")}) + "\n")
    if a.json:
        print(json.dumps(result, indent=2, ensure_ascii=False))
    else:
        flag = "OK" if not rep.errors else "FALHOU"
        print(f"[FastCheck] {names[a.level]}: {flag} em {elapsed:.2f}s | {checked}/{total} arquivos verificados"
              f" ({total - len(changed)} inalterados pulados) | {'completo' if complete else 'INCOMPLETO (orçamento)'}")
        for e in rep.errors[:30]:
            print("  ERRO  ", e)
        for w in rep.warnings[:15]:
            print("  aviso ", w)
        for s in rep.skipped:
            print("  pulado", s)
        print("  " + never)
    sys.exit(1 if rep.errors else 0)

if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    main()
