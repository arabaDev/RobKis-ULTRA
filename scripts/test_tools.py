#!/usr/bin/env python3
"""Testes offline de web.py, roblox_game.py, image_tool.py, rv.py e _common.py (sem internet).
Rode: python scripts/test_tools.py   (funciona com e sem Pillow; sem Pillow testa o decodificador PNG próprio)"""
from __future__ import annotations

import io
import json
import os
import shutil
import struct
import subprocess
import sys
import tempfile
import threading
import zlib
from contextlib import redirect_stdout
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

for _s in (sys.stdout, sys.stderr):
    if hasattr(_s, "reconfigure"):
        _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
TMP = tempfile.mkdtemp(prefix="roviral-test-")
os.environ["ROVIRAL_CACHE"] = os.path.join(TMP, "cache")
for k in ("no_proxy", "NO_PROXY"):
    os.environ[k] = "127.0.0.1,localhost," + os.environ.get(k, "")

import _common  # noqa: E402
import image_tool  # noqa: E402
import roblox_game  # noqa: E402
import rv  # noqa: E402
import web  # noqa: E402

FAILS: list[str] = []


def check(cond, msg):
    print(("ok     " if cond else "FALHOU ") + msg)
    if not cond:
        FAILS.append(msg)


def quiet(fn, *a, **kw):
    buf = io.StringIO()
    with redirect_stdout(buf):
        try:
            code = fn(*a, **kw)
        except SystemExit as e:
            code = e.code
    return code, buf.getvalue()


# ---------- web: parsers ----------
page = """<html><head><title> Página  Teste </title><style>.x{}</style><script>alert(1)</script></head>
<body><h1>Título</h1><p>Olá <b>mundo</b> &amp; amigos</p><ul><li>um</li><li>dois</li></ul>
<a href="/docs/a">Doc A</a> <a href="#topo">topo</a> <a href="https://ex.com/b">B</a></body></html>"""
r = web.html_to_text(page, "https://site.com/x/y")
check(r["titulo"] == "Página Teste", "html: título limpo")
check("alert" not in r["texto"] and ".x{}" not in r["texto"], "html: script/style removidos")
check("# Título" in r["texto"] and "- um" in r["texto"] and "Olá mundo & amigos" in r["texto"], "html: cabeçalhos, listas e entidades")
check([lk["url"] for lk in r["links"]] == ["https://site.com/docs/a", "https://ex.com/b"], "html: links absolutos, âncoras ignoradas")
check(web.html_to_text("<p>quebrado <b><i>sem fechar")["texto"].startswith("quebrado"), "html: HTML malformado não quebra")
check(web.decode("<meta charset='iso-8859-1'>ação".encode("latin-1")).endswith("ação"), "decode respeita charset declarado")

ddg = """<div class="result"><a class="result__a" href="//duckduckgo.com/l/?uddg=https%3A%2F%2Fcreate.roblox.com%2Fdocs%2Fdiscovery&rut=x">Discovery &amp; recs</a>
<a class="result__snippet" href="#">Como o <b>Roblox</b> recomenda</a></div>
<div class="result"><a class="result__a" href="https://devforum.roblox.com/t/1">DevForum</a><div class="result__snippet">post</div></div>"""
res = web.parse_results("ddg", ddg, 5)
check(len(res) == 2 and res[0]["url"] == "https://create.roblox.com/docs/discovery" and res[0]["titulo"] == "Discovery & recs", "busca ddg: redirect desembrulhado")
check(res[0]["trecho"] == "Como o Roblox recomenda", "busca ddg: trecho")
bing = """<ol><li class="b_algo"><h2><a href="https://rowatcher.com/x">RoWatcher top</a></h2><div><p>Ranking ao vivo</p></div></li>
<li class="b_algo"><h2><a href="https://rowatcher.com/x">dup</a></h2></li></ol>"""
res = web.parse_results("bing", bing, 5)
check(len(res) == 1 and res[0]["titulo"] == "RoWatcher top" and res[0]["trecho"] == "Ranking ao vivo", "busca bing: resultado e deduplicação")


# ---------- _common.http_get com servidor local ----------
class H(BaseHTTPRequestHandler):
    hits = 0

    def do_GET(self):
        H.hits += 1
        if self.path.startswith("/ok"):
            body = "<html><title>Local</title><p>conteúdo ç</p></html>".encode("utf-8")
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.end_headers()
            self.wfile.write(body)
        else:
            self.send_response(404)
            self.end_headers()

    def log_message(self, *a):
        pass


srv = ThreadingHTTPServer(("127.0.0.1", 0), H)
threading.Thread(target=srv.serve_forever, daemon=True).start()
base = f"http://127.0.0.1:{srv.server_address[1]}"
try:
    d1 = _common.http_get(base + "/ok")
    d2 = _common.http_get(base + "/ok")
    check(d1 == d2 and H.hits == 1, "http_get: cache evita segunda requisição")
    _common.http_get(base + "/ok", use_cache=False)
    check(H.hits == 2, "http_get: --sem-cache busca de novo")
    try:
        _common.http_get(base + "/nao-existe")
        check(False, "http_get: 404 vira HttpError")
    except _common.HttpError as e:
        check("HTTP 404" in str(e), "http_get: 404 vira HttpError legível")
    code, out = quiet(web.main, ["ler", base + "/ok", "--json"])
    check(code == 0 and json.loads(out)["titulo"] == "Local", "web ler: CLI ponta a ponta (JSON)")
finally:
    srv.shutdown()
try:
    _common.http_get("file:///etc/passwd")
    check(False, "http_get recusa esquemas não http")
except _common.HttpError:
    check(True, "http_get recusa esquemas não http")
try:
    _common.http_get("http://127.0.0.1:1/", timeout=2, retries=0, use_cache=False)
    check(False, "sem conexão vira HttpError")
except _common.HttpError as e:
    check("sem conexão" in str(e), "sem conexão vira HttpError legível")

# ---------- roblox_game ----------
P = roblox_game.parse_place_id
check(P("https://www.roblox.com/games/920587237/Adopt-Me") == 920587237 and P("920587237") == 920587237
      and P("https://www.roblox.com/games/start?placeId=123456") == 123456 and P("abc") is None, "roblox: extrai placeId de links e números")
import datetime as dt  # noqa: E402

games = {"data": [{"id": 77, "rootPlaceId": 920587237, "name": "Jogo X", "description": "  desc   longa ",
                   "creator": {"name": "Estúdio", "type": "Group"}, "playing": 12345, "visits": 1000000,
                   "favoritedCount": 5000, "created": "2026-01-01T10:00:00.000Z", "updated": "2026-10-20T10:00:00Z",
                   "genre": "All", "maxPlayers": 12}]}
votes = {"data": [{"id": 77, "upVotes": 900, "downVotes": 100}]}
rep = roblox_game.build_report(games, votes, today=dt.datetime(2026, 10, 26))
g = rep[0]
check(g["aprovacao_pct"] == 90.0 and g["dias_desde_criacao"] == 298 and g["visitas_por_dia_media"] == round(1000000 / 298), "roblox: métricas derivadas")
check(g["dias_desde_atualizacao"] == 6 and g["descricao"] == "desc longa" and g["link"].endswith("/920587237"), "roblox: datas, descrição e link")
check(roblox_game.build_report({"data": [{"id": 1}]}, {})[0]["aprovacao_pct"] is None, "roblox: campos ausentes não quebram")

png1 = io.BytesIO()
fake_png = b"\x89PNG\r\n\x1a\n" + b"0" * 20


def fake_json(url, **kw):
    if "universes/v1/places" in url:
        return {"universeId": 77}
    if "games/votes" in url:
        return votes
    if "v1/games?" in url:
        return games
    if "games/icons" in url:
        return {"data": [{"targetId": 77, "imageUrl": "https://img/icon.png"}]}
    if "multiget/thumbnails" in url:
        return {"data": [{"universeId": 77, "thumbnails": [{"imageUrl": "https://img/t1.png"}]}]}
    raise _common.HttpError("inesperado " + url)


roblox_game.http_json, roblox_game.http_get = fake_json, (lambda url, **kw: fake_png)
imgdir = os.path.join(TMP, "img")
code, out = quiet(roblox_game.main, ["https://www.roblox.com/games/920587237/x", "--imagens", imgdir, "--json"])
data = json.loads(out) if code == 0 else {}
check(code == 0 and data["jogos"][0]["nome"] == "Jogo X", "roblox: CLI ponta a ponta com API simulada")
check(len(os.listdir(imgdir)) == 2, "roblox: ícone + thumbnail baixados para ver")
code, out = quiet(roblox_game.main, ["https://www.roblox.com/games/920587237/x"])
check(code == 0 and "| Jogo X | 12.345 |" in out, "roblox: tabela legível")
code, _ = quiet(roblox_game.main, ["nada-aqui"])
check(code == 2, "roblox: entrada inválida sai com código 2, sem traceback")

# ---------- image_tool ----------


def write_png(path, w, h, color_fn, ctype=2):
    rows = b""
    for y in range(h):
        row = bytearray([0])
        for x in range(w):
            c = color_fn(x, y)
            row += bytes(c[:3] if ctype == 2 else c)
        rows += bytes(row)

    def chunk(t, d):
        return struct.pack(">I", len(d)) + t + d + struct.pack(">I", zlib.crc32(t + d) & 0xFFFFFFFF)
    with open(path, "wb") as f:
        f.write(b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, ctype, 0, 0, 0))
                + chunk(b"IDAT", zlib.compress(rows)) + chunk(b"IEND", b""))


two = os.path.join(TMP, "duas_cores.png")
write_png(two, 40, 20, lambda x, y: (230, 40, 40) if x < 30 else (20, 60, 200))
w, h, px = image_tool.read_png(two)
check((w, h, len(px)) == (40, 20, 800) and px[0] == (230, 40, 40) and px[-1] == (20, 60, 200), "png próprio: decodifica RGB")
pal = image_tool.palette(px, 4)
check(pal[0]["hex"] == "#E62828" and abs(pal[0]["pct"] - 75.0) < 0.1 and pal[1]["hex"] == "#143CC8", "paleta: cores e proporções exatas")
check(image_tool.contrast((255, 255, 255), (0, 0, 0)) == 21.0, "contraste WCAG preto/branco = 21")
rgba = os.path.join(TMP, "rgba.png")
write_png(rgba, 8, 8, lambda x, y: (10, 200, 10, 128), ctype=6)
check(image_tool.read_png(rgba)[2][5] == (10, 200, 10), "png próprio: RGBA")
saved = image_tool.Image
image_tool.Image = None
check(len(image_tool.load_pixels(two)[2]) > 0, "sem Pillow: paleta funciona em PNG")
try:
    image_tool.cmd_prepare(two)
    check(False, "sem Pillow: preparar avisa como instalar")
except image_tool.ImgError as e:
    check("pip install pillow" in str(e), "sem Pillow: preparar avisa como instalar")
image_tool.Image = saved
code, out = quiet(image_tool.main, ["paleta", two, "-k", "3", "--json"])
check(code == 0 and json.loads(out)["cores"][0]["hex"] == "#E62828", "img paleta: CLI")
code, _ = quiet(image_tool.main, ["info", os.path.join(TMP, "nao_existe.png")])
check(code == 2, "img: arquivo inexistente sai com código 2")
if image_tool.Image is not None:
    from PIL import Image  # type: ignore
    big = os.path.join(TMP, "grande.jpg")
    im = Image.new("RGB", (3000, 1500), (90, 140, 60))
    for x in range(0, 3000, 7):
        for y in range(0, 1500, 50):
            im.putpixel((x, y), (255, 255, 255))
    im.save(big, "JPEG")
    pr = image_tool.cmd_prepare(big)
    check(max(pr["depois"]) == 1568 and os.path.isfile(pr["saida"]), "preparar: reduz para 1568 px")
    filt = os.path.join(TMP, "filtros.png")
    Image.new("RGB", (64, 64)).save(filt)
    grad = Image.new("RGB", (64, 64))
    grad.putdata([(x * 4 % 256, y * 4 % 256, (x * y) % 256) for y in range(64) for x in range(64)])
    grad.save(filt, "PNG", optimize=True)
    check(image_tool.read_png(filt)[2] == image_tool.pil_pixels(grad), "png próprio = Pillow em PNG com filtros adaptativos")
    sh = image_tool.cmd_sheet([two, rgba, big], os.path.join(TMP, "folha.png"), 2)
    check(sh["imagens"] == 3 and os.path.isfile(sh["saida"]), "folha: várias imagens numa só")
    other = os.path.join(TMP, "outra.png")
    write_png(other, 40, 20, lambda x, y: (230, 40, 40) if x < 20 else (20, 60, 200))
    cmp_ = image_tool.cmd_compare(two, other, os.path.join(TMP, "diff.png"))
    check(abs(cmp_["pixels_diferentes_pct"] - 25.0) < 0.1 and os.path.isfile(cmp_["mapa"]), "comparar: % de pixels alterados exato")
else:
    print("pulado (sem Pillow): preparar/folha/comparar")

# ---------- rv ----------
code, out = quiet(rv.main, ["brief", "me dá 5 ideias virais de terror"])
check(code == 0 and "## leitura" in out and "idea-engine.md" in out and "rv.py ideias" in out, "rv brief: decisão + leitura + comandos numa chamada")
check(len(out) < 12000, f"rv brief: saída compacta ({len(out)} caracteres)")
code, out = quiet(rv.main, ["brief", "faça a gui igual a esta imagem", "--imagens"])
check("vision.md" in out and "img paleta" in out, "rv brief --imagens: guia de visão e paleta")
code, out = quiet(rv.main, ["ideias", "-n", "2", "--seed", "1"])
check(code == 0 and "Semente 2" in out, "rv ideias: repassa para idea_forge")
code, _ = quiet(rv.main, ["inexistente"])
check(code == 2, "rv: comando desconhecido sai com código 2")
check(rv.essentials(os.path.join(_common.skill_dir(), "references", "viral-scorecard.md")).count("\n") > 3, "rv: resumo de referência não vazio")

# ---------- console Windows (cp1252) ----------
env = dict(os.environ, PYTHONIOENCODING="cp1252")
bad = []
for cmd in (["rv.py", "brief", "ideias virais de pets com loja"], ["idea_forge.py", "-n", "3", "--seed", "2"],
            ["viral_score.py", "--modelo"], ["decide.py", "jogo de terror com loja"], ["image_tool.py", "paleta", two],
            ["skill_search.py", "inventário", "loja"], ["web.py", "--help"], ["roblox_game.py", "--help"]):
    p = subprocess.run([sys.executable, os.path.join(HERE, cmd[0])] + cmd[1:], capture_output=True, env=env, check=False)
    if p.returncode != 0 or b"UnicodeEncodeError" in p.stderr:
        bad.append(cmd[0])
check(not bad, "console cp1252 (Windows) sem UnicodeEncodeError" + (f": falhou {bad}" if bad else ""))

shutil.rmtree(TMP, ignore_errors=True)
print("\n" + ("todos passaram" if not FAILS else f"{len(FAILS)} falha(s)"))
sys.exit(1 if FAILS else 0)
