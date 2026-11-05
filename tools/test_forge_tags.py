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


def test_forge_lists_the_tag_injector_and_has_no_tag_options():
    menu = forge_menu()
    rows = re.findall(r'forge_select/(forge_item_[a-z_]+)" y="(\d+)"', menu)
    assert [name for name, _ in rows] == ["forge_item_single_player", "forge_item_multiplayer",
                                          "forge_item_edit_maps", "forge_item_tag_injector"]
    hooks = HOOKS.read_text()
    for gone in ("forge_add_tags", "forge_installed_tag", "forge_name_tag_screen", "forge_tag_options",
                 "forge_snap_points_list", "forge_reset_stock", "forge_reset_custom", "forge_tag_browser_desc"):
        assert gone not in hooks and gone not in menu


def test_a_tag_keeps_its_own_snap_points():
    """Each tag's page has the row, and its list runs on the Tag Injector's
    screen: a screen of its own would reset the Tag Injector's lists on going back."""
    functions = (ROOT / "port/linux/game/menu_functions.c").read_text()
    rows = functions[functions.index("static short tags_setting_rows(short *rows)"):]
    rows = rows[:rows.index("\n}\n")]
    assert "group == 'scen' || group == 'mach' || group == 'ctrl'" in rows
    assert "rows[count++] = _tags_setting_snap_points;" in rows
    assert "case _tags_list_snap_points: up = _tags_list_tag; break;" in functions
    assert "forge_snap_editor_open(port_tag_profiles_tag_group(" in functions
    assert "forge_snap_editor_measured(minimum, maximum);" in functions
    assert "ui_widget_port_open" not in functions[functions.index("static boolean tags_choose("):
                                                  functions.index("static boolean tags_step(")]


def test_a_stock_tag_s_snap_points_are_set_in_object_properties():
    """A stock tag has no Tag Injector page: Object Properties has its row."""
    mode = (ROOT / "port/forge/src/forge_3d_mode.c").read_text()
    assert "forge_snap_points_stock_tag(inst->group_tag, inst->tag_path, NULL, 0)" in mode
    assert "forge_snap_tag_layout_step(inst->group_tag, inst->tag_path, dir);" in mode
    assert '"SNAP POINTS:"' in mode
    assert "forge_snap_tag_layout_text(" in mode


def test_a_solo_session_on_a_multiplayer_map_asks_for_its_profile():
    """level_choose started a multiplayer map itself and returned FALSE, so
    the hook after it never opened the TAG PROFILE screen."""
    functions = (ROOT / "port/linux/game/menu_functions.c").read_text()
    choose = functions[functions.index("static boolean level_choose("):]
    choose = choose[:choose.index("\n}\n")]
    forge = choose.index("if (g_forge_session_enabled)")
    start = choose.index("campaign_start(map_name, main_get_difficulty(), controller, FALSE);")
    assert forge < start
    assert "return TRUE;" in choose[forge:start]


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
    assert "xbox_catalog.txt" not in runtime


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


def test_a_saved_map_keeps_its_firefight_markers_when_played():
    # (the saver gives them FF_SPAWN lines, not NETGAME_FLAG ones: reading only
    # those replaced the scenario's flags without them)
    builder = (ROOT / "port/forge/src/forge_cache_builder.c").read_text()
    assert '"FF_SPAWN|%.4f|%.4f|%.4f|%.4f|%d' in builder
    tags = (ROOT / "port/forge/src/forge_runtime_tags.c").read_text()
    reader = tags[tags.rindex("static void forge_saved_markers_apply(char const *text)"):]
    assert 'replace_flags && !strncmp(cur, "FF_SPAWN|", 9)' in reader
    assert "nf->type = FORGE_NETGAME_FLAG_FIREFIGHT_SPAWN;" in reader


def test_a_dropship_route_is_markers_every_machine_tells_apart():
    route = (ROOT / "port/linux/include/halo_firefight_route.h").read_text()
    engine = (ROOT / "port/forge/include/forge_engine.h").read_text()
    spawner = (ROOT / "port/linux/game/firefight_spawner.c").read_text()
    # (a route's type stays out of the spawn type cycle, and the zone's wave
    # stops short of the route id's bits)
    assert int(re.search(r"FF_ROUTE_SPAWN_TYPE = (\d+)", route).group(1)) >= \
        int(re.search(r"NUMBER_OF_FORGE_FF_SPAWN_TYPES = (\d+)", engine).group(1))
    assert "(((int)(u)) >> 8) & 0x07" in engine
    assert "if (stype == FF_ROUTE_SPAWN_TYPE)" in spawner

    # (points differ only by their usage: a spawn links to the one it asked for,
    # at each of the three places a client looks)
    network = (ROOT / "port/forge/src/forge_network.c").read_text()
    assert network.count("forge_spawn_usage_matches(cand, team_designator)") == 3
    assert '"!FU:%d:%d"' in network
    limits = (ROOT / "port/linux/include/halo_port_limits.h").read_text()
    assert int(re.search(r"#define HALO_PORT_MOD_NETWORK_VERSION (\d+)", limits).group(1)) >= 12

    # (a property change keeps the route it's on)
    forge = (ROOT / "port/forge/src/forge_3d_mode.c").read_text()
    assert "inst->team_designator = FORGE_FF_PACK_USAGE(" not in forge
