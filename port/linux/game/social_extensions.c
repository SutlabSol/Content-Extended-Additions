/*
SOCIAL_EXTENSIONS.C

Compartmentalised extensions for Watanoge's Social Menu (social_menu.c):
- Service Record & MCC Service Rank (service_rank.c)
- Unified Challenges: Watanoge's Daily Challenge (community.c) + Daily & Weekly
  Campaign, Firefight, and Multiplayer challenges (firefight_stats.c)
- 39 Achievements (1000G) browser
- Player Card (_list_card) Service Rank icon, XP, Gamerscore & Firefight summary
*/

#include <stdio.h>
#include <string.h>

#include "cseries.h"
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
		list_kind == _social_ext_list_achievements;
}

boolean social_extensions_is_ext_row(short row_kind)
{
	return row_kind == _social_ext_row_service_record ||
		row_kind == _social_ext_row_challenges ||
		row_kind == _social_ext_row_achievements ||
		row_kind == _social_ext_row_item;
}

char const *social_extensions_list_title(short list_kind)
{
	switch (list_kind)
	{
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

	if (list_kind == _social_ext_list_service_record)
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

short social_extensions_choose(short list_kind, short row_kind, short value)
{
	(void)list_kind;
	(void)value;

	if (row_kind == _social_ext_row_service_record)
		return _social_ext_list_service_record;
	if (row_kind == _social_ext_row_challenges)
		return _social_ext_list_challenges;
	if (row_kind == _social_ext_row_achievements)
		return _social_ext_list_achievements;
	return 0;
}

/* ---------- Player Card (_list_card) Header Addition */

real social_extensions_card_draw_section(
	struct campaign_score_panel const *panel,
	boolean draw,
	boolean is_self,
	real left,
	real right,
	real y,
	real row_height)
{
	real_argb_color gold = { 1.0f, { 1.0f, 0.84f, 0.35f } };
	real_argb_color cyan = { 1.0f, { 0.55f, 0.82f, 1.0f } };
	real_argb_color white = { 1.0f, { 0.95f, 0.95f, 0.95f } };
	struct firefight_mcc_rank_info rk;
	struct firefight_career_stats career;
	short ach_unlocked = 0, ach_total = 0, ach_score = 0, ach_max = 1000;
	char line1[128];
	char line2[128];
	real icon_pad = 0.0f;

	if (!is_self)
		return y;

	firefight_stats_get_mcc_rank(NONE, &rk);
	firefight_stats_get_career(NONE, &career);
	firefight_stats_get_achievement_count(NONE, &ach_unlocked, &ach_total);
	firefight_stats_get_achievement_score(NONE, &ach_score, &ach_max);

	if (draw)
	{
#if OPENCE_ENABLE_SERVICE_RANK
		short icon_x = (short)(panel->left + left * panel->scale);
		short icon_y = (short)(panel->top + y * panel->scale);
		short icon_sz = (short)((row_height * 2.0f - 2.0f) * panel->scale);
		if (icon_sz < 16)
			icon_sz = 16;
		firefight_draw_mcc_rank_icon(icon_x, icon_y, icon_sz, rk.tour_number, rk.rank_in_tour, 1.0f);
		icon_pad = (real)icon_sz / panel->scale + 6.0f;
#endif
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
		(void)white;
	}

	return y + row_height * 2.0f + 4.0f;
}
