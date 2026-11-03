/*
SOCIAL_SYNC.H

Account sync's game side (social_sync.c): the skulls the installs of one
account share. The server (POST /account/skulls) keeps their unlock style and
the skulls unlocked; each install sends its own and takes the account's.
Nothing else of the install is shared this way: profiles, controls, campaign
progress and the other settings stay on it.
*/

#ifndef __SOCIAL_SYNC_H
#define __SOCIAL_SYNC_H

struct server_json;

/* (social.c's social_update) while the install's account has others: its
skulls are sent when they change, and about every 20 seconds taken from the
server */
void social_sync_update(unsigned long now);

/* an answer of the server's that has the account ({data: {account:
{synced}}}) or its skulls ({data: {skulls}}): whether the install shares its
account is learned from the first, the skulls are taken from the second */
void social_sync_answer(char const *answer);

/* whether other installs are part of the account */
boolean social_sync_active(void);

/* the skulls as the server is sent them (an object named key, none for the
root's): the style, the skulls unlocked, and what the install last had of the
server's */
void social_sync_skulls_write(struct server_json *json, char const *key);

/* the skulls' progress was reset on this install (Settings > Gameplay):
the next sending tells the account to start again */
void social_sync_skulls_reset(void);

/* the skulls are asked for again at once */
void social_sync_pull_soon(void);

#endif
