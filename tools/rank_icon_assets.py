#!/usr/bin/env python3
"""Packs the service ranks' icons (port/assets/firefight) for the game:

    python tools/rank_icon_assets.py

A rank's icon is two pictures drawn one over the other: its tour's shield
(rank_shields/tourNN.png, 128x128) and its rank's insignia
(rank_insignia/NAME.png, Beorn's Halo 3 UNSC insignia, 400x600 with the
insignia at its middle). Every tour has all of INSIGNIA's ranks, so 11 shields
and 42 insignia make the 462 icons; firefight_hud.c puts them together when
one is first drawn, and service_rank.c names the ranks in this order.

The insignia are made smaller here, all by one scale, so that a rank's stripes
keep their size from one rank to the next, and each gets a soft dark edge to
stand out from the shield. This writes:

    port/assets/firefight/rank_icons.bin   (tools/linux_build.py's GAME_DATA_FILES)

Its layout, little-endian: "FFRI", then 32-bit version (2), shields, insignia
and a picture's width and height; then the pictures, shields first, each pixel
a 32-bit ARGB colour whose alpha is not multiplied in.
Needs Pillow and NumPy; the builds do not, as what this writes is committed.
"""

import struct
from pathlib import Path

import numpy as np
from PIL import Image, ImageFilter

ROOT = Path(__file__).resolve().parent.parent
ASSETS = ROOT / "port/assets/firefight"
SHIELDS = ASSETS / "rank_shields"
INSIGNIA_FOLDER = ASSETS / "rank_insignia"
PACKED = ASSETS / "rank_icons.bin"

VERSION = 2
TOURS = 11
DIM = 128
# the tallest insignia, in its source picture and on the shield, and where on
# the shield the middle of an insignia goes
SOURCE_TALLEST = 510
TALLEST = 76
MIDDLE_Y = 58
EDGE_BLUR = 1.2
EDGE_ALPHA = 0.9

GRADES = {"GunnerySergeant": 4, "Lieutenant": 4, "Captain": 4, "Major": 4, "Commander": 4, "Colonel": 4,
          "Brigadier": 4, "General": 4}
INSIGNIA = ["Recruit", "Apprentice", "Apprentice_G2", "Private", "Private_G2", "Corporal", "Corporal_G2", "Sergeant",
            "Sergeant_G2", "Sergeant_G3"]
for name, grades in GRADES.items():
    INSIGNIA += [name] + [f"{name}_G{grade}" for grade in range(2, grades + 1)]


def scaled_insignia(path: Path) -> Image.Image:
    """the insignia on a transparent DIM by DIM picture, where the shield's middle is"""
    source = np.asarray(Image.open(path).convert("RGBA")).astype(np.float64)
    alpha = source[..., 3:4] / 255.0
    premultiplied = np.concatenate((source[..., :3] * alpha, source[..., 3:4]), axis=2)
    scale = TALLEST / SOURCE_TALLEST
    width, height = round(source.shape[1] * scale), round(source.shape[0] * scale)
    # (each channel on its own, as Pillow's float pictures have one)
    channels = [np.asarray(Image.fromarray(premultiplied[..., channel].astype(np.float32), "F")
                           .resize((width, height), Image.LANCZOS)) for channel in range(4)]
    small = np.clip(np.stack(channels, axis=2), 0.0, 255.0)
    alpha = small[..., 3:4] / 255.0
    small[..., :3] = np.where(alpha > 0.0, small[..., :3] / np.maximum(alpha, 1e-6), 0.0)
    picture = Image.fromarray(np.clip(small + 0.5, 0.0, 255.0).astype(np.uint8), "RGBA")

    frame = Image.new("RGBA", (DIM, DIM))
    frame.paste(picture, ((DIM - width) // 2, MIDDLE_Y - height // 2))
    edge = frame.getchannel("A").filter(ImageFilter.MaxFilter(3)).filter(ImageFilter.GaussianBlur(EDGE_BLUR))
    result = Image.new("RGBA", (DIM, DIM))
    result.putalpha(edge.point(lambda value: int(value * EDGE_ALPHA)))
    result.alpha_composite(frame)
    return result


def picture_bytes(picture: Image.Image) -> bytes:
    pixels = np.asarray(picture.convert("RGBA")).astype(np.uint32)
    argb = (pixels[..., 3] << 24) | (pixels[..., 0] << 16) | (pixels[..., 1] << 8) | pixels[..., 2]
    return argb.astype("<u4").tobytes()


def main() -> None:
    shields = [Image.open(SHIELDS / f"tour{tour:02d}.png") for tour in range(1, TOURS + 1)]
    for shield in shields:
        if shield.size != (DIM, DIM):
            raise SystemExit(f"a shield is {shield.size}, not {DIM}x{DIM}")
    insignia = [scaled_insignia(INSIGNIA_FOLDER / f"{name}.png") for name in INSIGNIA]
    packed = b"FFRI" + struct.pack("<4I", VERSION, len(shields), len(insignia), DIM)
    PACKED.write_bytes(packed + b"".join(picture_bytes(picture) for picture in shields + insignia))
    print(f"{PACKED.relative_to(ROOT)}: {len(shields)} shields, {len(insignia)} insignia")


if __name__ == "__main__":
    main()
