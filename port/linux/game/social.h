/*
SOCIAL.H

This fork's social side (social.c, social_chat.c): the install's account on
the community server, the records of its players' matches and levels sent to
it, and the fork's chat (social_chat.h).
*/

#ifndef __SOCIAL_H
#define __SOCIAL_H

struct community_run;

/* (main.c's main loop) each frame, after community_update: the account asked
for, a match over recorded, the records not sent yet sent again */
void social_update(void);

/* social.enabled, with community.enabled: the account is asked for, its
records sent, and the fork's chat online */
boolean social_enabled(void);

/* the account's code ("XXXX-XXXX"), "" until the server says it */
char const *social_account_code(void);

/* the name the account goes by: player 1's profile's (ASCII, '?' for what it
has not), "" for none */
void social_player_name(char *name, long size);

/* asks the community server for path as the account (the install's key, no
profile's): a GET, or with body (JSON text) a POST. A ticket for
community_net_poll, 0 when it cannot be asked */
int social_send(char const *path, char const *body);

/* (campaign_score.c) a campaign level won by a player of this machine (its
absolute index, NONE for none), the run as the leaderboards have it, the
level's tag name (levels\a10\a10), and its profile's name */
void social_level_won(short player_index, struct community_run const *run, char const *level_name,
	wchar_t const *name);

#endif
