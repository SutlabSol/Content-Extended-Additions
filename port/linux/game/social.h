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
/* (social_menu.c's NEW CODE) the account's code from an answer of the
server's ({data: {account: {code}}}): FALSE for none in it */
boolean social_account_code_take(char const *answer);

/* the account's multiplayer totals, as the server last said them (as the
game starts, and after each record): FALSE until it has */
boolean social_account_totals(long *matches, long *kills, long *deaths, long *assists);

/* the server's last answer to what the game is doing: the friends online,
and the friend requests waiting */
void social_presence_counts(long *friends_online, long *requests_waiting);

/* the name the account goes by: player 1's profile's (ASCII, '?' for what it
has not), "" for none */
void social_player_name(char *name, long size);

/* the name the account is known by in the chat on every device: the one it
picked in Social (CHAT NAME), else player 1's profile's (as social_player_name) */
void social_account_name(char *name, long size);
/* whether the account picked one (else the profile's is used) */
boolean social_account_name_picked(void);
/* the colour the chat shows the name in (0 to 1 each): FALSE for none picked */
boolean social_account_name_color(real *red, real *green, real *blue);
/* the name and colour from an answer of the server's to POST /account/name
({data: {account: {displayName, nameColor}}}) */
void social_account_name_take(char const *answer);

/* asks the community server for path as the account (the install's key, no
profile's): a GET, or with body (JSON text) a POST. A ticket for
community_net_poll, 0 when it cannot be asked */
int social_send(char const *path, char const *body);

/* (ui_widget_event_handler_functions.c's network_game_remove_local_player)
a player of this machine quit the multiplayer game being played: if it is
left before its end, it is recorded as a quit */
void social_match_quit(void);

/* (ui_widget.c's display_error_when_main_menu_loaded) why the game being
left ends (_error_network_connection_lost: the network lost;
_error_network_server_shut_down: its host ended it) */
void social_match_error(short error_code);

/* (campaign_score.c) a campaign level won by a player of this machine (its
absolute index, NONE for none), the run as the leaderboards have it, the
level's tag name (levels\a10\a10), and its profile's name */
void social_level_won(short player_index, struct community_run const *run, char const *level_name,
	wchar_t const *name);

#endif
