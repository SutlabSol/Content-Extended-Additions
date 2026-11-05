"""Forge's tags: the Tag Injector in Forge's menu, the default palette as a
tag pack, the TAG PROFILE screen, a Forge game's share, a saved map's bake and
its spawns and flags (port/forge, tools/content_extended_menus.py,
port/linux/game/tag_multiplayer.c, docs/tag_injector.md)."""
import re
import sys
import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

import port_settings  # noqa: E402

RUNTIME = ROOT / "port/forge/src/forge_runtime_tags.c"
HOOKS = ROOT / "port/forge/src/forge_hooks.c"
BUILDER = ROOT / "port/forge/src/forge_cache_builder.c"
MENU = "main_menu.forge_select.port.xml"


def forge_menu():
    return "\n".join(port_settings.multiplayer_files()[MENU])


def test_the_menus_are_as_the_generators_write_them():
    written = (ROOT / "port/assets/menus/ce" / MENU).read_text()
    assert written.rstrip("\n") == forge_menu().rstrip("\n")


def test_forge_lists_the_tag_injector_and_tag_options_lost_their_tag_rows():
    menu = forge_menu()
    rows = re.findall(r'forge_select/(forge_item_[a-z_]+)" y="(\d+)"', menu)
    assert [name for name, _ in rows][:5] == ["forge_item_single_player", "forge_item_multiplayer",
                                              "forge_item_edit_maps", "forge_item_tag_injector",
                                              "forge_item_tag_options"]
    assert [name for name, _ in rows][5:] == ["forge_item_reset_stock_tags", "forge_item_reset_custom_tags",
                                              "forge_item_snap_points"]
    hooks = HOOKS.read_text()
    for gone in ("forge_add_tags", "forge_installed_tag", "forge_name_tag_screen"):
        assert gone not in hooks and gone not in menu


def test_the_palette_is_the_pack_s():
    manifest = tomllib.loads((ROOT / "port/assets/tag_packs/watanoge_forge.toml").read_text())
    assert manifest["wanted"] == ["condition:forge"]
    assert '{ "forge", forge_pack_wanted }' in (ROOT / "port/linux/game/tag_pack_conditions.c").read_text()
    runtime = RUNTIME.read_text()
    assert 'tag_import_pack_open(FORGE_PACK' in runtime
    assert '#define FORGE_PACK "watanoge_forge"' in runtime
    for gone in ("forge_ensure_local_tag_cache_built", "forge_browse_for_folder", "MessageBoxA",
                 "cached_tags/xbox_cache", "scan_faber_tag_vault_into_catalog"):
        assert gone not in runtime
    # (only what reset cleans up names the old catalog)
    assert runtime.count("xbox_catalog.txt") == 1


def test_a_reader_of_a_pack_is_its_own():
    """The level's end closes the level's packs: Forge's reader keeps its own."""
    source = (ROOT / "port/linux/game/tag_import.c").read_text()
    opened = source[source.index("struct tag_import_donor *tag_import_pack_open("):]
    opened = opened[:opened.index("\n}\n")]
    assert "pack = malloc(sizeof(*pack));" in opened and "pack_named" not in opened


def test_the_profile_screen_starts_every_entry():
    hooks = HOOKS.read_text()
    assert hooks.count("forge_start_ask(widget_ptr, widget_deleted,") == 3
    assert "forge_select\\\\forge_tag_profile_screen" in hooks
    menu = forge_menu()
    assert 'name="main_menu/forge_select/forge_tag_profile_screen"' in menu
    randomizer = (ROOT / "port/linux/game/randomizer.c").read_text()
    assert '"randomizer.tag_profile"' not in randomizer
    assert "tag_injector_tags_baked_set(baked);" in randomizer
    # (a stock level and a Custom Edition one alike)
    assert randomizer.count("forge_level_tags(scenario_name, ") == 2


def test_a_forge_game_shares_all_its_tags():
    multiplayer = (ROOT / "port/linux/game/tag_multiplayer.c").read_text()
    assert "_played_forge," in multiplayer and "_share_forge," in multiplayer
    assert re.search(r"static unsigned long played_group\(.*?kind == _played_multiplayer \? WEAPON_DEFINITION_TAG : 0;",
                     multiplayer, re.S)
    limits = (ROOT / "port/linux/include/halo_port_limits.h").read_text()
    assert int(re.search(r"#define HALO_PORT_MOD_NETWORK_VERSION (\d+)", limits).group(1)) >= 10


def test_the_browsers_keep_to_forge_s_games():
    functions = (ROOT / "port/linux/game/menu_functions.c").read_text()
    # (both lists: the internet's and P2P's, and LAN's)
    assert functions.count("BROWSER_FORGE_ONLY") >= 3
    assert "network_game_client_port_advertised_version(index) == BROWSER_NETWORK_VERSION" in functions
    assert "games[read].network_version != BROWSER_NETWORK_VERSION" in functions


def test_the_bake_goes_after_the_state_and_is_named_by_it():
    """A save over a saved map strips everything from the state's offset, so
    the archive must be behind it, with a line of the state to find it by."""
    builder = BUILDER.read_text()
    trailer = builder[builder.index("static int append_forge_map_metadata_and_preview_trailer("):]
    trailer = trailer[:trailer.index("\n}\n")]
    assert trailer.index("state_foff = buf_alloc(") < trailer.index("baked_foff = buf_alloc(")
    assert '"BAKED_TAGS|00000000|%u|%s\\r\\n"' in trailer
    assert "edits && !ce_base_map" in trailer
    assert 'sscanf(line + 11, "%x|%u|%39[^\\r\\n]"' in RUNTIME.read_text()


def test_every_field_of_the_spawns_and_flags_is_saved_and_read():
    builder = BUILDER.read_text()
    runtime = RUNTIME.read_text()
    assert '"PLAYER_SPAWN|%.4f|%.4f|%.4f|%.4f|%d|%d|%d|%d|%d|%d\\r\\n"' in builder
    assert '"%f|%f|%f|%f|%d|%d|%d|%d|%d|%d"' in runtime
    assert '"NETGAME_FLAG|%.4f|%.4f|%.4f|%.4f|%d|%d|%s\\r\\n"' in builder
    assert '"%f|%f|%f|%f|%d|%d|%255[^\\r\\n]"' in runtime
    assert "PLAYER_SPAWNS_SAVED" in builder and "PLAYER_SPAWNS_SAVED" in runtime
    assert "NETGAME_FLAGS_SAVED" in builder and "NETGAME_FLAGS_SAVED" in runtime
    # (a moved object's rotation too)
    assert "forge_3d_saved_object_place(found_oidx, nx, ny, nz, nyaw, npitch, nroll);" in runtime


def test_a_host_s_spawn_line_is_never_cut_short():
    source = (ROOT / "port/forge/src/forge_network.c").read_text()
    assert '"!FH:%X:%08X:%X:%.0f:%.0f:%.0f:%d:%d:%d:%d"' in source
    assert "the host placed a tag this machine has not got" in source
