"""The service ranks' icons: rank_icons.bin is what firefight_hud.c reads, every
tour has every insignia, and service_rank.c has a name and XP for each."""
import re
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKED = (ROOT / "port/assets/firefight/rank_icons.bin").read_bytes()
HEADER = (ROOT / "port/linux/include/halo_firefight.h").read_text()
RANKS_SOURCE = (ROOT / "port/linux/game/service_rank.c").read_text()
INSIGNIA = ROOT / "port/assets/firefight/rank_insignia"
SHIELDS = ROOT / "port/assets/firefight/rank_shields"
HEADER_SIZE = 20


def _define(name: str) -> int:
    return int(re.search(rf"#define {name} (\d+)", HEADER).group(1))


def _xp_rows() -> list:
    return [[int(xp) for xp in re.findall(r"(\d+)L", row)]
            for row in re.findall(r"^\t\{ (\d+L(?:, \d+L)+) \}", RANKS_SOURCE, re.M)]


def test_file_header_and_size():
    magic, version, shields, insignia, dim = struct.unpack_from("<4s4I", PACKED)
    assert (magic, version, dim) == (b"FFRI", 2, 128)
    assert shields == _define("FIREFIGHT_SERVICE_TOURS")
    assert insignia == _define("FIREFIGHT_SERVICE_RANKS")
    assert len(PACKED) == HEADER_SIZE + (shields + insignia) * dim * dim * 4


def test_source_pictures_are_the_counted_ones():
    assert len(list(INSIGNIA.glob("*.png"))) == _define("FIREFIGHT_SERVICE_RANKS")
    assert len(list(SHIELDS.glob("tour*.png"))) == _define("FIREFIGHT_SERVICE_TOURS")


def test_every_picture_has_something_in_it():
    size = 128 * 128 * 4
    pictures = (len(PACKED) - HEADER_SIZE) // size
    for index in range(pictures):
        picture = PACKED[HEADER_SIZE + index * size:HEADER_SIZE + (index + 1) * size]
        assert any(picture[3::4]), index


def test_every_rank_has_a_name():
    block = re.search(r"s_mcc_rank_names\[.*?\{(.*?)\};", RANKS_SOURCE, re.S).group(1)
    assert len(re.findall(r'"[^"]+"', block)) == _define("FIREFIGHT_SERVICE_RANKS")


def test_every_rank_has_xp_and_it_rises():
    rows = _xp_rows()
    assert len(rows) == _define("FIREFIGHT_SERVICE_TOURS")
    for row in rows:
        assert len(row) == _define("FIREFIGHT_SERVICE_RANKS")
        assert row == sorted(row) and row[0] > 0


def test_tours_keep_the_career_xp_they_had_with_30_ranks():
    """a saved career's XP stays in the tour it was in"""
    assert [sum(row) for row in _xp_rows()] == [2039000, 3070000, 5362000, 9109000, 16584000, 26813000, 42877000,
                                                68781000, 110423000, 176465000, 821100000]
