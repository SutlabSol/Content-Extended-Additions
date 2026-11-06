#!/usr/bin/env python3
"""Packs the emblems' sprites (port/assets/emblems) for the game:

    python tools/emblem_assets.py

The sprites are masks: a background (bgs/NAME.png) or a foreground's two
layers (fgs/NAME_1.png, fgs/NAME_2.png) is one flat colour whose alpha is the
shape, and firefight_hud.c tints it with the colours the player chose, from
palette.png's 30 swatches. The second layers also have black dots in their
corners, which are not part of the shape and are dropped here.

emblems.json lists the sprites and the names the menus show. An emblem's saved
choices are indexes into it, so new ones go at the end of a list. This reads it
and palette.png, and writes:

    port/assets/emblems/emblems.json   the palette's colours, added to the lists
    port/assets/emblems/emblems.bin    the masks (tools/embed_assets.py embeds it)
    port/linux/include/halo_emblems.h  the counts and each entry's index

emblems.bin is a word for each mask, background 0 first and then each
foreground's two layers, giving its offset in the file (0: it has none), then
the masks, MASK_DIM by MASK_DIM, packed by pack_mask. PRIMARY_ON_TOP is set in
the word of a foreground's first layer when that layer is drawn over its second.
Needs Pillow and NumPy; the builds do not, as what this writes is committed.
"""

import json
import re
import struct
from pathlib import Path

import numpy as np
from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
ASSETS = ROOT / "port/assets/emblems"
LIST = ASSETS / "emblems.json"
PACKED = ASSETS / "emblems.bin"
HEADER = ROOT / "port/linux/include/halo_emblems.h"
MASK_DIM = 128
# palette.png's swatches, read along its rows
PALETTE_COLUMNS = 3
COLORS = ("Steel", "Silver", "White", "Red", "Mauve", "Salmon", "Orange", "Coral", "Peach", "Gold", "Yellow", "Pale",
          "Sage", "Green", "Olive", "Teal", "Aqua", "Cyan", "Blue", "Cobalt", "Sapphire", "Violet", "Orchid", "Lavender",
          "Crimson", "Rubine", "Pink", "Brown", "Tan", "Khaki")
# in the word of a foreground's first layer in emblems.bin (primary_on_top)
PRIMARY_ON_TOP = 0x80000000
# darker than this is a second layer's corner dots, not its shape
DOT_LEVEL = 0x40


def palette() -> list:
    """palette.png's colours, each read from a swatch's corner, clear of the
    name written on it; both of a swatch's corners must agree"""
    image = Image.open(ASSETS / "palette.png").convert("RGB")
    rows = len(COLORS) // PALETTE_COLUMNS
    width, height = image.width / PALETTE_COLUMNS, image.height / rows
    colors = []
    for index in range(len(COLORS)):
        row, column = divmod(index, PALETTE_COLUMNS)
        first, last = (image.getpixel((int((column + x) * width), int((row + y) * height)))
                       for x, y in ((0.08, 0.12), (0.9, 0.88)))
        if first != last:
            raise SystemExit(f"palette.png: {COLORS[index]}'s swatch is not one colour: {first}, {last}")
        colors.append(first)
    return colors


def mask(path: Path) -> np.ndarray:
    """a sprite's shape: its alpha without the dots, at MASK_DIM by MASK_DIM"""
    pixels = np.array(Image.open(path).convert("RGBA"))
    alpha = np.where(pixels[..., :3].max(axis=2) < DOT_LEVEL, 0, pixels[..., 3]).astype(np.uint8)
    return np.array(Image.fromarray(alpha, "L").resize((MASK_DIM, MASK_DIM), Image.BOX))


def pack_mask(pixels: bytes) -> bytes:
    """the mask's bytes as runs: a control byte of 0 to 127 is that many plus
    one bytes as they are, one of 128 to 255 is the next byte repeated that
    many less 126 times (firefight_hud.c, ff_emblem_unpack_mask)"""
    output = bytearray()
    literal = bytearray()

    def flush():
        while literal:
            output.append(min(len(literal), 128) - 1)
            output.extend(literal[:128])
            del literal[:128]

    index = 0
    while index < len(pixels):
        run = 1
        while index + run < len(pixels) and pixels[index + run] == pixels[index] and run < 129:
            run += 1
        if run >= 3:
            flush()
            output += bytes((run + 126, pixels[index]))
        else:
            literal += pixels[index:index + run]
        index += run
    flush()
    return bytes(output)


def primary_on_top(first: np.ndarray, second: np.ndarray) -> bool:
    """whether a foreground's first layer goes over its second: the sprites
    do not agree on an order, but the layer more inside the other is a detail
    of it, and goes on top (the second, where they barely overlap)"""
    first, second = first > 127, second > 127
    overlap = (first & second).sum()
    return bool(overlap) and overlap / first.sum() > overlap / second.sum()


def masks(lists: dict) -> list:
    """the masks of emblems.bin, in its order: None for one there is not"""
    result = [None] + [mask(ASSETS / "bgs" / f"{entry['file']}.png") for entry in lists["backgrounds"]]
    for entry in lists["foregrounds"]:
        for layer in (1, 2):
            path = ASSETS / "fgs" / f"{entry['file']}_{layer}.png"
            result.append(mask(path) if path.is_file() else None)
    return result


def packed(lists: dict) -> bytes:
    pictures = masks(lists)
    data = [None if pixels is None else pack_mask(pixels.tobytes()) for pixels in pictures]
    offset = 4 * len(data)
    offsets = []
    for item in data:
        offsets.append(offset if item else 0)
        offset += len(item or b"")
    for index in range(len(lists["backgrounds"]) + 1, len(pictures), 2):
        if pictures[index + 1] is not None and primary_on_top(pictures[index], pictures[index + 1]):
            offsets[index] |= PRIMARY_ON_TOP
    return struct.pack(f"<{len(offsets)}I", *offsets) + b"".join(item or b"" for item in data)


def define(kind: str, name: str) -> str:
    return f"FIREFIGHT_EMBLEM_{kind}_{re.sub(r'[^A-Z0-9]+', '_', name.upper()).strip('_')}"


def header(lists: dict) -> str:
    lines = ["/* generated by tools/emblem_assets.py from port/assets/emblems: do not edit */", "",
             "#ifndef HALO_EMBLEMS_H", "#define HALO_EMBLEMS_H", "",
             f"#define FIREFIGHT_EMBLEM_MASK_DIM {MASK_DIM}",
             f"#define FIREFIGHT_EMBLEM_FOREGROUND_COUNT {len(lists['foregrounds'])}",
             f"#define FIREFIGHT_EMBLEM_BACKGROUND_COUNT {len(lists['backgrounds']) + 1}",
             f"#define FIREFIGHT_EMBLEM_COLOR_COUNT {len(COLORS)}", ""]
    lines.append(f"#define {define('BG', 'none')} 0")
    lines += [f"#define {define('BG', entry['file'])} {index}" for index, entry in enumerate(lists["backgrounds"], 1)]
    lines.append("")
    lines += [f"#define {define('FG', entry['file'])} {index}" for index, entry in enumerate(lists["foregrounds"])]
    lines.append("")
    lines += [f"#define {define('COLOR', name)} {index}" for index, name in enumerate(COLORS)]
    return "\n".join([*lines, "", "#endif", ""])


def main() -> None:
    lists = json.loads(LIST.read_text())
    lists["colors"] = [{"name": name, "rgb": "%02x%02x%02x" % color} for name, color in zip(COLORS, palette())]
    LIST.write_text(json.dumps(lists, indent=1) + "\n")
    PACKED.write_bytes(packed(lists))
    HEADER.write_text(header(lists))
    print(f"{len(lists['backgrounds'])} backgrounds, {len(lists['foregrounds'])} foregrounds, "
          f"{len(COLORS)} colours, {PACKED.stat().st_size} bytes")


if __name__ == "__main__":
    main()
