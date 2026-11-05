/*
SOCIAL_EXTENSIONS.C

Compartmentalised extensions for Watanoge's Social Menu (social_menu.c):
- Customise Emblem editor & live preview (_social_ext_list_emblem)
- Service Record & MCC Service Rank (service_rank.c)
- Unified Challenges: Watanoge's Daily Challenge (community.c) + Daily & Weekly
  Campaign, Firefight, and Multiplayer challenges (firefight_stats.c)
- 39 Achievements (1000G) browser
- Player Card (_list_card) Service Rank icon, Emblem, XP, Gamerscore & Firefight summary
*/

#include <stdio.h>
#include <string.h>

#include "cseries.h"
#include "rasterizer/rasterizer.h"
#include "cutscene/cinematics.h"
#include "text/unicode.h"
#include "social_extensions.h"
#include "service_rank.h"
#include "halo_firefight.h"
#include "halo_skulls.h"
#include "community.h"
#include "campaign_medals.h"

/* ---------- Service Record Row IDs */

enum
{
	_sr_item_rank = 0,
	_sr_item_gamerscore,
	_sr_item_skulls,
	_sr_item_firefight,
	_sr_item_multiplayer,
	_sr_item_medals,
	_sr_item_map_base = 10
};

/* ---------- Emblem Editor Row IDs & Catalog Names (from Faber) */

enum
{
	_emb_row_foreground = 0,
	_emb_row_secondary_layer = 1,
	_emb_row_background = 2,
	_emb_row_primary_color = 3,
	_emb_row_secondary_color = 4,
	_emb_row_bg_color = 5,
	_emb_row_nameplate = 6,
	_emb_row_count = 7
};

static char const *const s_mcc_nameplate_names[FIREFIGHT_NAMEPLATE_COUNT] =
{
	"UNSC Standard",
	"Halo Ring",
	"Legendary Shield",
	"ODST Drop Pod",
	"Covenant Empire",
	"Forerunner Glyph",
	"Firefight Veteran",
	"Golden Warthog",
	"Pillar of Autumn",
	"Reclaimer"
};

/* ---------- Cached Person / Friend Rank & Emblem Table */

#define SOCIAL_EXT_PERSON_CACHE_MAX 128

struct social_ext_person_entry
{
	boolean valid;
	boolean has_custom_emblem;
	char code[16];
	char name[48];
	long total_xp;
	struct firefight_emblem_info emblem;
};

static struct social_ext_person_entry s_person_cache[SOCIAL_EXT_PERSON_CACHE_MAX];
static short s_person_cache_next = 0;

/* ---------- helpers */

static void wchar_to_ascii(wchar_t const *src, char *dst, size_t dst_size)
{
	size_t i = 0;

	if (!dst || dst_size == 0)
		return;
	if (!src)
	{
		dst[0] = '\0';
		return;
	}
	while (src[i] != 0 && i + 1 < dst_size)
	{
		wchar_t c = src[i];
		dst[i] = (c >= 32 && c < 127) ? (char)c : '?';
		i++;
	}
	dst[i] = '\0';
}

static unsigned long hash_person_seed(char const *str)
{
	unsigned long h = 2166136261UL;

	if (!str)
		return h;
	while (*str)
	{
		unsigned char c = (unsigned char)*str++;
		if (c >= 'a' && c <= 'z')
			c = (unsigned char)(c - 'a' + 'A');
		h ^= (unsigned long)c;
		h *= 16777619UL;
	}
	return h;
}

static void derive_deterministic_emblem(
	char const *seed_str,
	short color_hint,
	struct firefight_emblem_info *out_emblem)
{
	unsigned long h = hash_person_seed(seed_str && seed_str[0] ? seed_str : "SPARTAN");

	if (!out_emblem)
		return;

	out_emblem->foreground = (short)(h % FIREFIGHT_EMBLEM_FOREGROUND_COUNT);
	out_emblem->background = (short)(1 + ((h >> 4) % (FIREFIGHT_EMBLEM_BACKGROUND_COUNT - 1)));
	out_emblem->secondary_layer = ((h >> 8) & 1) ? TRUE : FALSE;
	if (color_hint >= 0 && color_hint < FIREFIGHT_EMBLEM_COLOR_COUNT)
		out_emblem->primary_color = color_hint;
	else
		out_emblem->primary_color = (short)((h >> 9) % FIREFIGHT_EMBLEM_COLOR_COUNT);
	out_emblem->secondary_color = (short)((out_emblem->primary_color + 3 + ((h >> 14) % 11)) % FIREFIGHT_EMBLEM_COLOR_COUNT);
	out_emblem->background_color = (short)((out_emblem->primary_color + 7 + ((h >> 18) % 9)) % FIREFIGHT_EMBLEM_COLOR_COUNT);
	out_emblem->nameplate = (short)((h >> 22) % FIREFIGHT_NAMEPLATE_COUNT);
}

static int str_case_eq(char const *a, char const *b)
{
	if (!a || !b)
		return 0;
	while (*a && *b)
	{
		char ca = (*a >= 'a' && *a <= 'z') ? (char)(*a - 'a' + 'A') : *a;
		char cb = (*b >= 'a' && *b <= 'z') ? (char)(*b - 'a' + 'A') : *b;
		if (ca != cb)
			return 0;
		a++;
		b++;
	}
	return *a == 0 && *b == 0;
}

void social_extensions_cache_person_stats(
	char const *code,
	char const *name,
	long total_xp,
	struct firefight_emblem_info const *emblem_opt)
{
	short i;
	short slot = NONE;

	if ((!code || !code[0]) && (!name || !name[0]))
		return;

	for (i = 0; i < SOCIAL_EXT_PERSON_CACHE_MAX; i++)
	{
		if (!s_person_cache[i].valid)
			continue;
		if (code && code[0] && s_person_cache[i].code[0] && str_case_eq(s_person_cache[i].code, code))
		{
			slot = i;
			break;
		}
		if (name && name[0] && s_person_cache[i].name[0] && str_case_eq(s_person_cache[i].name, name))
		{
			slot = i;
		}
	}

	if (slot == NONE)
	{
		slot = s_person_cache_next;
		s_person_cache_next = (short)((s_person_cache_next + 1) % SOCIAL_EXT_PERSON_CACHE_MAX);
		csmemset(&s_person_cache[slot], 0, sizeof(s_person_cache[slot]));
		s_person_cache[slot].valid = TRUE;
	}

	if (code && code[0])
		snprintf(s_person_cache[slot].code, sizeof(s_person_cache[slot].code), "%s", code);
	if (name && name[0])
		snprintf(s_person_cache[slot].name, sizeof(s_person_cache[slot].name), "%s", name);
	if (total_xp >= 0)
		s_person_cache[slot].total_xp = total_xp;
	if (emblem_opt)
	{
		s_person_cache[slot].emblem = *emblem_opt;
		s_person_cache[slot].has_custom_emblem = TRUE;
	}
}

boolean social_extensions_has_cached_person(char const *code)
{
	short i;

	if (!code || !code[0])
		return FALSE;
	for (i = 0; i < SOCIAL_EXT_PERSON_CACHE_MAX; i++)
	{
		if (s_person_cache[i].valid && s_person_cache[i].code[0] && str_case_eq(s_person_cache[i].code, code))
			return TRUE;
	}
	return FALSE;
}

void social_extensions_get_person_rank_and_emblem(
	char const *code,
	char const *name,
	short color_hint,
	struct firefight_mcc_rank_info *out_rank,
	struct firefight_emblem_info *out_emblem)
{
	short i;
	struct social_ext_person_entry const *found = NULL;
	char const *seed = (code && code[0]) ? code : ((name && name[0]) ? name : "SPARTAN");

	for (i = 0; i < SOCIAL_EXT_PERSON_CACHE_MAX; i++)
	{
		if (!s_person_cache[i].valid)
			continue;
		if (code && code[0] && s_person_cache[i].code[0] && str_case_eq(s_person_cache[i].code, code))
		{
			found = &s_person_cache[i];
			break;
		}
		if (!found && name && name[0] && s_person_cache[i].name[0] && str_case_eq(s_person_cache[i].name, name))
		{
			found = &s_person_cache[i];
		}
	}

	if (out_rank)
	{
		long xp = found ? found->total_xp : 0L;
#if OPENCE_ENABLE_SERVICE_RANK
		service_rank_compute_from_xp(xp, out_rank);
#else
		csmemset(out_rank, 0, sizeof(*out_rank));
		out_rank->tour_number = 1;
		out_rank->rank_in_tour = 1;
		out_rank->tour_name = "Tour 1";
		out_rank->rank_name = "Rookie";
#endif
	}

	if (out_emblem)
	{
		if (found && found->has_custom_emblem)
			*out_emblem = found->emblem;
		else
			derive_deterministic_emblem(seed, color_hint, out_emblem);
	}
}

void social_extensions_get_wide_name_rank_and_emblem(
	wchar_t const *wide_name,
	short color_hint,
	struct firefight_mcc_rank_info *out_rank,
	struct firefight_emblem_info *out_emblem)
{
	char ascii_name[48];
	short i;
	boolean in_cache = FALSE;

	wchar_to_ascii(wide_name, ascii_name, sizeof(ascii_name));
	for (i = 0; i < SOCIAL_EXT_PERSON_CACHE_MAX; i++)
	{
		if (s_person_cache[i].valid && s_person_cache[i].name[0] && str_case_eq(s_person_cache[i].name, ascii_name))
		{
			in_cache = TRUE;
			break;
		}
	}

	social_extensions_get_person_rank_and_emblem(
		NULL,
		ascii_name,
		color_hint >= 0 ? firefight_emblem_color_from_armor(color_hint) : NONE,
		out_rank,
		out_emblem);

	/* For uncached bots / offline players in-game, give a deterministic non-zero rank from their name */
	if (!in_cache && out_rank && ascii_name[0])
	{
#if OPENCE_ENABLE_SERVICE_RANK
		unsigned long h = hash_person_seed(ascii_name);
		long bot_xp = (long)((h % 45UL) * 6500UL);
		service_rank_compute_from_xp(bot_xp, out_rank);
#endif
	}
}

static long count_unlocked_skulls_ext(void)
{
	struct skull_set set = skulls_unlocked_set();
	long count = 0;
	int i;

	for (i = 0; i < NUMBER_OF_SKULLS; i++)
	{
		if (skull_set_has(&set, i))
			count++;
	}
	return count;
}

static char const *difficulty_label(short diff)
{
	switch (diff)
	{
	case 0: return "EASY";
	case 1: return "NORMAL";
	case 2: return "HEROIC";
	case 3: return "LEGENDARY";
	default: return "NORMAL";
	}
}

/* ---------- public predicates */

boolean social_extensions_is_ext_list(short list_kind)
{
	return list_kind == _social_ext_list_service_record ||
		list_kind == _social_ext_list_challenges ||
		list_kind == _social_ext_list_achievements ||
		list_kind == _social_ext_list_emblem;
}

boolean social_extensions_is_ext_row(short row_kind)
{
	return row_kind == _social_ext_row_service_record ||
		row_kind == _social_ext_row_challenges ||
		row_kind == _social_ext_row_achievements ||
		row_kind == _social_ext_row_emblem ||
		row_kind == _social_ext_row_item;
}

char const *social_extensions_list_title(short list_kind)
{
	switch (list_kind)
	{
	case _social_ext_list_emblem:
		return "CUSTOMISE EMBLEM";
	case _social_ext_list_service_record:
		return "SERVICE RECORD & RANK";
	case _social_ext_list_challenges:
		return "CHALLENGES";
	case _social_ext_list_achievements:
		return "ACHIEVEMENTS";
	default:
		return "SOCIAL";
	}
}

/* ---------- building rows */

void social_extensions_add_home_rows(social_ext_row_add_fn add_fn)
{
	if (!add_fn)
		return;
	add_fn(_social_ext_row_emblem, 0);
#if OPENCE_ENABLE_SERVICE_RANK || OPENCE_ENABLE_FIREFIGHT
	add_fn(_social_ext_row_service_record, 0);
#endif
#if OPENCE_ENABLE_EXT_CHALLENGES
	add_fn(_social_ext_row_challenges, 0);
#endif
#if OPENCE_ENABLE_ACHIEVEMENTS
	add_fn(_social_ext_row_achievements, 0);
#endif
}

void social_extensions_build_list_rows(short list_kind, social_ext_row_add_fn add_fn)
{
	short i;

	if (!add_fn)
		return;

	if (list_kind == _social_ext_list_emblem)
	{
		for (i = 0; i < _emb_row_count; i++)
			add_fn(_social_ext_row_item, i);
	}
	else if (list_kind == _social_ext_list_service_record)
	{
#if OPENCE_ENABLE_SERVICE_RANK
		add_fn(_social_ext_row_item, _sr_item_rank);
#endif
#if OPENCE_ENABLE_ACHIEVEMENTS
		add_fn(_social_ext_row_item, _sr_item_gamerscore);
#endif
		add_fn(_social_ext_row_item, _sr_item_skulls);
#if OPENCE_ENABLE_FIREFIGHT
		add_fn(_social_ext_row_item, _sr_item_firefight);
#endif
		add_fn(_social_ext_row_item, _sr_item_multiplayer);
		add_fn(_social_ext_row_item, _sr_item_medals);
		{
			short map_count = firefight_stats_get_map_record_count(NONE);
			for (i = 0; i < map_count; i++)
				add_fn(_social_ext_row_item, (short)(_sr_item_map_base + i));
		}
	}
	else if (list_kind == _social_ext_list_challenges)
	{
		/* Item 0: Watanoge's Community Daily Challenge (Server/Offline seed run) */
		if (community_daily_state() == _community_off || community_daily() == NULL)
			community_daily_open(NULL);
		add_fn(_social_ext_row_item, 0);

		/* Items 1..6: Daily Challenges (Campaign, Firefight, Multiplayer: 2 each) */
		/* Items 7..12: Weekly Challenges (Campaign, Firefight, Multiplayer: 2 each) */
		for (i = 1; i <= 12; i++)
			add_fn(_social_ext_row_item, i);
	}
	else if (list_kind == _social_ext_list_achievements)
	{
		for (i = 0; i < HALO_ACHIEVEMENT_COUNT; i++)
			add_fn(_social_ext_row_item, i);
	}
}

/* ---------- challenge lookup helper (value 1..12) */

static boolean get_ext_challenge_by_slot(
	short slot,
	short *out_period,
	short *out_category,
	struct firefight_challenge_view *out_view)
{
	short index_ZeroBased = (short)(slot - 1);
	short period;
	short category;
	short sub_idx;
	struct firefight_challenge_view list[2];
	short count;

	if (slot < 1 || slot > 12 || !out_view)
		return FALSE;

	period = (index_ZeroBased < 6) ? _ff_challenge_period_daily : _ff_challenge_period_weekly;
	category = (index_ZeroBased % 6) / 2;
	sub_idx = index_ZeroBased % 2;

	csmemset(list, 0, sizeof(list));
	count = firefight_stats_get_challenges(NONE, category, period, list, 2);
	if (sub_idx >= count)
		return FALSE;

	if (out_period)
		*out_period = period;
	if (out_category)
		*out_category = category;
	*out_view = list[sub_idx];
	return TRUE;
}

static char const *category_short_prefix(short category)
{
	switch (category)
	{
	case _ff_challenge_cat_campaign: return "CAMP";
	case _ff_challenge_cat_firefight: return "FF";
	case _ff_challenge_cat_multiplayer: return "MP";
	default: return "CHAL";
	}
}

static char const *category_full_label(short category)
{
	switch (category)
	{
	case _ff_challenge_cat_campaign: return "Campaign";
	case _ff_challenge_cat_firefight: return "Firefight";
	case _ff_challenge_cat_multiplayer: return "Multiplayer";
	default: return "General";
	}
}

/* ---------- row text formatting */

void social_extensions_row_text(
	short list_kind,
	short row_kind,
	short value,
	char *name,
	long name_size,
	char *state,
	long state_size)
{
	if (!name || name_size <= 0 || !state || state_size <= 0)
		return;

	name[0] = '\0';
	state[0] = '\0';

	if (row_kind == _social_ext_row_emblem)
	{
		struct firefight_emblem_info emb;
		short fg;

		firefight_stats_get_emblem(NONE, &emb);
		fg = (short)PIN(emb.foreground, 0, FIREFIGHT_EMBLEM_FOREGROUND_COUNT - 1);
		snprintf(name, (size_t)name_size, "CUSTOMISE EMBLEM");
		snprintf(state, (size_t)state_size, "%s", firefight_emblem_foreground_names[fg]);
		return;
	}
	if (row_kind == _social_ext_row_service_record)
	{
		snprintf(name, (size_t)name_size, "SERVICE RECORD & RANK");
#if OPENCE_ENABLE_SERVICE_RANK
		{
			struct firefight_mcc_rank_info rk;
			firefight_stats_get_mcc_rank(NONE, &rk);
			snprintf(state, (size_t)state_size, "TOUR %d - R%d", (int)rk.tour_number, (int)rk.rank_in_tour);
		}
#else
		snprintf(state, (size_t)state_size, "STATS");
#endif
		return;
	}
	if (row_kind == _social_ext_row_challenges)
	{
		short d_done = 0, d_total = 0, w_done = 0, w_total = 0;
		struct community_challenge const *daily = community_daily();
		short comm_done = (daily && daily->has_mine) ? 1 : 0;

		firefight_stats_get_challenge_summary(NONE, &d_done, &d_total, &w_done, &w_total);
		snprintf(name, (size_t)name_size, "CHALLENGES");
		snprintf(state, (size_t)state_size, "%d/%d DONE", (int)(d_done + w_done + comm_done), (int)(d_total + w_total + 1));
		return;
	}
	if (row_kind == _social_ext_row_achievements)
	{
		short unlocked = 0, total = 0, score = 0, max_score = 1000;
		firefight_stats_get_achievement_count(NONE, &unlocked, &total);
		firefight_stats_get_achievement_score(NONE, &score, &max_score);
		snprintf(name, (size_t)name_size, "ACHIEVEMENTS");
		snprintf(state, (size_t)state_size, "%d/%d (%dG)", (int)unlocked, (int)total, (int)score);
		return;
	}

	if (row_kind != _social_ext_row_item)
		return;

	if (list_kind == _social_ext_list_emblem)
	{
		struct firefight_emblem_info emb;
		short fg, bg, c1, c2, c3, np;

		firefight_stats_get_emblem(NONE, &emb);
		fg = (short)PIN(emb.foreground, 0, FIREFIGHT_EMBLEM_FOREGROUND_COUNT - 1);
		bg = (short)PIN(emb.background, 0, FIREFIGHT_EMBLEM_BACKGROUND_COUNT - 1);
		c1 = (short)PIN(emb.primary_color, 0, FIREFIGHT_EMBLEM_COLOR_COUNT - 1);
		c2 = (short)PIN(emb.secondary_color, 0, FIREFIGHT_EMBLEM_COLOR_COUNT - 1);
		c3 = (short)PIN(emb.background_color, 0, FIREFIGHT_EMBLEM_COLOR_COUNT - 1);
		np = (short)PIN(emb.nameplate, 0, FIREFIGHT_NAMEPLATE_COUNT - 1);

		switch (value)
		{
		case _emb_row_foreground:
			snprintf(name, (size_t)name_size, "EMBLEM");
			snprintf(state, (size_t)state_size, "%s", firefight_emblem_foreground_names[fg]);
			break;
		case _emb_row_secondary_layer:
			snprintf(name, (size_t)name_size, "TOGGLE DETAIL");
			snprintf(state, (size_t)state_size, "%s", emb.secondary_layer ? "ON" : "OFF");
			break;
		case _emb_row_background:
			snprintf(name, (size_t)name_size, "BACKGROUND");
			snprintf(state, (size_t)state_size, "%s", firefight_emblem_background_names[bg]);
			break;
		case _emb_row_primary_color:
			snprintf(name, (size_t)name_size, "PRIMARY COLOUR");
			snprintf(state, (size_t)state_size, "%s", firefight_emblem_color_names[c1]);
			break;
		case _emb_row_secondary_color:
			snprintf(name, (size_t)name_size, "SECONDARY COLOUR");
			snprintf(state, (size_t)state_size, "%s", firefight_emblem_color_names[c2]);
			break;
		case _emb_row_bg_color:
			snprintf(name, (size_t)name_size, "BG COLOUR");
			snprintf(state, (size_t)state_size, "%s", firefight_emblem_color_names[c3]);
			break;
		case _emb_row_nameplate:
			snprintf(name, (size_t)name_size, "NAMEPLATE");
			snprintf(state, (size_t)state_size, "%s", s_mcc_nameplate_names[np]);
			break;
		default:
			break;
		}
	}
	else if (list_kind == _social_ext_list_service_record)
	{
		struct firefight_career_stats career;
		firefight_stats_get_career(NONE, &career);

		switch (value)
		{
		case _sr_item_rank:
			{
				struct firefight_mcc_rank_info rk;
				firefight_stats_get_mcc_rank(NONE, &rk);
				snprintf(name, (size_t)name_size, "RANK: %s", rk.rank_name);
				snprintf(state, (size_t)state_size, "T%d (%ld XP)", (int)rk.tour_number, career.career_xp);
			}
			break;
		case _sr_item_gamerscore:
			{
				short unlocked = 0, total = 0, score = 0, max_score = 1000;
				firefight_stats_get_achievement_count(NONE, &unlocked, &total);
				firefight_stats_get_achievement_score(NONE, &score, &max_score);
				snprintf(name, (size_t)name_size, "GAMERSCORE");
				snprintf(state, (size_t)state_size, "%d / %d G", (int)score, (int)max_score);
			}
			break;
		case _sr_item_skulls:
			snprintf(name, (size_t)name_size, "SKULLS UNLOCKED");
			snprintf(state, (size_t)state_size, "%ld / %d", count_unlocked_skulls_ext(), (int)NUMBER_OF_SKULLS);
			break;
		case _sr_item_firefight:
			snprintf(name, (size_t)name_size, "FIREFIGHT CAREER");
			snprintf(state, (size_t)state_size, "%ld SETS / %ld K", career.total_sets_completed, career.total_kills);
			break;
		case _sr_item_multiplayer:
			snprintf(name, (size_t)name_size, "MULTIPLAYER CAREER");
			snprintf(state, (size_t)state_size, "%ld GAMES / %ld K", career.mp_matches, career.mp_kills);
			break;
		case _sr_item_medals:
			{
				long total_medals = 0;
				short m;
				for (m = 0; m < 38; m++)
					total_medals += career.medal_counts[m] + career.mp_medal_counts[m];
				snprintf(name, (size_t)name_size, "TOTAL MEDALS EARNED");
				snprintf(state, (size_t)state_size, "%ld", total_medals);
			}
			break;
		default:
			if (value >= _sr_item_map_base)
			{
				char map_key[32];
				struct firefight_map_record rec;
				if (firefight_stats_get_indexed_map_record((short)(value - _sr_item_map_base), NONE, map_key, sizeof(map_key), &rec))
				{
					snprintf(name, (size_t)name_size, "BEST: %s", map_key);
					snprintf(state, (size_t)state_size, "%ld PTS", rec.best_score);
				}
			}
			break;
		}
	}
	else if (list_kind == _social_ext_list_challenges)
	{
		if (value == 0)
		{
			struct community_challenge const *daily = community_daily();
			if (daily && daily->level[0])
			{
				snprintf(name, (size_t)name_size, "[DAILY RUN] %s (%s)", daily->level, difficulty_label(daily->difficulty));
				if (daily->has_mine)
					snprintf(state, (size_t)state_size, "DONE (%ld PTS)", daily->mine_score);
				else
					snprintf(state, (size_t)state_size, "+5000 XP");
			}
			else
			{
				snprintf(name, (size_t)name_size, "[DAILY RUN] COMMUNITY CHALLENGE");
				snprintf(state, (size_t)state_size, "+5000 XP");
			}
		}
		else
		{
			short period = 0, category = 0;
			struct firefight_challenge_view view;
			if (get_ext_challenge_by_slot(value, &period, &category, &view))
			{
				snprintf(
					name,
					(size_t)name_size,
					"[%s %s] %s",
					period == _ff_challenge_period_daily ? "D" : "W",
					category_short_prefix(category),
					view.title);
				if (view.completed)
					snprintf(state, (size_t)state_size, "DONE (+%ld XP)", view.xp_reward);
				else
					snprintf(state, (size_t)state_size, "%ld/%ld", view.progress, view.target);
			}
		}
	}
	else if (list_kind == _social_ext_list_achievements)
	{
		char const *key = NULL;
		wchar_t const *wtitle = NULL;
		wchar_t const *wdesc = NULL;
		char title_buf[64];
		short pts = firefight_stats_get_achievement_points(value);
		boolean unlocked = firefight_stats_is_achievement_unlocked(NONE, value);

		if (firefight_stats_get_achievement_info(value, &key, &wtitle, &wdesc))
		{
			wchar_to_ascii(wtitle, title_buf, sizeof(title_buf));
			snprintf(name, (size_t)name_size, "%s", title_buf);
			snprintf(state, (size_t)state_size, "%s (%dG)", unlocked ? "UNLOCKED" : "LOCKED", (int)pts);
		}
	}
}

/* ---------- row details pane */

void social_extensions_row_details(
	short list_kind,
	short row_kind,
	short value,
	char *title,
	long title_size,
	char *text,
	long text_size)
{
	if (!title || title_size <= 0 || !text || text_size <= 0)
		return;

	if (list_kind == _social_ext_list_emblem)
	{
		snprintf(title, (size_t)title_size, "EMBLEM PREVIEW");
		text[0] = '\0';
		return;
	}
	if (row_kind == _social_ext_row_emblem)
	{
		struct firefight_emblem_info emb;
		struct firefight_mcc_rank_info rk;
		short fg, bg, np;

		firefight_stats_get_emblem(NONE, &emb);
		firefight_stats_get_mcc_rank(NONE, &rk);
		fg = (short)PIN(emb.foreground, 0, FIREFIGHT_EMBLEM_FOREGROUND_COUNT - 1);
		bg = (short)PIN(emb.background, 0, FIREFIGHT_EMBLEM_BACKGROUND_COUNT - 1);
		np = (short)PIN(emb.nameplate, 0, FIREFIGHT_NAMEPLATE_COUNT - 1);

		snprintf(title, (size_t)title_size, "CUSTOMISE EMBLEM");
		snprintf(
			text,
			(size_t)text_size,
			"Emblem: %s (%s)\n"
			"Background: %s\n"
			"Nameplate: %s\n"
			"Rank: %s (T%d R%d)\n\n"
			"Customise your foreground emblem,\n"
			"background shape, primary/secondary\n"
			"colours, and MCC nameplate.\n\n"
			"Press A to customise your emblem.",
			firefight_emblem_foreground_names[fg],
			emb.secondary_layer ? "Full" : "Primary",
			firefight_emblem_background_names[bg],
			s_mcc_nameplate_names[np],
			rk.rank_name,
			(int)rk.tour_number,
			(int)rk.rank_in_tour);
		return;
	}
	if (row_kind == _social_ext_row_service_record)
	{
		struct firefight_career_stats career;
		struct firefight_mcc_rank_info rk;
		short unlocked = 0, total = 0, score = 0, max_score = 1000;

		firefight_stats_get_career(NONE, &career);
		firefight_stats_get_mcc_rank(NONE, &rk);
		firefight_stats_get_achievement_count(NONE, &unlocked, &total);
		firefight_stats_get_achievement_score(NONE, &score, &max_score);

		snprintf(title, (size_t)title_size, "SERVICE RECORD");
		snprintf(
			text,
			(size_t)text_size,
			"Rank: %s (%s)\n"
			"Career XP: %ld / %ld XP\n"
			"Gamerscore: %d / %d G (%d/%d)\n"
			"Skulls Unlocked: %ld / %d\n"
			"Firefight Sets: %ld | Waves: %ld\n"
			"Career Kills: %ld | MP Kills: %ld\n\n"
			"Press A to inspect your full\nService Record & Map Records.",
			rk.rank_name,
			rk.tour_name,
			rk.xp_in_rank,
			rk.xp_for_next_rank,
			(int)score,
			(int)max_score,
			(int)unlocked,
			(int)total,
			count_unlocked_skulls_ext(),
			(int)NUMBER_OF_SKULLS,
			career.total_sets_completed,
			career.total_waves_cleared,
			career.total_kills,
			career.mp_kills);
		return;
	}
	if (row_kind == _social_ext_row_challenges)
	{
		short d_done = 0, d_total = 0, w_done = 0, w_total = 0;
		struct community_challenge const *daily = community_daily();

		firefight_stats_get_challenge_summary(NONE, &d_done, &d_total, &w_done, &w_total);
		snprintf(title, (size_t)title_size, "CHALLENGES");
		snprintf(
			text,
			(size_t)text_size,
			"Community Daily Run: %s\n"
			"Daily Challenges: %d / %d Completed\n"
			"Weekly Challenges: %d / %d Completed\n\n"
			"Campaign, Firefight, and Multiplayer\n"
			"challenges award bonus XP toward\n"
			"your Service Rank.\n\n"
			"Press A to view active challenges.",
			(daily && daily->has_mine) ? "COMPLETED" : "OPEN",
			(int)d_done,
			(int)d_total,
			(int)w_done,
			(int)w_total);
		return;
	}
	if (row_kind == _social_ext_row_achievements)
	{
		short unlocked = 0, total = 0, score = 0, max_score = 1000;
		firefight_stats_get_achievement_count(NONE, &unlocked, &total);
		firefight_stats_get_achievement_score(NONE, &score, &max_score);
		snprintf(title, (size_t)title_size, "ACHIEVEMENTS");
		snprintf(
			text,
			(size_t)text_size,
			"Unlocked: %d of %d Achievements\n"
			"Gamerscore: %d / %d G\n\n"
			"Complete Campaign missions, survive\n"
			"Firefight sets, and hunt hidden\n"
			"Legendary Skulls to earn all 1000G.\n\n"
			"Press A to browse achievements.",
			(int)unlocked,
			(int)total,
			(int)score,
			(int)max_score);
		return;
	}

	if (row_kind != _social_ext_row_item)
		return;

	if (list_kind == _social_ext_list_service_record)
	{
		struct firefight_career_stats career;
		firefight_stats_get_career(NONE, &career);

		switch (value)
		{
		case _sr_item_rank:
			{
				struct firefight_mcc_rank_info rk;
				firefight_stats_get_mcc_rank(NONE, &rk);
				snprintf(title, (size_t)title_size, "%s (%s)", rk.rank_name, rk.tour_name);
				snprintf(
					text,
					(size_t)text_size,
					"Tour %d of 11 - Rank %d of 30\n"
					"Total Career XP: %ld XP\n"
					"Next Promotion: %ld XP\n\n"
					"Earn XP from kills, medals, Campaign\n"
					"missions, Firefight waves & sets,\n"
					"Multiplayer matches, and Daily &\n"
					"Weekly Challenges.",
					(int)rk.tour_number,
					(int)rk.rank_in_tour,
					rk.total_xp,
					rk.xp_for_next_rank);
			}
			break;
		case _sr_item_gamerscore:
			{
				short unlocked = 0, total = 0, score = 0, max_score = 1000;
				firefight_stats_get_achievement_count(NONE, &unlocked, &total);
				firefight_stats_get_achievement_score(NONE, &score, &max_score);
				snprintf(title, (size_t)title_size, "GAMERSCORE");
				snprintf(
					text,
					(size_t)text_size,
					"%d / %d G (%d of %d unlocked)\n\n"
					"View the ACHIEVEMENTS list in Social\n"
					"to inspect individual requirements.",
					(int)score,
					(int)max_score,
					(int)unlocked,
					(int)total);
			}
			break;
		case _sr_item_skulls:
			snprintf(title, (size_t)title_size, "SKULLS UNLOCKED");
			snprintf(
				text,
				(size_t)text_size,
				"%ld of %d Skulls Unlocked\n\n"
				"Unlock skulls by finding them in\n"
				"Campaign levels, defeating Elite\n"
				"Skull Carriers, or reaching enemy\n"
				"kill and Firefight set milestones.",
				count_unlocked_skulls_ext(),
				(int)NUMBER_OF_SKULLS);
			break;
		case _sr_item_firefight:
			snprintf(title, (size_t)title_size, "FIREFIGHT CAREER");
			snprintf(
				text,
				(size_t)text_size,
				"Matches Played: %ld\n"
				"Sets Completed: %ld\n"
				"Waves Cleared: %ld\n"
				"Total Kills: %ld (Bosses: %ld)\n"
				"Total Deaths: %ld | Assists: %ld\n"
				"Best Kill Spree: %ld\n"
				"Total Score: %ld",
				career.total_matches,
				career.total_sets_completed,
				career.total_waves_cleared,
				career.total_kills,
				career.total_boss_kills,
				career.total_deaths,
				career.total_assists,
				career.best_kill_spree,
				career.total_score);
			break;
		case _sr_item_multiplayer:
			snprintf(title, (size_t)title_size, "MULTIPLAYER CAREER");
			snprintf(
				text,
				(size_t)text_size,
				"Matches Completed: %ld\n"
				"Kills: %ld | Deaths: %ld\n"
				"Assists: %ld\n"
				"Total Score: %ld",
				career.mp_matches,
				career.mp_kills,
				career.mp_deaths,
				career.mp_assists,
				career.mp_score);
			break;
		case _sr_item_medals:
			{
				long camp_medals = 0, mp_medals = 0;
				short m;
				for (m = 0; m < 38; m++)
				{
					camp_medals += career.medal_counts[m];
					mp_medals += career.mp_medal_counts[m];
				}
				snprintf(title, (size_t)title_size, "MEDAL TOTALS");
				snprintf(
					text,
					(size_t)text_size,
					"Campaign & Firefight Medals: %ld\n"
					"Multiplayer Medals: %ld\n"
					"Combined Total: %ld\n\n"
					"Each medal earned awards +100 XP\n"
					"toward your Service Rank.",
					camp_medals,
					mp_medals,
					camp_medals + mp_medals);
			}
			break;
		default:
			if (value >= _sr_item_map_base)
			{
				char map_key[32];
				struct firefight_map_record rec;
				if (firefight_stats_get_indexed_map_record((short)(value - _sr_item_map_base), NONE, map_key, sizeof(map_key), &rec))
				{
					snprintf(title, (size_t)title_size, "MAP: %s", map_key);
					snprintf(
						text,
						(size_t)text_size,
						"Best Score: %ld pts\n"
						"Highest Difficulty: %s\n"
						"Best Set/Round/Wave: S%d R%d W%d\n"
						"Active Skulls: %d\n"
						"Best Time: %ldm %02lds",
						rec.best_score,
						difficulty_label(rec.best_difficulty),
						(int)rec.best_set,
						(int)rec.best_round,
						(int)rec.best_wave,
						(int)rec.best_skulls,
						rec.best_seconds / 60L,
						rec.best_seconds % 60L);
				}
			}
			break;
		}
	}
	else if (list_kind == _social_ext_list_challenges)
	{
		if (value == 0)
		{
			struct community_challenge const *daily = community_daily();
			snprintf(title, (size_t)title_size, "COMMUNITY DAILY CHALLENGE");
			if (daily && daily->level[0])
			{
				snprintf(
					text,
					(size_t)text_size,
					"Day: %s (%s)\n"
					"Mission: %s on %s\n"
					"Skulls Active: %d\n"
					"Your Best: %s (%ld pts)\n"
					"Service Rank Reward: +5,000 XP\n\n"
					"Launch from PLAY > DAILY CHALLENGE\n"
					"on the main menu!",
					daily->day,
					daily->online ? "ONLINE" : "OFFLINE",
					daily->level,
					difficulty_label(daily->difficulty),
					(int)daily->skull_count,
					daily->has_mine ? "COMPLETED" : "NOT COMPLETED YET",
					daily->has_mine ? daily->mine_score : 0L);
			}
			else
			{
				snprintf(
					text,
					(size_t)text_size,
					"Today's seeded Campaign run with\n"
					"randomizer & skull modifiers.\n\n"
					"Completing the Daily Challenge awards\n"
					"+5,000 XP + Score Bonus toward your\n"
					"Service Rank!\n\n"
					"Launch from PLAY > DAILY CHALLENGE.");
			}
		}
		else
		{
			short period = 0, category = 0;
			struct firefight_challenge_view view;
			if (get_ext_challenge_by_slot(value, &period, &category, &view))
			{
				snprintf(title, (size_t)title_size, "%s", view.title);
				snprintf(
					text,
					(size_t)text_size,
					"Type: %s %s Challenge\n"
					"Objective: %s\n"
					"Progress: %ld / %ld (%s)\n"
					"Reward: +%ld Service Rank XP",
					period == _ff_challenge_period_daily ? "Daily" : "Weekly",
					category_full_label(category),
					view.description,
					view.progress,
					view.target,
					view.completed ? "COMPLETED" : "IN PROGRESS",
					view.xp_reward);
			}
		}
	}
	else if (list_kind == _social_ext_list_achievements)
	{
		char const *key = NULL;
		wchar_t const *wtitle = NULL;
		wchar_t const *wdesc = NULL;
		char title_buf[64];
		char desc_buf[128];
		short pts = firefight_stats_get_achievement_points(value);
		boolean unlocked = firefight_stats_is_achievement_unlocked(NONE, value);
		short total_unlocked = 0, total_count = 0, total_score = 0, max_score = 1000;

		firefight_stats_get_achievement_count(NONE, &total_unlocked, &total_count);
		firefight_stats_get_achievement_score(NONE, &total_score, &max_score);

		if (firefight_stats_get_achievement_info(value, &key, &wtitle, &wdesc))
		{
			wchar_to_ascii(wtitle, title_buf, sizeof(title_buf));
			wchar_to_ascii(wdesc, desc_buf, sizeof(desc_buf));
			snprintf(title, (size_t)title_size, "%s (%dG)", title_buf, (int)pts);
			snprintf(
				text,
				(size_t)text_size,
				"Status: %s\n"
				"Requirement: %s\n"
				"Reward: %d Gamerscore\n\n"
				"Total Progress: %d / %d (%d / %d G)",
				unlocked ? "UNLOCKED" : "LOCKED",
				desc_buf,
				(int)pts,
				(int)total_unlocked,
				(int)total_count,
				(int)total_score,
				(int)max_score);
		}
	}
}

static void cycle_emblem_option(short option_index, short delta)
{
	struct firefight_emblem_info emb;

	firefight_stats_get_emblem(NONE, &emb);
	switch (option_index)
	{
	case _emb_row_foreground:
		emb.foreground = (short)((emb.foreground + delta + FIREFIGHT_EMBLEM_FOREGROUND_COUNT) % FIREFIGHT_EMBLEM_FOREGROUND_COUNT);
		break;
	case _emb_row_secondary_layer:
		emb.secondary_layer = emb.secondary_layer ? FALSE : TRUE;
		break;
	case _emb_row_background:
		emb.background = (short)((emb.background + delta + FIREFIGHT_EMBLEM_BACKGROUND_COUNT) % FIREFIGHT_EMBLEM_BACKGROUND_COUNT);
		break;
	case _emb_row_primary_color:
		emb.primary_color = (short)((emb.primary_color + delta + FIREFIGHT_EMBLEM_COLOR_COUNT) % FIREFIGHT_EMBLEM_COLOR_COUNT);
		break;
	case _emb_row_secondary_color:
		emb.secondary_color = (short)((emb.secondary_color + delta + FIREFIGHT_EMBLEM_COLOR_COUNT) % FIREFIGHT_EMBLEM_COLOR_COUNT);
		break;
	case _emb_row_bg_color:
		emb.background_color = (short)((emb.background_color + delta + FIREFIGHT_EMBLEM_COLOR_COUNT) % FIREFIGHT_EMBLEM_COLOR_COUNT);
		break;
	case _emb_row_nameplate:
		emb.nameplate = (short)((emb.nameplate + delta + FIREFIGHT_NAMEPLATE_COUNT) % FIREFIGHT_NAMEPLATE_COUNT);
		break;
	default:
		return;
	}
	firefight_stats_set_emblem(NONE, &emb);
}

short social_extensions_choose(short list_kind, short row_kind, short value)
{
	if (row_kind == _social_ext_row_emblem)
		return _social_ext_list_emblem;
	if (row_kind == _social_ext_row_service_record)
		return _social_ext_list_service_record;
	if (row_kind == _social_ext_row_challenges)
		return _social_ext_list_challenges;
	if (row_kind == _social_ext_row_achievements)
		return _social_ext_list_achievements;
	if (list_kind == _social_ext_list_emblem && row_kind == _social_ext_row_item)
	{
		cycle_emblem_option(value, 1);
		return 0;
	}
	return 0;
}

boolean social_extensions_step_row(short list_kind, short row_kind, short value, short delta)
{
	if (list_kind == _social_ext_list_emblem && row_kind == _social_ext_row_item && delta != 0)
	{
		cycle_emblem_option(value, delta > 0 ? 1 : -1);
		return TRUE;
	}
	return FALSE;
}

static void draw_rect_quad(short x0, short y0, short x1, short y1, pixel32 color)
{
	rectangle2d r;

	r.x0 = x0;
	r.y0 = y0;
	r.x1 = x1;
	r.y1 = y1;
	draw_quad(&r, color);
}

void social_extensions_draw_details_overlay(
	short list_kind,
	short row_kind,
	short value,
	rectangle2d const *bounds)
{
	struct firefight_emblem_info emb;
	struct firefight_mcc_rank_info rk;
	short box_w, cx, emb_sz, box_x0, box_y0, box_x1, box_y1;
	short np_x0, np_y0, np_x1, np_y1, rk_sz;

	(void)row_kind;
	(void)value;
	if (!bounds)
		return;
	if (list_kind != _social_ext_list_emblem)
		return;

	firefight_stats_get_emblem(NONE, &emb);
	firefight_stats_get_mcc_rank(NONE, &rk);

	box_w = (short)(bounds->x1 - bounds->x0);
	cx = (short)(bounds->x0 + box_w / 2);
	emb_sz = 68;
	box_x0 = (short)(cx - emb_sz / 2 - 4);
	box_y0 = (short)(bounds->y0 + 2);
	box_x1 = (short)(cx + emb_sz / 2 + 4);
	box_y1 = (short)(box_y0 + emb_sz + 8);

	/* Live Emblem Preview Box */
	draw_rect_quad(box_x0, box_y0, box_x1, box_y1, 0xCC050E1A);
	draw_rect_quad(box_x0, box_y0, box_x1, (short)(box_y0 + 2), 0xFF2896FF);
	draw_rect_quad(box_x0, (short)(box_y1 - 2), box_x1, box_y1, 0xFF2896FF);
	draw_rect_quad(box_x0, box_y0, (short)(box_x0 + 2), box_y1, 0xFF2896FF);
	draw_rect_quad((short)(box_x1 - 2), box_y0, box_x1, box_y1, 0xFF2896FF);
	firefight_draw_player_emblem((short)(box_x0 + 4), (short)(box_y0 + 4), emb_sz, &emb, 1.0f);

	/* MCC Nameplate + Service Rank Badge + Mini Emblem below preview */
	np_x0 = (short)(bounds->x0 + 4);
	np_x1 = (short)(bounds->x1 - 4);
	np_y0 = (short)(box_y1 + 6);
	np_y1 = (short)(np_y0 + 34);
	rk_sz = 26;
	firefight_draw_mcc_nameplate(np_x0, np_y0, np_x1, np_y1, emb.nameplate, 0, 1.0f);
	firefight_draw_mcc_rank_icon(
		(short)(np_x0 + 6),
		(short)(np_y0 + 4),
		rk_sz,
		rk.tour_number > 0 ? rk.tour_number : 1,
		rk.rank_in_tour > 0 ? rk.rank_in_tour : 1,
		1.0f);
	firefight_draw_player_emblem(
		(short)(np_x0 + 6 + rk_sz + 4),
		(short)(np_y0 + 4),
		rk_sz,
		&emb,
		1.0f);
}

/* ---------- Player Card (_list_card) Header Addition */

real social_extensions_card_draw_section(
	struct campaign_score_panel const *panel,
	boolean draw,
	boolean is_self,
	char const *person_code,
	char const *person_name,
	real left,
	real right,
	real y,
	real row_height)
{
	real_argb_color gold = { 1.0f, { 1.0f, 0.84f, 0.35f } };
	real_argb_color cyan = { 1.0f, { 0.55f, 0.82f, 1.0f } };
	struct firefight_mcc_rank_info rk;
	struct firefight_emblem_info emb;
	struct firefight_career_stats career;
	short ach_unlocked = 0, ach_total = 0, ach_score = 0, ach_max = 1000;
	char line1[128];
	char line2[128];
	real icon_pad = 0.0f;

	if (is_self)
	{
		firefight_stats_get_mcc_rank(NONE, &rk);
		firefight_stats_get_emblem(NONE, &emb);
		firefight_stats_get_career(NONE, &career);
		firefight_stats_get_achievement_count(NONE, &ach_unlocked, &ach_total);
		firefight_stats_get_achievement_score(NONE, &ach_score, &ach_max);
	}
	else
	{
		social_extensions_get_person_rank_and_emblem(person_code, person_name, NONE, &rk, &emb);
		csmemset(&career, 0, sizeof(career));
	}

	if (draw)
	{
		short icon_x = (short)(panel->left + left * panel->scale);
		short icon_y = (short)(panel->top + y * panel->scale);
		short icon_sz = (short)((row_height * (is_self ? 2.0f : 1.4f) - 2.0f) * panel->scale);
		if (icon_sz < 16)
			icon_sz = 16;
#if OPENCE_ENABLE_SERVICE_RANK
		firefight_draw_mcc_rank_icon(icon_x, icon_y, icon_sz, rk.tour_number, rk.rank_in_tour, 1.0f);
		firefight_draw_player_emblem((short)(icon_x + icon_sz + 4), icon_y, icon_sz, &emb, 1.0f);
		icon_pad = (real)(icon_sz * 2 + 10) / panel->scale;
#else
		firefight_draw_player_emblem(icon_x, icon_y, icon_sz, &emb, 1.0f);
		icon_pad = (real)(icon_sz + 6) / panel->scale;
#endif
		if (is_self)
		{
			snprintf(
				line1,
				sizeof(line1),
				"SERVICE RANK: %s (%s)   XP: %ld / %ld",
				rk.rank_name,
				rk.tour_name,
				rk.xp_in_rank,
				rk.xp_for_next_rank);
			campaign_score_panel_text(
				panel,
				line1,
				NULL,
				left + icon_pad,
				right,
				y,
				1.0f,
				_campaign_score_text_left,
				&gold);

			snprintf(
				line2,
				sizeof(line2),
				"GAMERSCORE: %d/%dG (%d/%d)   FF SETS: %ld   FF KILLS: %ld",
				(int)ach_score,
				(int)ach_max,
				(int)ach_unlocked,
				(int)ach_total,
				career.total_sets_completed,
				career.total_kills);
			campaign_score_panel_text(
				panel,
				line2,
				NULL,
				left + icon_pad,
				right,
				y + row_height,
				1.0f,
				_campaign_score_text_left,
				&cyan);
		}
		else
		{
			snprintf(
				line1,
				sizeof(line1),
				"SERVICE RANK: %s (%s - Rank %d)",
				rk.rank_name,
				rk.tour_name,
				(int)rk.rank_in_tour);
			campaign_score_panel_text(
				panel,
				line1,
				NULL,
				left + icon_pad,
				right,
				y + row_height * 0.2f,
				1.0f,
				_campaign_score_text_left,
				&gold);
		}
	}

	return y + row_height * (is_self ? 2.0f : 1.4f) + 4.0f;
}
