/*
SOCIAL_EXTENSIONS.H

Compartmentalised extensions for Watanoge's Social Menu (social_menu.c):
- Customise Emblem editor & live preview (_social_ext_list_emblem)
- Service Record & MCC Service Rank (service_rank.c)
- Unified Challenges: Watanoge's Daily Challenge (community.c) + Daily & Weekly
  Campaign, Firefight, and Multiplayer challenges (firefight_stats.c)
- 39 Achievements (1000G) browser
- Player Card (_list_card) Emblem, Service Rank icon, rank and XP bar
*/

#ifndef __SOCIAL_EXTENSIONS_H
#define __SOCIAL_EXTENSIONS_H

#include "cseries.h"
#include "opence_features.h"
#include "campaign_score.h"
#include "halo_firefight.h"

/* Extension sub-list IDs for social_menu.c */
enum
{
	_social_ext_list_service_record = 100,
	_social_ext_list_challenges = 101,
	_social_ext_list_achievements = 102,
	_social_ext_list_emblem = 103,
};

/* Extension row kinds for social_menu.c */
enum
{
	_social_ext_row_service_record = 100,
	_social_ext_row_challenges = 101,
	_social_ext_row_achievements = 102,
	_social_ext_row_item = 103,
	_social_ext_row_emblem = 104,
};

typedef void (*social_ext_row_add_fn)(short kind, short value);

boolean social_extensions_is_ext_list(short list_kind);
boolean social_extensions_is_ext_row(short row_kind);

char const *social_extensions_list_title(short list_kind);

void social_extensions_add_home_rows(social_ext_row_add_fn add_fn);
void social_extensions_build_list_rows(short list_kind, social_ext_row_add_fn add_fn);

void social_extensions_row_text(
	short list_kind,
	short row_kind,
	short value,
	char *name,
	long name_size,
	char *state,
	long state_size);

void social_extensions_row_details(
	short list_kind,
	short row_kind,
	short value,
	char *title,
	long title_size,
	char *text,
	long text_size);

/* Returns a list_kind to open (> 0), or 0 to stay on the current list */
short social_extensions_choose(short list_kind, short row_kind, short value);

/* Left/Right step on an extension row (e.g. Customise Emblem options) */
boolean social_extensions_step_row(short list_kind, short row_kind, short value, short delta);

/* The emblem a row shows in its state's place (the CUSTOMISE EMBLEM row, and
its list's emblem and background): TRUE and out_emblem for such a row, and
out_part the part of it to show: the whole, or what the row chooses */
boolean social_extensions_row_emblem(
	short list_kind,
	short row_kind,
	short value,
	struct firefight_emblem_info *out_emblem,
	short *out_part);

/* Draws the live emblem preview in the Social details pane, on the CUSTOMISE
EMBLEM row and in its list */
void social_extensions_draw_details_overlay(
	short list_kind,
	short row_kind,
	short value,
	rectangle2d const *bounds);

/* Draws the player's emblem on the Player Card, `size` wide from x, y in the panel's units */
void social_extensions_card_draw_emblem(
	struct campaign_score_panel const *panel,
	boolean is_self,
	char const *person_code,
	char const *person_name,
	real x,
	real y,
	real size);

/* Draws the Service Rank icon, rank, XP bar and XP on the Player Card */
real social_extensions_card_draw_section(
	struct campaign_score_panel const *panel,
	boolean draw,
	boolean is_self,
	char const *person_code,
	char const *person_name,
	real left,
	real right,
	real y,
	real row_height);

/* Person / Friend Rank & Emblem cache and deterministic lookup */
void social_extensions_cache_person_stats(
	char const *code,
	char const *name,
	long total_xp,
	struct firefight_emblem_info const *emblem_opt);

boolean social_extensions_has_cached_person(char const *code);

void social_extensions_get_person_rank_and_emblem(
	char const *code,
	char const *name,
	short color_hint,
	struct firefight_mcc_rank_info *out_rank,
	struct firefight_emblem_info *out_emblem);

void social_extensions_get_wide_name_rank_and_emblem(
	wchar_t const *wide_name,
	short color_hint,
	struct firefight_mcc_rank_info *out_rank,
	struct firefight_emblem_info *out_emblem);

#endif /* __SOCIAL_EXTENSIONS_H */
