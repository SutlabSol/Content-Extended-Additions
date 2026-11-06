"""The emblems: emblems.bin, emblems.json and halo_emblems.h agree, the masks
unpack, and the sprite files are the ones the list names."""
import json
import re
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ASSETS = ROOT / "port/assets/emblems"
LISTS = json.loads((ASSETS / "emblems.json").read_text())
PACKED = (ASSETS / "emblems.bin").read_bytes()
HEADER = (ROOT / "port/linux/include/halo_emblems.h").read_text()
PRIMARY_ON_TOP = 0x80000000


def _define(name: str) -> int:
    return int(re.search(rf"#define {name} (\d+)", HEADER).group(1))


def _offsets() -> tuple:
    count = _define("FIREFIGHT_EMBLEM_BACKGROUND_COUNT") + 2 * _define("FIREFIGHT_EMBLEM_FOREGROUND_COUNT")
    return struct.unpack(f"<{count}I", PACKED[:count * 4])


def _unpacked_size(offset: int) -> int:
    """firefight_hud.c's ff_emblem_unpack_mask, counting"""
    done = 0
    size = _define("FIREFIGHT_EMBLEM_MASK_DIM") ** 2
    while done < size:
        control = PACKED[offset]
        if control < 128:
            done += control + 1
            offset += control + 2
        else:
            done += control - 126
            offset += 2
    return done


def test_counts_match_the_lists():
    assert _define("FIREFIGHT_EMBLEM_BACKGROUND_COUNT") == len(LISTS["backgrounds"]) + 1
    assert _define("FIREFIGHT_EMBLEM_FOREGROUND_COUNT") == len(LISTS["foregrounds"])
    assert _define("FIREFIGHT_EMBLEM_COLOR_COUNT") == len(LISTS["colors"]) == 30
    # (firefight_draw_player_emblem's key has 7 bits of foreground, 6 of background and 5 of colour)
    assert _define("FIREFIGHT_EMBLEM_FOREGROUND_COUNT") <= 128
    assert _define("FIREFIGHT_EMBLEM_BACKGROUND_COUNT") <= 64
    assert _define("FIREFIGHT_EMBLEM_COLOR_COUNT") <= 32


def test_every_mask_unpacks_to_the_full_picture():
    size = _define("FIREFIGHT_EMBLEM_MASK_DIM") ** 2
    for word in _offsets():
        offset = word & ~PRIMARY_ON_TOP
        if offset:
            assert offset < len(PACKED)
            assert _unpacked_size(offset) == size


def test_only_no_background_and_seventh_column_lack_a_mask():
    offsets = _offsets()
    backgrounds = _define("FIREFIGHT_EMBLEM_BACKGROUND_COUNT")
    assert [index for index in range(backgrounds) if not offsets[index]] == [0]
    assert all(offsets[backgrounds + 2 * index] for index in range(len(LISTS["foregrounds"])))
    missing = [LISTS["foregrounds"][index]["file"] for index in range(len(LISTS["foregrounds"]))
               if not offsets[backgrounds + 2 * index + 1]]
    assert missing == ["seventh_column"]


def test_sprite_files_are_listed_and_named_alike():
    listed = {f"{entry['file']}.png" for entry in LISTS["backgrounds"]}
    assert {path.name for path in (ASSETS / "bgs").iterdir()} == listed
    expected = {f"{entry['file']}_{layer}.png" for entry in LISTS["foregrounds"] for layer in (1, 2)}
    expected.discard("seventh_column_2.png")
    assert {path.name for path in (ASSETS / "fgs").iterdir()} == expected
    for path in [*ASSETS.glob("bgs/*"), *ASSETS.glob("fgs/*")]:
        assert re.fullmatch(r"[a-z0-9_]+\.png", path.name), path.name
