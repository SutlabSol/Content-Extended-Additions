/*
SOCIAL_EXTENSIONS.H

Compartmentalised extensions for Watanoge's Social Menu (social_menu.c):
- Service Record & MCC Service Rank (service_rank.c)
- Unified Challenges: Watanoge's Daily Challenge (community.c) + Daily & Weekly
  Campaign, Firefight, and Multiplayer challenges (firefight_stats.c)
- 39 Achievements (1000G) browser
- Player Card (_list_card) Service Rank icon, XP, Gamerscore & Firefight summary
*/

#ifndef __SOCIAL_EXTENSIONS_H
#define __SOCIAL_EXTENSIONS_H

#include "cseries.h"
#include "opence_features.h"
#include "campaign_score.h"

/* Extension sub-list IDs for social_menu.c */
enum
{
	_social_ext_list_service_record = 100,
	_social_ext_list_challenges = 101,
	_social_ext_list_achievements = 102,
};

/* Extension row kinds for social_menu.c */
enum
{
	_social_ext_row_service_record = 100,
	_social_ext_row_challenges = 101,
	_social_ext_row_achievements = 102,
	_social_ext_row_item = 103,
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

/* Draws Service Rank emblem, Tour/Rank, Gamerscore, and Firefight summary on the Player Card */
real social_extensions_card_draw_section(
	struct campaign_score_panel const *panel,
	boolean draw,
	boolean is_self,
	real left,
	real right,
	real y,
	real row_height);

#endif /* __SOCIAL_EXTENSIONS_H */
