#!/usr/bin/env python3
"""ROViral Imagem: prepara e analisa imagens para o agente VER e usar (referências, prints do Studio, thumbnails).

  python scripts/image_tool.py info img1.png img2.jpg            tamanho, formato, peso
  python scripts/image_tool.py paleta ref.png [-k 6]             cores dominantes (hex, %, papel sugerido, contraste)
  python scripts/image_tool.py preparar foto.jpg [--max 1568]    reduz/converte para leitura rápida pelo modelo
  python scripts/image_tool.py folha a.png b.png c.png -o refs.png [--colunas 3]   várias imagens em UMA (1 leitura)
  python scripts/image_tool.py comparar antes.png depois.png [-o diff.png]         % de pixels diferentes + mapa
  python scripts/image_tool.py baixar https://.../img.png [-o pasta/]               baixa imagem da web
  Use --json em qualquer comando para saída estruturada.

O script NÃO "vê" a imagem por você: ele prepara o arquivo (tamanho certo, várias numa folha, paleta exata) e você
abre o resultado com a ferramenta de leitura de arquivos (Read no Claude Code, read no OpenCode) ou o usuário anexa.
Pillow (pip install pillow) habilita todos os formatos; sem Pillow, info e paleta funcionam em PNG (decodificador próprio).
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import struct
import sys
import zlib

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from _common import HttpError, http_get, utf8_console  # noqa: E402

try:
    from PIL import Image  # type: ignore
except ImportError:  # Pillow é opcional
    Image = None

def pil_pixels(im) -> list:
    """Pixels de uma imagem Pillow (get_flattened_data no Pillow 12+, getdata nos antigos)."""
    fn = getattr(im, "get_flattened_data", None) or im.getdata
    return list(fn())


EXTS = (".png", ".jpg", ".jpeg", ".webp", ".gif", ".bmp")
VISION_MAX = 1568  # lado maior recomendado: imagens maiores custam mais tokens/tempo sem ganho de detalhe útil


class ImgError(Exception):
    pass


# ---------- PNG sem dependências (8 bits, tipos 0/2/3/4/6, não entrelaçado) ----------
def _paeth(a, b, c):
    p = a + b - c
    pa, pb, pc = abs(p - a), abs(p - b), abs(p - c)
    return a if pa <= pb and pa <= pc else (b if pb <= pc else c)


def read_png(path: str):
    """Retorna (largura, altura, lista de pixels RGB). Só para o caminho sem Pillow."""
    with open(path, "rb") as f:
        data = f.read()
    if data[:8] != b"\x89PNG\r\n\x1a\n":
        raise ImgError("não é PNG (instale Pillow para outros formatos: pip install pillow)")
    pos, idat, plte = 8, [], None
    w = h = depth = ctype = interlace = None
    while pos + 8 <= len(data):
        length, kind = struct.unpack(">I4s", data[pos:pos + 8])
        chunk = data[pos + 8:pos + 8 + length]
        pos += 12 + length
        if kind == b"IHDR":
            w, h, depth, ctype, _, _, interlace = struct.unpack(">IIBBBBB", chunk)
        elif kind == b"PLTE":
            plte = [tuple(chunk[i:i + 3]) for i in range(0, len(chunk), 3)]
        elif kind == b"IDAT":
            idat.append(chunk)
        elif kind == b"IEND":
            break
    if w is None or h is None:
        raise ImgError("PNG sem cabeçalho IHDR")
    if depth != 8 or interlace != 0 or ctype not in (0, 2, 3, 4, 6):
        raise ImgError("PNG com profundidade/entrelaçamento não suportado sem Pillow (pip install pillow)")
    bpp = {0: 1, 2: 3, 3: 1, 4: 2, 6: 4}[ctype]
    raw = zlib.decompress(b"".join(idat))
    stride = w * bpp
    prev = bytearray(stride)
    pixels: list = []
    i = 0
    for _ in range(h):
        ft = raw[i]
        line = bytearray(raw[i + 1:i + 1 + stride])
        i += 1 + stride
        for x in range(stride):
            a = line[x - bpp] if x >= bpp else 0
            b = prev[x]
            c = prev[x - bpp] if x >= bpp else 0
            if ft == 1:
                line[x] = (line[x] + a) & 255
            elif ft == 2:
                line[x] = (line[x] + b) & 255
            elif ft == 3:
                line[x] = (line[x] + ((a + b) >> 1)) & 255
            elif ft == 4:
                line[x] = (line[x] + _paeth(a, b, c)) & 255
        for x in range(0, stride, bpp):
            if ctype == 2 or ctype == 6:
                pixels.append((line[x], line[x + 1], line[x + 2]))
            elif ctype == 3:
                pixels.append(plte[line[x]] if plte and line[x] < len(plte) else (0, 0, 0))
            else:
                pixels.append((line[x],) * 3)
        prev = line
    return w, h, pixels


def load_pixels(path: str, sample: int = 160):
    """Pixels RGB reduzidos (no máximo ~sample x sample) para análise rápida."""
    if Image is not None:
        try:
            with Image.open(path) as im:
                im = im.convert("RGB")
                im.thumbnail((sample, sample))
                return im.size[0], im.size[1], pil_pixels(im)
        except Exception as e:
            raise ImgError(f"não consegui abrir {path}: {e}") from e
    w, h, px = read_png(path)
    step = max(1, int(max(w, h) / sample))
    sub = [px[y * w + x] for y in range(0, h, step) for x in range(0, w, step)]
    return max(1, w // step), max(1, h // step), sub


# ---------- paleta (k-means determinístico) ----------
def _lum(c):
    def ch(v):
        v /= 255
        return v / 12.92 if v <= 0.03928 else ((v + 0.055) / 1.055) ** 2.4
    return 0.2126 * ch(c[0]) + 0.7152 * ch(c[1]) + 0.0722 * ch(c[2])


def contrast(c1, c2) -> float:
    a, b = sorted((_lum(c1), _lum(c2)), reverse=True)
    return round((a + 0.05) / (b + 0.05), 2)


def palette(pixels, k: int = 6, iters: int = 12):
    if not pixels:
        raise ImgError("imagem vazia")
    # inicialização determinística: cores mais frequentes após quantização 4 bits por canal
    buckets: dict = {}
    for p in pixels:
        q = (p[0] >> 4, p[1] >> 4, p[2] >> 4)
        buckets[q] = buckets.get(q, 0) + 1
    seeds = [((q[0] << 4) + 8, (q[1] << 4) + 8, (q[2] << 4) + 8) for q, _ in sorted(buckets.items(), key=lambda kv: -kv[1])]
    cents: list = []
    for s in seeds:
        if all(sum((s[i] - c[i]) ** 2 for i in range(3)) > 900 for c in cents):
            cents.append(s)
        if len(cents) == k:
            break
    cents = cents or [seeds[0]]
    for _ in range(iters):
        sums: list = [[0, 0, 0, 0] for _ in cents]
        for p in pixels:
            j = min(range(len(cents)), key=lambda t: (p[0] - cents[t][0]) ** 2 + (p[1] - cents[t][1]) ** 2 + (p[2] - cents[t][2]) ** 2)
            s = sums[j]
            s[0] += p[0]
            s[1] += p[1]
            s[2] += p[2]
            s[3] += 1
        new = [(s[0] // s[3], s[1] // s[3], s[2] // s[3]) if s[3] else cents[i] for i, s in enumerate(sums)]
        if new == cents:
            break
        cents = new
    counts = [0] * len(cents)
    for p in pixels:
        counts[min(range(len(cents)), key=lambda t: (p[0] - cents[t][0]) ** 2 + (p[1] - cents[t][1]) ** 2 + (p[2] - cents[t][2]) ** 2)] += 1
    total = sum(counts) or 1
    items = sorted(((cents[i], counts[i]) for i in range(len(cents))), key=lambda x: -x[1])
    out = []
    for idx, (c, n) in enumerate(items):
        sat = (max(c) - min(c)) / 255
        role = "fundo/base" if idx == 0 else ("destaque" if sat > 0.45 and n / total < 0.2 else "secundária")
        out.append({"hex": "#%02X%02X%02X" % c, "rgb": list(c), "pct": round(100 * n / total, 1), "papel": role,
                    "contraste_branco": contrast(c, (255, 255, 255)), "contraste_preto": contrast(c, (0, 0, 0))})
    return out


# ---------- comandos ----------
def need_pil(cmd: str):
    if Image is None:
        raise ImgError(f"'{cmd}' precisa do Pillow: pip install pillow (no Linux: pip install pillow --break-system-packages)")


def cmd_info(paths):
    out = []
    for p in paths:
        d = {"arquivo": p, "bytes": os.path.getsize(p)}
        if Image is not None:
            try:
                with Image.open(p) as im:
                    d.update(largura=im.size[0], altura=im.size[1], formato=im.format, modo=im.mode)
            except Exception as e:
                d["erro"] = str(e)
        else:
            try:
                with open(p, "rb") as f:
                    head = f.read(24)
                if head[:8] == b"\x89PNG\r\n\x1a\n":
                    w, h = struct.unpack(">II", head[16:24])
                    d.update(largura=w, altura=h, formato="PNG")
                else:
                    d["aviso"] = "instale Pillow para ler dimensões de JPEG/WEBP"
            except OSError as e:
                d["erro"] = str(e)
        if d.get("largura") and max(d["largura"], d["altura"]) > VISION_MAX:
            d["dica"] = f"maior que {VISION_MAX}px: rode 'preparar' para leitura mais rápida"
        out.append(d)
    return out


def cmd_prepare(path, max_side=VISION_MAX, out=None, fmt=None):
    need_pil("preparar")
    with Image.open(path) as im:
        im.load()
        has_alpha = im.mode in ("RGBA", "LA") or "transparency" in im.info
        im = im.convert("RGBA" if has_alpha else "RGB")
        before = im.size
        im.thumbnail((max_side, max_side))
        fmt = (fmt or ("png" if has_alpha else "jpg")).lower()
        out = out or os.path.splitext(path)[0] + f".preparada.{fmt}"
        if fmt in ("jpg", "jpeg"):
            im.convert("RGB").save(out, "JPEG", quality=85, optimize=True)
        else:
            im.save(out, "PNG", optimize=True)
    return {"entrada": path, "saida": out, "antes": list(before), "depois": list(im.size), "bytes": os.path.getsize(out)}


def cmd_sheet(paths, out, cols=3, cell=512):
    need_pil("folha")
    from PIL import ImageDraw  # type: ignore
    ims = []
    for p in paths:
        with Image.open(p) as im:
            im = im.convert("RGB")
            im.thumbnail((cell, cell))
            ims.append((os.path.basename(p), im.copy()))
    cols = max(1, min(cols, len(ims)))
    rows = (len(ims) + cols - 1) // cols
    label = 22
    sheet = Image.new("RGB", (cols * cell, rows * (cell + label)), (24, 24, 28))
    draw = ImageDraw.Draw(sheet)
    for i, (name, im) in enumerate(ims):
        x, y = (i % cols) * cell, (i // cols) * (cell + label)
        sheet.paste(im, (x + (cell - im.size[0]) // 2, y + label + (cell - im.size[1]) // 2))
        draw.text((x + 6, y + 4), f"{i + 1}. {name[:40]}", fill=(235, 235, 235))
    sheet.thumbnail((VISION_MAX * 2, VISION_MAX * 2))
    sheet.save(out, "PNG", optimize=True)
    return {"saida": out, "imagens": len(ims), "tamanho": list(sheet.size)}


def cmd_compare(a, b, out=None, tol=24):
    need_pil("comparar")
    from PIL import ImageChops  # type: ignore
    with Image.open(a) as ia, Image.open(b) as ib:
        ia, ib = ia.convert("RGB"), ib.convert("RGB")
        if ia.size != ib.size:
            ib = ib.resize(ia.size)
        diff = ImageChops.difference(ia, ib).convert("L")
        mask = diff.point(lambda v: 255 if v > tol else 0)
        hist = mask.histogram()
        changed = hist[255] / max(1, ia.size[0] * ia.size[1])
        res = {"a": a, "b": b, "pixels_diferentes_pct": round(100 * changed, 2), "bbox_mudanca": list(mask.getbbox() or [])}
        if out:
            red = Image.new("RGB", ia.size, (255, 0, 64))
            Image.composite(red, ia.convert("L").convert("RGB"), mask).save(out, "PNG")
            res["mapa"] = out
    return res


def cmd_download(url, out_dir="."):
    data = http_get(url, ttl=86400)
    ext = os.path.splitext(url.split("?")[0])[1].lower()
    if ext not in EXTS:
        ext = ".png" if data[:8] == b"\x89PNG\r\n\x1a\n" else (".jpg" if data[:3] == b"\xff\xd8\xff" else ".img")
    os.makedirs(out_dir, exist_ok=True)
    name = os.path.join(out_dir, "imagem_" + hashlib.sha256(url.encode("utf-8")).hexdigest()[:10] + ext)
    with open(name, "wb") as f:
        f.write(data)
    return {"url": url, "arquivo": name, "bytes": len(data)}


def main(argv: list[str] | None = None) -> int:
    utf8_console()
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    s = sub.add_parser("info")
    s.add_argument("imagens", nargs="+")
    s = sub.add_parser("paleta")
    s.add_argument("imagem")
    s.add_argument("-k", type=int, default=6)
    s = sub.add_parser("preparar")
    s.add_argument("imagem")
    s.add_argument("--max", type=int, default=VISION_MAX)
    s.add_argument("-o", "--saida")
    s.add_argument("--formato", choices=["png", "jpg"])
    s = sub.add_parser("folha")
    s.add_argument("imagens", nargs="+")
    s.add_argument("-o", "--saida", required=True)
    s.add_argument("--colunas", type=int, default=3)
    s = sub.add_parser("comparar")
    s.add_argument("a")
    s.add_argument("b")
    s.add_argument("-o", "--saida")
    s = sub.add_parser("baixar")
    s.add_argument("url")
    s.add_argument("-o", "--pasta", default=".")
    for p in sub.choices.values():
        p.add_argument("--json", action="store_true")
    a = ap.parse_args(argv)
    try:
        for p in getattr(a, "imagens", []) + [x for x in (getattr(a, "imagem", None), getattr(a, "a", None), getattr(a, "b", None)) if x]:
            if not os.path.isfile(p):
                raise ImgError(f"arquivo não encontrado: {p}")
        if a.cmd == "info":
            res = cmd_info(a.imagens)
        elif a.cmd == "paleta":
            w, h, px = load_pixels(a.imagem)
            res = {"imagem": a.imagem, "amostra": [w, h], "cores": palette(px, max(2, min(a.k, 12)))}
        elif a.cmd == "preparar":
            res = cmd_prepare(a.imagem, max(64, a.max), a.saida, a.formato)
        elif a.cmd == "folha":
            res = cmd_sheet(a.imagens, a.saida, a.colunas)
        elif a.cmd == "comparar":
            res = cmd_compare(a.a, a.b, a.saida)
        else:
            res = cmd_download(a.url, a.pasta)
    except (ImgError, HttpError, OSError) as e:
        print(f"ERRO imagem: {e}", file=sys.stderr)
        return 2
    if a.json:
        print(json.dumps(res, ensure_ascii=False, indent=2))
    elif a.cmd == "paleta":
        print(f"paleta de {a.imagem} (amostra {res['amostra'][0]}x{res['amostra'][1]})")
        for c in res["cores"]:
            print(f"  {c['hex']}  {c['pct']:5.1f}%  {c['papel']:<10}  contraste c/ branco {c['contraste_branco']}  c/ preto {c['contraste_preto']}")
        print("Texto legível pede contraste >= 4.5 (WCAG AA). Use 3 a 5 destas cores como tema (rk-visual-direction / gui-engine).")
    else:
        for item in res if isinstance(res, list) else [res]:
            print("  ".join(f"{k}={v}" for k, v in item.items()))
        if a.cmd in ("preparar", "folha", "baixar"):
            print("Próximo passo: abra o arquivo de saída com a ferramenta de leitura de arquivos para VER a imagem.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
