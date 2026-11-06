"""The campaign randomizer's menus, as tools/port_settings.py writes them."""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

import port_settings  # noqa: E402


def test_randomizer_menus():
    """Gameplay has the switch, and difficulty opens a screen for the setup."""
    files = port_settings.settings_files()
    gameplay = "\n".join(files[
        "main_menu.settings_select.player_setup.player_profile_edit.gameplay.xml"])
    settings = "\n".join(files[
        "main_menu.settings_select.player_setup.player_profile_edit.gameplay.randomizer.xml"])
    screen = "\n".join(files["main_menu.difficulty_select.randomizer.xml"])

    # (Gameplay's Randomizer row opens its screen: the switch and Go Crazy)
    assert 'open="main_menu/settings_select/player_setup/player_profile_edit/gameplay/randomizer/randomizer_settings_screen"' in gameplay
    assert 'setting="game.randomizer"' in settings
    assert "RANDOMIZER:" in settings
    assert 'setting="game.randomizer_crazy"' in settings
    assert 'setting="game.randomizer_crazy"' not in screen
    # (Go Crazy's parts, which the screen shows only with it on)
    assert 'input="gameplay screen update"' in settings
    for setting in (
        "game.randomizer_crazy_weapons",
        "game.randomizer_crazy_enemies",
        "game.randomizer_crazy_flamethrower",
        "game.randomizer_crazy_pods",
    ):
        assert f'setting="{setting}"' in settings
        assert f'setting="{setting}"' not in screen
    assert 'values="10|20|30|40|50|60|70|80|90|100"' in settings
    # (Go Crazy's CUSTOM TAGS is gone: the profile screen before the
    # randomizer's chooses the Tag Injector's tags)
    assert "game.randomizer_crazy_custom_tags" not in settings
    for setting in (
        "game.randomizer_enemies",
        "game.randomizer_allies",
        "game.randomizer_pickups",
        "game.randomizer_enemy_weapons",
        "game.randomizer_pool",
        "game.randomizer_type",
        "game.randomizer_grunt_rank",
        "game.randomizer_elite_rank",
        "game.randomizer_jackal_rank",
        "game.randomizer_hunter_rank",
        "game.randomizer_flood_combat_rank",
        "game.randomizer_pickup_pool",
        "game.randomizer_pickup_type",
        "game.randomizer_weapon_pool",
        "game.randomizer_weapon_type",
    ):
        assert f'setting="{setting}"' in screen
    assert 'values="any|covenant|flood|human|one|tag_injector"' in screen
    assert 'values="any|covenant|human|precision|automatic|power|one|tag_injector"' in screen
    assert 'run="randomizer profile save"' in screen
    # (the code goes back from Load's screen itself: not while DELETE is on)
    assert 'run="randomizer profile load"' in screen and 'run="randomizer profile load" back=' not in screen
    assert 'open="main_menu/difficulty_select/randomizer/profiles_screen"' in screen
    assert 'run="randomizer start"' in screen
    assert 'input="randomizer screen update"' in screen and 'input="randomizer hub update"' in screen
    assert 'input="randomizer profiles update"' in screen
    assert 'run="randomizer profile delete"' in screen
    assert 'run="randomizer profiles delete mode"' in screen and 'run="randomizer profiles init"' in screen
    assert 'name="main_menu/difficulty_select/randomizer/profiles_button_delete"' in screen
    # (the Tag Injector profile's custom types: rows the code fills)
    for key in ("custom_type", "pickup_custom", "weapon_custom"):
        assert f'name="main_menu/difficulty_select/randomizer/{key}_value"' in screen
    assert 'run="randomizer custom left"' in screen and 'run="randomizer custom right"' in screen
    # (the profile screen before it)
    assert 'name="main_menu/difficulty_select/randomizer/tag_profile_screen"' in screen
    assert 'input="randomizer tag profiles update"' in screen
    assert 'run="randomizer tag profile choose"' in screen
    # every spinner's arrows in the same place
    assert len(set(re.findall(r'footer_bounds="([^"]*)"', screen))) == 1
    for index in range(8):
        assert f'name="main_menu/difficulty_select/randomizer/profile_{index}"' in screen
    for index in range(port_settings.RANDOMIZER_TAG_PROFILE_ROWS):
        assert f'name="main_menu/difficulty_select/randomizer/tag_profile_{index}"' in screen
    source = (ROOT / "port/linux/game/menu_functions.c").read_text()
    assert f"#define RANDOMIZER_TAG_PROFILE_ROWS {port_settings.RANDOMIZER_TAG_PROFILE_ROWS}" in source
    assert '"tag_profile_"' in source and '"tag_profile_%d"' in source


def test_randomizer_functions_are_listed():
    """Each function and input the randomizer's screens name is one
    menu_tags.c lists and menu_functions.c runs."""
    screen = "\n".join(port_settings.settings_files()["main_menu.difficulty_select.randomizer.xml"])
    tags = (ROOT / "port/linux/game/menu_tags.c").read_text()
    functions = (ROOT / "port/linux/game/menu_functions.c").read_text()
    names = set(re.findall(r'(?:run|input)="(randomizer [^"]+)"', screen))
    assert names
    for name in names:
        assert f'"{name}"' in tags, name
        assert f'"{name}"' in functions, name


def test_randomizer_rows_match_the_screen_code():
    """menu_functions.c shows each row of RANDOMIZER_ROWS by its name, in order."""
    source = (ROOT / "port/linux/game/menu_functions.c").read_text()
    names = [f'"op_{key}"' for key, *_ in port_settings.RANDOMIZER_ROWS]
    places = [source.index(name) for name in names]
    assert places == sorted(places)
    # (a saved setup's fields: the rows', Go Crazy's, once the last, unread,
    # and PLAYER LOADOUT's three, of a page of their own. A setting added goes
    # last, so a setup saved before it reads as it was)
    loadout = ["game.randomizer_loadout", "game.randomizer_loadout_primary", "game.randomizer_loadout_secondary"]
    allies = [setting for key, _, setting, *_ in port_settings.RANDOMIZER_ROWS if key.startswith("ally_")]
    assert len(allies) == 8
    assert f"#define RANDOMIZER_KEY_COUNT {len(names) + 1 + len(loadout)}" in source
    assert f"#define RANDOMIZER_ROW_COUNT {len(names)}" in source
    keys = source[source.index("randomizer_keys[RANDOMIZER_KEY_COUNT] ="):]
    keys = re.findall(r'^\t"([^"]*)",', keys[:keys.index("};")], re.M)
    assert len(keys) == len(names) + 1 + len(loadout) and keys[15] == ""
    assert keys[20:23] == loadout and sorted(keys[23:]) == sorted(allies)
    assert sorted(key for key in keys if key) == sorted(
        [setting for _, _, setting, *_ in port_settings.RANDOMIZER_ROWS] + loadout)
    for key, _, setting, *_ in port_settings.RANDOMIZER_ROWS:
        assert f'"{setting}"' in (ROOT / "port/linux/src/port_config.c").read_text()


def test_crazy_rows_match_the_screen_code():
    """menu_functions.c hides Go Crazy's parts by their rows' names, each a
    setting of port_config.c's."""
    source = (ROOT / "port/linux/game/menu_functions.c").read_text()
    config = (ROOT / "port/linux/src/port_config.c").read_text()
    for _, setting, _, _, _, *named in port_settings.SCREENS["gameplay/randomizer"]["rows"]:
        assert f'"{setting}"' in config
        if setting.startswith("game.randomizer_crazy_"):
            assert f'"op_{named[0] if named else setting.split(".", 1)[1]}"' in source


def test_widget_names_fit():
    """A widget's name is a tag's char[32] (menu_tags.c): a row's, which
    menu_functions.c shows and hides by it, 31 characters at most (a longer
    one is cut short, and never found)."""
    for name, lines in port_settings.settings_files().items():
        for path in re.findall(r'<widget name="([^"]+)"', "\n".join(lines)):
            leaf = path.rsplit("/", 1)[-1]
            if leaf.startswith("op_"):
                assert len(leaf) <= 31, (name, path)


def test_randomizer_pages():
    """The randomizer's screen opens a page for each part of the setup, each
    page's OK going back to it, and its own OK goes on to the level."""
    base = "main_menu/difficulty_select/randomizer"
    screen = "\n".join(port_settings.settings_files()["main_menu.difficulty_select.randomizer.xml"])
    source = (ROOT / "port/linux/game/menu_functions.c").read_text()
    assert [key for key, *_ in port_settings.RANDOMIZER_HUB_ROWS] == ["ai", "weapons", "pickups", "loadout"]
    for key, *_ in port_settings.RANDOMIZER_HUB_ROWS:
        assert f'name="{base}/{key}_screen"' in screen
        assert f'open="{base}/{key}_screen"' in screen
        assert f'"hub_{key}_value"' in source
        assert f'name="{base}/{key}_button_ok"' in screen
    assert screen.count('run="randomizer page ok"') == 2 * len(port_settings.RANDOMIZER_HUB_ROWS)
    # (the screen's rows are the pages': no setting of its own to lose)
    hub = screen[:screen.index(f'name="{base}/op_hub_ai"')]
    assert "setting=" not in hub
    # (the page code's and the screens' row places agree)
    assert f"#define RANDOMIZER_PAGE_TOP {port_settings.RANDOMIZER_PAGE_TOP}" in source
    assert f"#define RANDOMIZER_PAGE_PITCH {port_settings.RANDOMIZER_PAGE_PITCH}" in source
    # (from Server Setup, OK goes back there; else on to the skulls or level)
    ok = source[source.index("static boolean randomizer_ok("):]
    ok = ok[:ok.index("\n}\n")]
    assert "campaign_screens_for_server" in ok and "campaign_start(" in ok and "skulls_open(" in ok


def test_allies_have_a_pool_of_their_own():
    """ALLIES stands alone, and its pool reaches a co-op client."""
    settings = {setting for _, _, setting, *_ in port_settings.RANDOMIZER_ROWS}
    screen = "\n".join(port_settings.settings_files()["main_menu.difficulty_select.randomizer.xml"])
    code = (ROOT / "port/linux/game/randomizer.c").read_text()
    limits = (ROOT / "port/linux/include/halo_port_limits.h").read_text()
    config = (ROOT / "port/linux/src/port_config.c").read_text()
    for name in ("pool", "type", "custom_type", "grunt_rank", "elite_rank", "jackal_rank", "hunter_rank",
                 "flood_combat_rank"):
        assert f"game.randomizer_ally_{name}" in settings
        assert f'"game.randomizer_ally_{name}"' in config
        assert f'"game.randomizer_ally_{name}"' in code
    assert 'values="as_enemies|any|covenant|flood|human|one|tag_injector"' in screen
    # (a setup saved before, and a challenge, as they played)
    assert '{ "game.randomizer_ally_pool", _config_string, "\\"as_enemies\\""' in config
    assert 'community_challenge_running() || !_stricmp(config_string("game.randomizer_ally_pool"), "as_enemies")' in code
    # (every byte of the advertisement is taken: they ride the high bits)
    assert "#define HALO_PORT_ADVERTISED_RANDOMIZER_SETUP_SIZE 12" in limits
    assert int(re.search(r"#define HALO_PORT_MOD_NETWORK_VERSION (\d+)", limits).group(1)) >= 9
    advertised = code[code.index("void randomizer_advertisement("):]
    assert "setup.allies.type << 4" in advertised and "(setup.allies.pool + 1) << 4" in advertised
    assert "setup.allies.rank << 3" in advertised
    remote = code[code.index("static void setup_from_remote("):]
    remote = remote[:remote.index("\n}\n")]
    assert "remote_setup[1] >> 4" in remote and "(remote_setup[2] >> 4) & 7" in remote
    assert "(remote_setup[7] >> 3) & 7" in remote and "allies_as_enemies(setup)" in remote
    # (a side's on or off stands alone)
    assert "setup->enemies.on || setup->allies.on" in code


def test_player_loadout_page():
    """PLAYER LOADOUT's page: its setting and its rows of weapons."""
    base = "main_menu/difficulty_select/randomizer"
    screen = "\n".join(port_settings.settings_files()["main_menu.difficulty_select.randomizer.xml"])
    source = (ROOT / "port/linux/game/menu_functions.c").read_text()
    names = (ROOT / "port/linux/game/menu_tags.c").read_text()
    config = (ROOT / "port/linux/src/port_config.c").read_text()

    assert f'name="{base}/loadout_screen"' in screen
    assert 'setting="game.randomizer_loadout"' in screen and 'values="default|random|set"' in screen
    for key in ("loadout_primary", "loadout_secondary"):
        assert f'name="{base}/op_{key}"' in screen and f'name="{base}/{key}_value"' in screen
        assert f'"op_{key}"' in source and f'"game.randomizer_{key}"' in config
    for name in ("randomizer loadout left", "randomizer loadout right", "randomizer page ok",
                 "randomizer loadout update", "randomizer hub update"):
        assert f'"{name}"' in names and f'"{name}"' in source
    assert '"game.randomizer_loadout"' in config
    # (a level's scripts and spawns give the loadout in the profile's place)
    players = (ROOT / "source/game/players.c").read_text()
    assert "randomizer_player_loadout(unit_index, reset_equipment)" in players
    assert players.count("if (!loadout && starting_profile->") == 2


def test_objective_weapons_are_never_given():
    """A flag or a ball is the game's weapon_is_flag bit, and no swap gives one."""
    game = ROOT / "port/linux/game"
    weapons = (ROOT / "source/items/weapons.c").read_text()
    assert "weapon_definition->weapon.flags>>3" in weapons
    definitions = (ROOT / "source/items/weapon_definitions.h").read_text()
    bits = re.findall(r"^\t(_weapon_\w+_bit)", definitions, re.M)
    assert bits[3] == "_weapon_must_be_readied_bit"
    assert "_weapon_must_be_readied_bit" in (game / "tag_injector.c").read_text()
    for name in ("tag_multiplayer.c", "tag_campaign.c", "randomizer.c"):
        assert "tag_injector_weapon_objective(" in (game / name).read_text()
    assert "tag_injector_tag_objective(base, tag)" in (game / "menu_functions.c").read_text()
