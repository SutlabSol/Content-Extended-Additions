#!/usr/bin/env python3
"""Makes the game's icons from ContentEvolved.png:

    python tools/app_icon.py

- opence-icon.png: the Windows executable icon, desktop window icon and web
    icons, including the tab, installed web app and home screen;
- opence-icon-render.png (1024x1024): the white mark cropped to transparency
    with safe margins, for Android's adaptive foreground and monochrome layers;
- port/switch/art/icon.JPG and port/ps5/sce_sys/icon0.png: the console icons.

The launcher icon is an adaptive one (Android 8 and later): the render as its
foreground layer, the background's gradient as its background layer, and the
render's light parts (the armour, not the visor) as its monochrome (themed
icon) layer. Launchers mask adaptive icons to their own shapes and show only
the middle 72 dp of the 108 dp layers, so the render fills those 72 dp, as
the picture fills the other icons, and its edges are carried out to the
layers' edges for the launchers that move the layers. Writes the layers for
every screen density into port/android/app/src/main/res (mipmap-*), and the
icon's definition (mipmap-anydpi-v26/ic_launcher.xml) and background
(drawable/ic_launcher_background.xml). Run it again when the artwork
changes. Needs Pillow and NumPy.
"""

from pathlib import Path

import numpy as np
from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
ARTWORK = ROOT / "port/assets/icon"
SOURCE_ICON = ROOT / "ContentEvolved.png"
ICON = ARTWORK / "opence-icon.png"
RENDER = ARTWORK / "opence-icon-render.png"
WINDOW_ICON = ARTWORK / "opence-icon-256.png"
WINDOWS_ICON = ROOT / "port/windows/opence-icon.ico"
SWITCH_ICON = ROOT / "port/switch/art/icon.jpg"
PS5_ICON = ROOT / "port/ps5/sce_sys/icon0.png"
RESOURCES = ROOT / "port/android/app/src/main/res"

# the layers' size, and the part of them a launcher shows, in dp
LAYER_DP = 108
VISIBLE_DP = 72
# pixels per dp of each density
DENSITIES = {"mdpi": 1.0, "hdpi": 1.5, "xhdpi": 2.0, "xxhdpi": 3.0, "xxxhdpi": 4.0}
WINDOWS_SIZES = [16, 20, 24, 32, 40, 48, 64, 128, 256]
# the web page's: its tab's (32), iOS's home screen's (180) and the web app
# manifest's (192, 512)
WEB_ICONS = ROOT / "port/web/site/icons"
WEB_SIZES = [32, 180, 192, 512]


def background_gradient(icon: Image.Image) -> tuple:
    """The solid background color at the four outside corners of the master."""
    pixels = np.asarray(icon.convert("RGB"), dtype=np.float64)
    corners = np.array([pixels[0, 0], pixels[0, -1], pixels[-1, 0], pixels[-1, -1]])
    color = tuple(int(round(channel)) for channel in np.median(corners, axis=0))
    return color, color


def carried_out(image: Image.Image, size: int) -> Image.Image:
    """image in the middle of a square of size, its edge pixels carried out
    to the square's edges"""
    pad = (size - image.width) // 2
    data = np.asarray(image)
    padded = np.pad(data, ((pad, size - image.height - pad), (pad, size - image.width - pad), (0, 0)), mode="edge")
    return Image.fromarray(padded, "RGBA")


def monochrome(render: Image.Image) -> Image.Image:
    """the render's light parts, white with their lightness as opacity: the
    armour without the darker visor"""
    data = np.asarray(render, dtype=np.float64)
    lightness = (0.2126 * data[..., 0] + 0.7152 * data[..., 1] + 0.0722 * data[..., 2]) / 255.0
    alpha = np.clip(data[..., 3] / 255.0 * np.clip((lightness - 0.25) / 0.5, 0.0, 1.0), 0.0, 1.0)
    out = np.zeros(data.shape, dtype=np.uint8)
    out[..., :3] = 255
    out[..., 3] = np.round(alpha * 255).astype(np.uint8)
    return Image.fromarray(out, "RGBA")


def transparent_mark(icon: Image.Image) -> Image.Image:
    """Remove the flat green canvas and frame the mark for an adaptive icon."""
    pixels = np.asarray(icon.convert("RGBA"), dtype=np.float64)
    corners = np.array([pixels[0, 0, :3], pixels[0, -1, :3], pixels[-1, 0, :3], pixels[-1, -1, :3]])
    background = np.median(corners, axis=0)
    foreground = np.clip((pixels[..., :3] - background) / (255.0 - background), 0.0, 1.0)
    alpha = np.round(np.mean(foreground, axis=2) * 255).astype(np.uint8)
    output = np.full(pixels.shape, 255, dtype=np.uint8)
    output[..., 3] = alpha
    mark = Image.fromarray(output, "RGBA")
    bounds = mark.getchannel("A").getbbox()
    if bounds is None:
        raise ValueError(f"{SOURCE_ICON.name} has no visible mark")
    cropped = mark.crop(bounds)
    padding = round(max(cropped.size) * 0.1)
    side = max(cropped.size) + padding * 2
    framed = Image.new("RGBA", (side, side), (255, 255, 255, 0))
    framed.alpha_composite(cropped, ((side - cropped.width) // 2, (side - cropped.height) // 2))
    return framed


def web_icons(icon: Image.Image) -> None:
    WEB_ICONS.mkdir(parents=True, exist_ok=True)
    for size in WEB_SIZES:
        icon.resize((size, size), Image.LANCZOS).save(WEB_ICONS / f"icon-{size}.png", optimize=True)
    print(f"{WEB_ICONS.relative_to(ROOT)}: {', '.join(str(size) for size in WEB_SIZES)}")


def main() -> None:
    source = Image.open(SOURCE_ICON).convert("RGBA")
    if source.width != source.height:
        raise ValueError(f"{SOURCE_ICON.name} must be square")
    icon = source.resize((512, 512), Image.LANCZOS)
    render = transparent_mark(icon).resize((1024, 1024), Image.LANCZOS)
    ARTWORK.mkdir(parents=True, exist_ok=True)
    icon.save(ICON, optimize=True)
    render.save(RENDER, optimize=True)
    print(f"{ICON.relative_to(ROOT)} and {RENDER.relative_to(ROOT)}: 512x512")

    # the desktop's icons
    icon.resize((256, 256), Image.LANCZOS).save(WINDOW_ICON, optimize=True)
    print(f"{WINDOW_ICON.relative_to(ROOT)}: 256x256")
    icon.save(WINDOWS_ICON, sizes=[(size, size) for size in WINDOWS_SIZES])
    print(f"{WINDOWS_ICON.relative_to(ROOT)}: {', '.join(str(size) for size in WINDOWS_SIZES)}")
    web_icons(icon)

    icon.resize((256, 256), Image.LANCZOS).convert("RGB").save(SWITCH_ICON, quality=95, optimize=True)
    print(f"{SWITCH_ICON.relative_to(ROOT)}: 256x256")
    icon.save(PS5_ICON, optimize=True)
    print(f"{PS5_ICON.relative_to(ROOT)}: 512x512")

    # the launcher's layers
    themed = monochrome(render)
    for density, scale in DENSITIES.items():
        size = round(LAYER_DP * scale)
        visible = round(VISIBLE_DP * scale)
        directory = RESOURCES / f"mipmap-{density}"
        directory.mkdir(parents=True, exist_ok=True)
        for name, layer in (("ic_launcher_foreground", render), ("ic_launcher_monochrome", themed)):
            carried_out(layer.resize((visible, visible), Image.LANCZOS), size).save(
                directory / f"{name}.png", optimize=True)
        print(f"{directory.relative_to(ROOT)}: {size}x{size}")

    top, bottom = background_gradient(icon)
    drawable = RESOURCES / "drawable"
    drawable.mkdir(parents=True, exist_ok=True)
    (drawable / "ic_launcher_background.xml").write_text(
        '<?xml version="1.0" encoding="utf-8"?>\n'
        "<!-- the launcher icon's background (tools/app_icon.py) -->\n"
        '<shape xmlns:android="http://schemas.android.com/apk/res/android">\n'
        '    <gradient android:angle="270" android:startColor="#{:02X}{:02X}{:02X}"'
        ' android:endColor="#{:02X}{:02X}{:02X}" />\n'.format(*top, *bottom) +
        "</shape>\n", encoding="utf-8")
    adaptive = RESOURCES / "mipmap-anydpi-v26"
    adaptive.mkdir(parents=True, exist_ok=True)
    (adaptive / "ic_launcher.xml").write_text(
        '<?xml version="1.0" encoding="utf-8"?>\n'
        "<!-- the launcher icon (tools/app_icon.py, from port/assets/icon) -->\n"
        '<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">\n'
        '    <background android:drawable="@drawable/ic_launcher_background" />\n'
        '    <foreground android:drawable="@mipmap/ic_launcher_foreground" />\n'
        '    <monochrome android:drawable="@mipmap/ic_launcher_monochrome" />\n'
        "</adaptive-icon>\n", encoding="utf-8")
    print("background #{:02X}{:02X}{:02X} to #{:02X}{:02X}{:02X}".format(*top, *bottom))


if __name__ == "__main__":
    main()
