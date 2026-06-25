"""
patch_lang.py  <lang_file>  <patch_file>
Apply key=value lines from patch_file into lang_file in-place.
Keys already present are updated; missing keys are appended.
"""
import sys
from pathlib import Path


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


def parse_patch(text):
    kv = {}
    for line in text.splitlines():
        stripped = line.strip()
        if stripped == "" or stripped.startswith("#"):
            continue
        if "=" in stripped:
            key, _, value = stripped.partition("=")
            kv[key] = value
    return kv


def main():
    lang_path  = Path(sys.argv[1])
    patch_path = Path(sys.argv[2])

    header, kv, order = parse_lang(
        lang_path.read_text(encoding="utf-8", errors="replace")
    )
    patch = parse_patch(
        patch_path.read_text(encoding="utf-8", errors="replace")
    )

    changed = added = 0
    for key, val in patch.items():
        if key in kv:
            kv[key] = val
            changed += 1
        else:
            order.append(key)
            kv[key] = val
            added += 1

    lines = header + [f"{k}={kv[k]}" for k in order]
    lang_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"patch_lang: updated={changed} added={added}  [{lang_path.name}]")


if __name__ == "__main__":
    main()
