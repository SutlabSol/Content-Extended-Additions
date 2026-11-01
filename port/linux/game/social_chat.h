/*
SOCIAL_CHAT.H

This fork's chat (social_chat.c): one chat box, in the game and the menus
alike, whose lines are network_chat.c's (the upstream chat, which it hides)
and the community server's (the fork's chat: social.c's account), each line
marked with where it came from. What the main loop, the drawing, the
keyboard and the controllers (through network_chat.c's typing state) and the
upstream chat ask of it.
*/

#ifndef __SOCIAL_CHAT_H
#define __SOCIAL_CHAT_H

/* where a line goes: the match's players (the upstream chat's everyone, and
the fork's players in the same game), the team's, one account, or every
player of the fork's online */
enum
{
	_social_chat_match,
	_social_chat_team,
	_social_chat_private,
	_social_chat_global,
	NUMBER_OF_SOCIAL_CHAT_CHANNELS
};

/* (social.c) each frame: the lines asked for and sent, the box opened, and
what is typed */
void social_chat_update(void);
/* (interface.c, over the whole screen before the overlay menu) the box */
void social_chat_draw(void);

/* social.chat: the box is shown in place of the upstream chat's lines, and
the chat's keys open it (network_chat.c asks) */
boolean social_chat_replaces_upstream(void);
/* (network_chat.c, as its keys are pressed in a network game) the box opened
to a channel (_social_chat_*), by a controller's port (NONE: the keyboard,
which types) */
void social_chat_open(short channel, short port);
/* (social_menu.c's SEND MESSAGE) the box opened to PRIVATE, to the account
of this code (its name as shown), typed on the keyboard or the on-screen
one as the player last used */
void social_chat_open_private(char const *code, wchar_t const *name);
/* (social_menu.c's RECENT PLAYERS) the accounts a private line may go to
(this game's room's, those that wrote or were written to), the newest first:
how many, at most maximum */
short social_chat_recent_players(char (*codes)[16], wchar_t (*names)[32], short maximum);
/* (social_menu.c) the names of the players muted or blocked: their
upstream lines hidden (the server leaves out their fork lines) */
void social_chat_unheard_set(wchar_t const (*names)[32], short count);
/* (overlay_menu.c) L, R and the d-pad's up pressed together on a
controller's port: the box opened, in the game or the menus, or closed */
void social_chat_toggle_request(short port);

/* (network_chat.c's typing state, which the platform's input reads) a line
is typed in the box; with the on-screen keyboard; and its controller's port
(NONE for none) */
boolean social_chat_typing(void);
boolean social_chat_keyboard_open(void);
short social_chat_controller(void);

/* (network_chat.c) a line the upstream chat shows: its player's name, its
team's colour (0 red, 1 blue, NONE none), to the team or not, its text; and
a notice of the host's */
void social_chat_upstream_line(wchar_t const *name, short color, boolean team, char const *text);
void social_chat_upstream_notice(char const *text);

#endif
