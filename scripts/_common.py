"""Utilidades compartilhadas do ROViral ULTRA (só biblioteca padrão, Python 3.8+).

- utf8_console(): evita UnicodeEncodeError ao imprimir acentos/símbolos no console do Windows (cp1252).
- ROOT / find_root(): funciona no projeto (scripts/ na raiz) e dentro do zip da skill (scripts/ dentro de roviral-ultra/).
- http_get(): GET com timeout, User-Agent, limite de tamanho, retentativa curta e cache em disco com validade.
"""
from __future__ import annotations

import hashlib
import json
import os
import sys
import time
import urllib.error
import urllib.request

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
UA = "Mozilla/5.0 (compatible; ROViral-ULTRA/2.1; +https://create.roblox.com)"
MAX_BYTES = 8 * 1024 * 1024


def utf8_console() -> None:
    for stream in (sys.stdout, sys.stderr):
        if hasattr(stream, "reconfigure"):
            stream.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]


def skill_dir() -> str:
    """A skill é a própria raiz do pacote (SKILL.md + references/ ficam na raiz)."""
    return ROOT


def cache_dir(kind: str) -> str:
    base = os.environ.get("ROVIRAL_CACHE") or os.path.join(ROOT, ".roviral", "cache")
    path = os.path.join(base, kind)
    try:
        os.makedirs(path, exist_ok=True)
    except OSError:
        import tempfile
        path = os.path.join(tempfile.gettempdir(), "roviral-cache", kind)
        os.makedirs(path, exist_ok=True)
    return path


class HttpError(Exception):
    pass


def http_get(url: str, *, timeout: float = 12.0, ttl: float = 6 * 3600, use_cache: bool = True,
             headers: dict | None = None, retries: int = 1) -> bytes:
    """GET com cache em disco. Lança HttpError com mensagem clara (nunca um traceback cru)."""
    if not url.lower().startswith(("http://", "https://")):
        raise HttpError(f"URL precisa começar com http:// ou https:// ({url})")
    key = hashlib.sha256(url.encode("utf-8")).hexdigest()[:32]
    cpath = os.path.join(cache_dir("http"), key)
    if use_cache and os.path.isfile(cpath) and time.time() - os.path.getmtime(cpath) < ttl:
        with open(cpath, "rb") as f:
            return f.read()
    req = urllib.request.Request(url, headers={"User-Agent": UA, "Accept-Language": "pt-BR,pt;q=0.9,en;q=0.8", **(headers or {})})
    last = None
    for attempt in range(retries + 1):
        try:
            with urllib.request.urlopen(req, timeout=timeout) as resp:  # noqa: S310 (só http/https, checado acima)
                data = resp.read(MAX_BYTES + 1)
            if len(data) > MAX_BYTES:
                raise HttpError(f"resposta maior que {MAX_BYTES // 1024 // 1024} MB: {url}")
            if use_cache:
                try:
                    with open(cpath, "wb") as f:
                        f.write(data)
                except OSError as e:  # cache é otimização: falhar ao gravar não pode quebrar a busca
                    print(f"aviso: cache não gravado ({e})", file=sys.stderr)
            return data
        except urllib.error.HTTPError as e:
            last = f"HTTP {e.code} em {url}"
            if e.code < 500 and e.code != 429:
                break
        except (urllib.error.URLError, TimeoutError, OSError) as e:
            last = f"sem conexão com {url}: {getattr(e, 'reason', e)}"
        if attempt < retries:
            time.sleep(0.6 * (attempt + 1))
    raise HttpError(last or f"falha ao baixar {url}")


def http_json(url: str, **kw) -> object:
    raw = http_get(url, **kw)
    try:
        return json.loads(raw.decode("utf-8", "replace"))
    except ValueError as e:
        raise HttpError(f"resposta não é JSON válido ({url}): {e}") from e


def now_iso() -> str:
    return time.strftime("%Y-%m-%d %H:%M")
