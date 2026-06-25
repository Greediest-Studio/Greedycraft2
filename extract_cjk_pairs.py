"""
extract_cjk_pairs.py  <mod_dir>
Print key|zh_cn_value for every key in en_us.lang whose value still contains CJK.
Looks up zh_cn.lang for clean source. Output to stdout.
"""
import re, sys
from pathlib import Path

CJK = re.compile(r"[一-鿿㐀-䶿]")

def parse_lang(text):
    lines = text.splitlines()
    header, kv, order = [], {}, []
    past_header = False
    for line in lines:
        stripped = line.strip()
        if not past_header:
            if stripped == "" or stripped.startswith("#"):
                header.append(line)
                continue
            past_header = True
        if stripped.startswith("#") or stripped == "":
            continue
        if "=" in stripped:
            key, _, value = stripped.partition("=")
            if key not in kv:
                order.append(key)
            kv[key] = value
    return header, kv, order

mod_dir  = Path(sys.argv[1])
out_path = Path(sys.argv[2])
en_path  = mod_dir / "lang" / "en_us.lang"
zh_path  = mod_dir / "lang" / "zh_cn.lang"

_, en_kv, en_order = parse_lang(en_path.read_text(encoding="utf-8", errors="replace"))
_, zh_kv, _        = parse_lang(zh_path.read_text(encoding="utf-8", errors="replace"))

count = 0
lines = []
for key in en_order:
    val = en_kv[key]
    if CJK.search(val) or val.startswith("__UNTRANSLATED__"):
        zh_val = zh_kv.get(key, val.replace("__UNTRANSLATED__", ""))
        lines.append(f"{key}|||{zh_val}")
        count += 1

out_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
print(f"Wrote {count} pairs to {out_path}")
