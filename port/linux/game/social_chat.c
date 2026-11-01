/*
SOCIAL_CHAT.C

This fork's chat (social_chat.h): one box for the upstream chat's lines
(network_chat.c, whose own lines it hides) and the fork's, which go through
the community server as the install's account (social.c; api-opence's
/chat/messages), in the game and the menus alike.

- The channels: MATCH (the upstream chat's everyone, and the fork's players
  in the same network game), TEAM (the team's, both ways too), PRIVATE (one
  account: a player of the fork's in the same game, or one who wrote to this
  one) and GLOBAL (every player of the fork's online). A line goes through
  the upstream chat where the game's host lets it (network_chat_available),
  and through the fork's wherever it can (the community server reached, a
  network game's room for MATCH and TEAM): its fork players hear it whatever
  the host's settings or the server browser's rules, its other players as
  the host lets them.
- A line heard both ways (a fork player's, said both ways) is shown once:
  the second, the same player's same text within SOCIAL_CHAT_SAME_MILLISECONDS,
  marks the first as heard both ways. Each line shows where it came from: U
  (the upstream chat), F (the fork's), U+F.
- A network game's room is a key every machine in it makes alike: a hash of
  the game's name, its map and its random seed (network_game), which the
  host sends every client.
- Opening it: in a network game, the upstream chat's keys (network_chat.c
  asks social_chat_open: T, Y, D-pad Up and the controls' chat actions);
  elsewhere (the menus, the campaign), T and Y on the keyboard; on any
  controller, L, R and the d-pad's up together (overlay_menu.c). While it is
  open: Tab (or D-pad Up and Down) the channel, Up and Down (or Y) who a
  private line goes to, Page Up and Page Down (or the wheel) back through the
  lines, Enter (or Start) sends, Escape (or B) closes. A controller types on
  the on-screen keyboard as the upstream chat's (the stick moves, A presses,
  X deletes), the touchscreen taps its keys. The platform's input takes it
  as the upstream chat's typing (network_chat_typing and the rest ask here).
- Closed, the latest lines show a while and fade (not in a cinematic);
  display.text_chat hides it all. social.chat turns it on (else the upstream
  chat is as it was); social.global_chat whether GLOBAL is heard.

The fork's lines are asked for every SOCIAL_CHAT_POLL_FAST_MILLISECONDS in a
network game or with the box open, else every SOCIAL_CHAT_POLL_MILLISECONDS:
the server answers those after the last one had (its cursor), the first time
its last few (shown in the box's history, not as new).
*/

#include "cseries.h"
#include "cseries/errors.h"
#include "cutscene/cinematics.h"
#include "game/game.h"
#include "game/game_engine.h"
#include "game/players.h"
#include "memory/data.h"
#include "input/input.h"
#include "interface/hud.h"
#include "interface/interface.h"
#include "interface/ui_widget.h"
#include "main/console.h"
#include "networking/network_game_globals.h"
#include "networking/network_game_manager.h"
#include "rasterizer/rasterizer.h"
#include "render/render.h"
#include "scenario/scenario.h"
#include "tag_files/tag_files.h"
#include "tag_files/tag_groups.h"
#include "text/draw_string.h"
#include "text/font_group.h"
#include "text/unicode.h"

#include "halo_keyboard.h"
#include "network_chat.h"
#include "network_replay.h"
#include "social.h"
#include "social_chat.h"
#include "../src/community_net.h"
#include "../src/port_config.h"
#include "../src/server_json.h"

#include <stdio.h>
#include <string.h>

void platform_log(char const *format, ...);
unsigned long system_milliseconds(void);
unsigned long config_changes(void);
int platform_clipboard_get(char *text, int size);

/* ---------- constants */

enum
{
	/* a line's text, with its end: the upstream chat's (a line said both
	ways is the same both ways); one of the fork's heard, longer */
	SOCIAL_CHAT_SAID_SIZE = 64,
	SOCIAL_CHAT_TEXT_SIZE = 204,
	SOCIAL_CHAT_NAME_SIZE = 33,
	SOCIAL_CHAT_CODE_SIZE = 16,
	SOCIAL_CHAT_ROOM_SIZE = 24,
	/* the lines kept, and those shown at once: open, and closed */
	SOCIAL_CHAT_MAXIMUM_LINES = 96,
	SOCIAL_CHAT_LINES_OPEN = 10,
	SOCIAL_CHAT_LINES_CLOSED = 5,
	/* the rows a line wraps to, at most */
	SOCIAL_CHAT_LINE_ROWS = 4,
	/* a line shown closed, then faded out */
	SOCIAL_CHAT_LINE_MILLISECONDS = 10000,
	SOCIAL_CHAT_FADE_MILLISECONDS = 1000,
	/* the same line heard the other way, this soon */
	SOCIAL_CHAT_SAME_MILLISECONDS = 8000,
	/* the fork's lines asked for */
	SOCIAL_CHAT_POLL_FAST_MILLISECONDS = 1500,
	SOCIAL_CHAT_POLL_MILLISECONDS = 6000,
	/* ... again after the server was not reached */
	SOCIAL_CHAT_POLL_RETRY_MILLISECONDS = 15000,
	/* the players a private line may go to, at most */
	SOCIAL_CHAT_MAXIMUM_PEERS = 32,
	SOCIAL_CHAT_CARET_MILLISECONDS = 500,
	/* a toggle this soon after the box opened is the same press (L, R and
	up in a network game: its up opens it too, network_chat.c) */
	SOCIAL_CHAT_TOGGLE_MILLISECONDS = 300,
	SOCIAL_CHAT_PAGE_LINES = 3,
	/* the on-screen keyboard: as the upstream chat's (network_chat.c) */
	SOCIAL_CHAT_KEYBOARD_COLUMNS = 10,
	SOCIAL_CHAT_KEYBOARD_ROWS = 5,
	SOCIAL_CHAT_KEYBOARD_WIDE_COLUMNS = 2,
	SOCIAL_CHAT_KEYBOARD_REPEAT_FIRST_MILLISECONDS = 350,
	SOCIAL_CHAT_KEYBOARD_REPEAT_MILLISECONDS = 120,
	SOCIAL_CHAT_KEYBOARD_PERCENT = 44,
	SOCIAL_CHAT_KEY_GAP = 2,
	/* the box: its left and width, and (closed, or with no touch controls)
	its bottom, in hundredths of the screen's; with the touch controls its
	top instead */
	SOCIAL_CHAT_LEFT_PERCENT = 2,
	SOCIAL_CHAT_WIDTH_PERCENT = 46,
	SOCIAL_CHAT_BOTTOM_PERCENT = 72,
	SOCIAL_CHAT_TOUCH_TOP_PERCENT = 14,
	SOCIAL_CHAT_PADDING = 6,
	/* a key's Ctrl (struct key_stroke's modifier_flags: menu_functions.c's) */
	SOCIAL_CHAT_KEY_MODIFIER_CONTROL_BIT = 1,
};

/* where a line came from (a bit each) */
enum
{
	_social_chat_upstream_bit,
	_social_chat_fork_bit,
};

/* a line's name's colour */
enum
{
	_social_chat_color_none,
	_social_chat_color_red,
	_social_chat_color_blue,
	_social_chat_color_notice,
	_social_chat_color_mine,
};

/* the on-screen keyboard's last row's wide keys */
enum
{
	_social_chat_key_shift,
	_social_chat_key_symbols,
	_social_chat_key_space,
	_social_chat_key_delete,
	_social_chat_key_send,
};

/* ---------- structures */

struct social_chat_line
{
	wchar_t name[SOCIAL_CHAT_NAME_SIZE];
	char text[SOCIAL_CHAT_TEXT_SIZE];
	/* a private line's other account: its code and name */
	char peer[SOCIAL_CHAT_CODE_SIZE];
	wchar_t peer_name[SOCIAL_CHAT_NAME_SIZE];
	short channel;
	short color;
	byte sources;
	boolean mine;
	boolean notice;
	/* (system_milliseconds; 0: an old line, the history's, never shown as new) */
	unsigned long time;
};

/* an account a private line may go to */
struct social_chat_peer
{
	char code[SOCIAL_CHAT_CODE_SIZE];
	wchar_t name[SOCIAL_CHAT_NAME_SIZE];
	/* in this game's room (else one that wrote, or was written to) */
	boolean in_room;
};

/* ---------- globals */

static struct
{
	/* the lines, the newest at newest */
	struct social_chat_line lines[SOCIAL_CHAT_MAXIMUM_LINES];
	short line_count;
	short newest;
	/* the box open: the channel, the line typed, the lines scrolled past,
	and the port of the controller typing (NONE: the keyboard) */
	boolean open;
	short channel;
	short port;
	unsigned long opened_at;
	char typed[SOCIAL_CHAT_SAID_SIZE];
	short scroll;
	/* the keyboard's chat keys held last frame; a toggle asked for, by a
	controller's port */
	unsigned long keys_held;
	short toggle_port;
	/* the private line's account (in peers) */
	struct social_chat_peer peers[SOCIAL_CHAT_MAXIMUM_PEERS];
	short peer_count;
	short peer;
	/* the fork's lines: the request asked, the last line had, and when to
	ask next; the account's code the server last said */
	int poll_ticket;
	int send_ticket;
	long cursor;
	boolean polled;
	unsigned long poll_at;
	char room[SOCIAL_CHAT_ROOM_SIZE];
	char answer[COMMUNITY_NET_ANSWER_MAXIMUM];
} social_chat = { { 0 }, 0, 0, FALSE, 0, NONE, 0 };

/* the on-screen keyboard */
static struct
{
	boolean open;
	short row;
	short column;
	boolean shift;
	boolean symbols;
	/* the controller's buttons last frame, and when a held direction moves
	the key again */
	unsigned long held;
	unsigned long opening;
	unsigned long repeat_at;
	/* where its keys were last drawn, in thousandths of the screen (a
	tap's place) */
	boolean drawn;
	short left;
	short top;
	short right;
	short bottom;
} social_chat_keyboard;

static char const *const social_chat_letters[SOCIAL_CHAT_KEYBOARD_ROWS - 1] =
	{ "1234567890", "qwertyuiop", "asdfghjkl'", "zxcvbnm,.?" };
static char const *const social_chat_symbols[SOCIAL_CHAT_KEYBOARD_ROWS - 1] =
	{ "1234567890", "!@#$%^&*()", "-_=+[]{};:", "\"'<>/\\?~,." };
static char const *const social_chat_channel_names[NUMBER_OF_SOCIAL_CHAT_CHANNELS] =
	{ "MATCH", "TEAM", "PRIVATE", "GLOBAL" };
static wchar_t const *const social_chat_channel_tags[NUMBER_OF_SOCIAL_CHAT_CHANNELS] =
	{ L"", L"[TEAM] ", L"[PM] ", L"[ALL] " };

/* ---------- settings */

/* a setting read again only when Settings changes it */
static boolean social_chat_setting(
	char const *name,
	unsigned long *read_at,
	boolean *value)
{
	if (*read_at != config_changes())
	{
		*read_at = config_changes();
		*value = config_boolean(name) != 0;
	}
	return *value;
}

boolean social_chat_replaces_upstream(
	void)
{
	static unsigned long read_at = (unsigned long)-1;
	static boolean on;

	return social_chat_setting("social.chat", &read_at, &on);
}

static boolean social_chat_shown(
	void)
{
	static unsigned long read_at = (unsigned long)-1;
	static boolean shown;

	return social_chat_replaces_upstream() && social_chat_setting("display.text_chat", &read_at, &shown);
}

static boolean social_chat_global_heard(
	void)
{
	static unsigned long read_at = (unsigned long)-1;
	static boolean heard;

	return social_chat_setting("social.global_chat", &read_at, &heard);
}

/* the fork's chat can be reached (the account's requests) */
static boolean social_chat_online(
	void)
{
	return social_chat_replaces_upstream() && social_enabled();
}

/* ---------- text */

/* printable ASCII but "|" (the game's text drawing takes it for a code's
start): "?" for any other, at most size - 1 characters */
static void social_chat_clean(
	char *text,
	char const *source,
	long size)
{
	long length = 0;
	unsigned char const *cursor = (unsigned char const *)source;

	while (*cursor && length < size - 1)
	{
		unsigned char character = *cursor++;

		/* (a UTF-8 sequence is one character the font has not) */
		if (character >= 0x80)
		{
			while ((*cursor & 0xC0) == 0x80)
				cursor++;
			character = '?';
		}
		else if (character < ' ' || character == 0x7F || character == '|')
		{
			character = character < ' ' ? ' ' : '?';
		}
		text[length++] = (char)character;
	}
	text[length] = 0;
}

static void social_chat_wide_from_ascii(
	char const *text,
	wchar_t *wide,
	long count)
{
	long index;

	for (index = 0; index < count - 1 && text[index]; index++)
		wide[index] = (wchar_t)(unsigned char)text[index];
	wide[index] = 0;
}

/* a name as the game's text (the basic plane of UTF-8; '?' past it) */
static void social_chat_wide_from_utf8(
	char const *text,
	wchar_t *wide,
	long count)
{
	long length = 0;
	unsigned char const *cursor = (unsigned char const *)text;

	while (*cursor && length < count - 1)
	{
		unsigned long character = *cursor++;

		if (character >= 0xE0 && (cursor[0] & 0xC0) == 0x80 && (cursor[1] & 0xC0) == 0x80 && character < 0xF0)
		{
			character = ((character & 0x0F) << 12) | ((cursor[0] & 0x3F) << 6) | (cursor[1] & 0x3F);
			cursor += 2;
		}
		else if (character >= 0xC0 && character < 0xE0 && (cursor[0] & 0xC0) == 0x80)
		{
			character = ((character & 0x1F) << 6) | (cursor[0] & 0x3F);
			cursor++;
		}
		else if (character >= 0x80)
		{
			while ((*cursor & 0xC0) == 0x80)
				cursor++;
			character = '?';
		}
		wide[length++] = (wchar_t)character;
	}
	wide[length] = 0;
}

static wchar_t social_chat_lower(
	wchar_t character)
{
	return character >= 'A' && character <= 'Z' ? (wchar_t)(character - 'A' + 'a') : character;
}

/* two names the same, in either case (the upstream chat's players' names
are its game's, the fork's its accounts') */
static boolean social_chat_names_equal(
	wchar_t const *a,
	wchar_t const *b)
{
	while (*a && *b && social_chat_lower(*a) == social_chat_lower(*b))
	{
		a++;
		b++;
	}
	return !*a && !*b;
}

static void social_chat_append(
	char *text,
	char const *more)
{
	long length = (long)strlen(text);

	while (*more && length < SOCIAL_CHAT_SAID_SIZE - 1)
	{
		if (*more >= ' ' && *more <= '~' && *more != '|')
			text[length++] = *more;
		more++;
	}
	text[length] = 0;
}

/* ---------- the lines */

static struct social_chat_line *social_chat_line_at(
	short back)
{
	short index = (short)((social_chat.newest - back + SOCIAL_CHAT_MAXIMUM_LINES) % SOCIAL_CHAT_MAXIMUM_LINES);

	return back >= 0 && back < social_chat.line_count ? &social_chat.lines[index] : NULL;
}

/* the same line heard the other way lately (its player's name and text, a
channel that is the same both ways), NULL for none */
static struct social_chat_line *social_chat_same_line(
	wchar_t const *name,
	short channel,
	char const *text,
	byte source_bit)
{
	unsigned long now = system_milliseconds();
	short back;

	for (back = 0; back < social_chat.line_count; back++)
	{
		struct social_chat_line *line = social_chat_line_at(back);

		if (!line->time || now - line->time > SOCIAL_CHAT_SAME_MILLISECONDS)
			break;
		if (!line->notice && !TEST_FLAG(line->sources, source_bit) && line->channel == channel &&
			!strncmp(line->text, text, SOCIAL_CHAT_SAID_SIZE - 1) && social_chat_names_equal(line->name, name))
		{
			return line;
		}
	}
	return NULL;
}

static struct social_chat_line *social_chat_line_new(
	unsigned long time)
{
	struct social_chat_line *line;

	social_chat.newest = (short)((social_chat.newest + 1) % SOCIAL_CHAT_MAXIMUM_LINES);
	if (social_chat.line_count < SOCIAL_CHAT_MAXIMUM_LINES)
		social_chat.line_count++;
	line = &social_chat.lines[social_chat.newest];
	csmemset(line, 0, sizeof(*line));
	line->time = time;
	/* (the box's place kept while it is scrolled back) */
	if (social_chat.scroll)
		social_chat.scroll++;
	return line;
}

static void social_chat_notice(
	char const *text)
{
	struct social_chat_line *line = social_chat_line_new(system_milliseconds());

	social_chat_clean(line->text, text, SOCIAL_CHAT_TEXT_SIZE);
	line->notice = TRUE;
	line->color = _social_chat_color_notice;
	line->channel = _social_chat_match;
	error(_error_log, "social chat notice: %s", line->text);
}

void social_chat_upstream_line(
	wchar_t const *name,
	short color,
	boolean team,
	char const *text)
{
	short channel = team ? _social_chat_team : _social_chat_match;
	struct social_chat_line *line = social_chat_same_line(name, channel, text, _social_chat_upstream_bit);

	if (line)
	{
		SET_FLAG(line->sources, _social_chat_upstream_bit, TRUE);
		return;
	}
	line = social_chat_line_new(system_milliseconds());
	ustrncpy(line->name, name, SOCIAL_CHAT_NAME_SIZE - 1);
	social_chat_clean(line->text, text, SOCIAL_CHAT_TEXT_SIZE);
	line->channel = channel;
	line->color = color == 0 ? _social_chat_color_red : color == 1 ? _social_chat_color_blue : _social_chat_color_none;
	SET_FLAG(line->sources, _social_chat_upstream_bit, TRUE);
}

void social_chat_upstream_notice(
	char const *text)
{
	struct social_chat_line *line = social_chat_line_new(system_milliseconds());

	social_chat_clean(line->text, text, SOCIAL_CHAT_TEXT_SIZE);
	line->notice = TRUE;
	line->color = _social_chat_color_notice;
	SET_FLAG(line->sources, _social_chat_upstream_bit, TRUE);
}

/* ---------- the private lines' accounts */

static short social_chat_peer_find(
	char const *code)
{
	short index;

	for (index = 0; index < social_chat.peer_count; index++)
	{
		if (!strcmp(social_chat.peers[index].code, code))
			return index;
	}
	return NONE;
}

/* an account noted (the room's, or one that wrote or was written to) */
static void social_chat_peer_note(
	char const *code,
	wchar_t const *name,
	boolean in_room)
{
	short index;

	if (!code[0] || !strcmp(code, social_account_code()))
		return;
	index = social_chat_peer_find(code);
	if (index == NONE)
	{
		if (social_chat.peer_count >= SOCIAL_CHAT_MAXIMUM_PEERS)
		{
			/* (the oldest that is not the one picked gives way) */
			short oldest = (short)(social_chat.peer == 0 ? 1 : 0);

			csmemmove(&social_chat.peers[oldest], &social_chat.peers[oldest + 1],
				(SOCIAL_CHAT_MAXIMUM_PEERS - oldest - 1) * sizeof(social_chat.peers[0]));
			social_chat.peer_count--;
			if (social_chat.peer > oldest)
				social_chat.peer--;
		}
		index = social_chat.peer_count++;
		csmemset(&social_chat.peers[index], 0, sizeof(social_chat.peers[index]));
		csstrncpy(social_chat.peers[index].code, code, SOCIAL_CHAT_CODE_SIZE - 1);
	}
	ustrncpy(social_chat.peers[index].name, name, SOCIAL_CHAT_NAME_SIZE - 1);
	social_chat.peers[index].in_room = social_chat.peers[index].in_room || in_room;
}

static struct social_chat_peer const *social_chat_peer_picked(
	void)
{
	return social_chat.peer >= 0 && social_chat.peer < social_chat.peer_count ? &social_chat.peers[social_chat.peer] :
		NULL;
}

static void social_chat_peer_next(
	short step)
{
	if (social_chat.peer_count > 0)
		social_chat.peer = (short)((social_chat.peer + step + social_chat.peer_count) % social_chat.peer_count);
}

/* ---------- the game it is in */

static boolean social_chat_network_game(
	void)
{
	short connection = game_connection();

	return connection == _game_connection_network_client || connection == _game_connection_network_server;
}

/* the network game's room: a key every machine in it makes alike ("" for none) */
static void social_chat_room(
	char *room,
	long size)
{
	struct network_game *game = network_game_get_game();
	unsigned long hash = 2166136261UL;
	short index;

	room[0] = 0;
	if (!game || !social_chat_network_game())
		return;
	for (index = 0; index < (short)NUMBEROF(game->name) && game->name[index]; index++)
		hash = ((hash ^ (unsigned long)(unsigned short)game->name[index]) * 16777619UL) & 0xFFFFFFFFUL;
	for (index = 0; index < (short)sizeof(game->map.name) && game->map.name[index]; index++)
		hash = ((hash ^ (unsigned long)(unsigned char)game->map.name[index]) * 16777619UL) & 0xFFFFFFFFUL;
	for (index = 0; index < 4; index++)
		hash = ((hash ^ ((game->random_seed >> (index * 8)) & 0xFF)) * 16777619UL) & 0xFFFFFFFFUL;
	snprintf(room, (size_t)size, "g:%08lx%08lx", hash, game->random_seed & 0xFFFFFFFFUL);
}

/* player 1's team in a team game (NONE: none, or no game) */
static short social_chat_team(
	void)
{
	short local_player_index = local_player_get_next(NONE);
	long player_index = local_player_index != NONE ? local_player_get_player_index(local_player_index) : NONE;
	struct player_datum *player = player_index != NONE ? player_try_and_get(player_index) : NULL;

	if (!player || !game_in_progress() || !game_engine_running() || !game_engine_has_teams())
		return NONE;
	return player->team_index;
}

/* ---------- the fork's lines */

/* text into a query's value (letters, digits and -._~ as they are) */
static void social_chat_query_value(
	char *query,
	long size,
	char const *text)
{
	long length = (long)strlen(query);

	for (; *text && length < size - 4; text++)
	{
		unsigned char character = (unsigned char)*text;

		if ((character >= 'a' && character <= 'z') || (character >= 'A' && character <= 'Z') ||
			(character >= '0' && character <= '9') || character == '-' || character == '.' || character == '_' ||
			character == '~')
		{
			query[length++] = (char)character;
		}
		else
		{
			snprintf(query + length, 4, "%%%02X", character);
			length += 3;
		}
	}
	query[length] = 0;
}

static void social_chat_poll_start(
	unsigned long now)
{
	char path[512];
	char name[64];
	short team = social_chat_team();

	social_chat_room(social_chat.room, sizeof(social_chat.room));
	social_player_name(name, sizeof(name));
	snprintf(path, sizeof(path), "/chat/messages?after=%ld&global=%d", social_chat.polled ? social_chat.cursor : 0L,
		social_chat_global_heard() ? 1 : 0);
	if (social_chat.room[0])
	{
		snprintf(path + strlen(path), sizeof(path) - strlen(path), "&room=%s", social_chat.room);
		if (team != NONE)
			snprintf(path + strlen(path), sizeof(path) - strlen(path), "&team=%d", (int)team);
	}
	if (name[0])
	{
		snprintf(path + strlen(path), sizeof(path) - strlen(path), "&name=");
		social_chat_query_value(path, sizeof(path), name);
	}
	social_chat.poll_ticket = social_send(path, NULL);
	if (!social_chat.poll_ticket)
		social_chat.poll_at = now + SOCIAL_CHAT_POLL_RETRY_MILLISECONDS;
}

static void social_chat_string(
	struct server_json_document const *document,
	int token,
	char const *key,
	char *text,
	int size)
{
	int member = server_json_member(document, token, key);

	text[0] = 0;
	if (member < 0 || !server_json_get_string(document, member, text, size))
		text[0] = 0;
}

static long social_chat_number(
	struct server_json_document const *document,
	int token,
	char const *key,
	long otherwise)
{
	int member = server_json_member(document, token, key);
	double value;

	return member >= 0 && server_json_get_number(document, member, &value) ? (long)value : otherwise;
}

/* a line of the fork's as the server sent it */
static void social_chat_take(
	struct server_json_document const *document,
	int token,
	boolean old)
{
	char channel_name[16];
	char text[SOCIAL_CHAT_TEXT_SIZE];
	char name[SOCIAL_CHAT_NAME_SIZE * 3];
	char from[SOCIAL_CHAT_CODE_SIZE];
	char to[SOCIAL_CHAT_CODE_SIZE];
	char to_name[SOCIAL_CHAT_NAME_SIZE * 3];
	wchar_t wide_name[SOCIAL_CHAT_NAME_SIZE];
	short channel;
	boolean mine;
	struct social_chat_line *line;

	social_chat_string(document, token, "channel", channel_name, sizeof(channel_name));
	social_chat_string(document, token, "text", text, sizeof(text));
	social_chat_string(document, token, "name", name, sizeof(name));
	social_chat_string(document, token, "from", from, sizeof(from));
	social_chat_string(document, token, "to", to, sizeof(to));
	social_chat_string(document, token, "toName", to_name, sizeof(to_name));
	if (!strcmp(channel_name, "match"))
		channel = _social_chat_match;
	else if (!strcmp(channel_name, "team"))
		channel = _social_chat_team;
	else if (!strcmp(channel_name, "private"))
		channel = _social_chat_private;
	else if (!strcmp(channel_name, "global"))
		channel = _social_chat_global;
	else
		return;
	if (!text[0])
		return;
	mine = from[0] && !strcmp(from, social_account_code());
	social_chat_wide_from_utf8(name, wide_name, NUMBEROF(wide_name));
	if (channel == _social_chat_private)
	{
		wchar_t peer_name[SOCIAL_CHAT_NAME_SIZE];

		social_chat_wide_from_utf8(mine ? to_name : name, peer_name, NUMBEROF(peer_name));
		social_chat_peer_note(mine ? to : from, peer_name, FALSE);
	}
	/* (a line of this account's own said here, or one heard the upstream
	way first: marked heard this way too) */
	{
		char cleaned[SOCIAL_CHAT_TEXT_SIZE];

		social_chat_clean(cleaned, text, SOCIAL_CHAT_TEXT_SIZE);
		if (!old && (line = social_chat_same_line(wide_name, channel, cleaned, _social_chat_fork_bit)) != NULL)
		{
			SET_FLAG(line->sources, _social_chat_fork_bit, TRUE);
			return;
		}
	}
	/* (one this machine said, which it showed as it sent it) */
	if (mine && !old)
		return;
	line = social_chat_line_new(old ? 0 : system_milliseconds());
	ustrncpy(line->name, wide_name, SOCIAL_CHAT_NAME_SIZE - 1);
	social_chat_clean(line->text, text, SOCIAL_CHAT_TEXT_SIZE);
	line->channel = channel;
	line->mine = mine;
	line->color = mine ? _social_chat_color_mine : _social_chat_color_none;
	if (channel == _social_chat_private)
	{
		csstrncpy(line->peer, mine ? to : from, SOCIAL_CHAT_CODE_SIZE - 1);
		social_chat_wide_from_utf8(mine ? to_name : name, line->peer_name, NUMBEROF(line->peer_name));
	}
	if (channel == _social_chat_team && social_chat_network_game() && game_engine_has_teams())
	{
		short team = social_chat_team();

		line->color = team == 0 ? _social_chat_color_red : team == 1 ? _social_chat_color_blue : line->color;
	}
	SET_FLAG(line->sources, _social_chat_fork_bit, TRUE);
}

static void social_chat_poll_answer(
	unsigned long now)
{
	int status = 0;
	int result = community_net_poll(social_chat.poll_ticket, &status, social_chat.answer, sizeof(social_chat.answer));
	struct server_json_document document;
	int data;
	int messages;
	int members;
	int index;
	boolean old;

	if (result == _community_net_waiting)
		return;
	social_chat.poll_ticket = 0;
	social_chat.poll_at = now + (social_chat_network_game() || social_chat.open ? SOCIAL_CHAT_POLL_FAST_MILLISECONDS :
		SOCIAL_CHAT_POLL_MILLISECONDS);
	if (result != _community_net_answered || status != 200)
	{
		social_chat.poll_at = now + SOCIAL_CHAT_POLL_RETRY_MILLISECONDS;
		return;
	}
	if (!server_json_parse(&document, social_chat.answer, (int)strlen(social_chat.answer), 16))
		return;
	data = server_json_member(&document, 0, "data");
	if (data >= 0)
	{
		old = !social_chat.polled;
		social_chat.cursor = social_chat_number(&document, data, "cursor", social_chat.cursor);
		social_chat.polled = TRUE;
		/* (the room's players: those a private line may go to) */
		members = server_json_member(&document, data, "members");
		for (index = 0; members >= 0; index++)
		{
			int member = server_json_element(&document, members, index);
			char code[SOCIAL_CHAT_CODE_SIZE];
			char name[SOCIAL_CHAT_NAME_SIZE * 3];
			wchar_t wide[SOCIAL_CHAT_NAME_SIZE];

			if (member < 0)
				break;
			social_chat_string(&document, member, "code", code, sizeof(code));
			social_chat_string(&document, member, "name", name, sizeof(name));
			social_chat_wide_from_utf8(name, wide, NUMBEROF(wide));
			social_chat_peer_note(code, wide, TRUE);
		}
		messages = server_json_member(&document, data, "messages");
		for (index = 0; messages >= 0; index++)
		{
			int message = server_json_element(&document, messages, index);

			if (message < 0)
				break;
			social_chat_take(&document, message, old);
		}
	}
	server_json_document_free(&document);
}

static void social_chat_send_answer(
	void)
{
	int status = 0;
	int result = community_net_poll(social_chat.send_ticket, &status, social_chat.answer, sizeof(social_chat.answer));

	if (result == _community_net_waiting)
		return;
	social_chat.send_ticket = 0;
	if (result != _community_net_answered)
		social_chat_notice("The fork's chat could not be reached");
	else if (status == 429)
		social_chat_notice("Too many lines at once: wait a moment");
	else if (status == 404)
		social_chat_notice("That player's account was not found");
	else if (status != 200)
		social_chat_notice("The fork's chat refused the line");
}

/* ---------- saying a line */

/* a line said to a channel: through the upstream chat where its host lets
it, and the fork's where it can; shown here as it goes */
static void social_chat_say(
	short channel,
	char const *typed)
{
	char text[SOCIAL_CHAT_SAID_SIZE];
	char name[64];
	byte sources = 0;
	short team = social_chat_team();
	struct social_chat_peer const *peer = social_chat_peer_picked();
	boolean fork = social_chat_online() && social_account_code()[0];
	struct social_chat_line *line;
	short index;

	social_chat_clean(text, typed, sizeof(text));
	for (index = 0; text[index] == ' '; index++)
		;
	if (!text[index])
		return;
	/* (one line on its way at a time: the server's rate is a few a second) */
	if (fork && social_chat.send_ticket)
	{
		social_chat_notice("Still sending the last line: try again");
		return;
	}
	if ((channel == _social_chat_match || channel == _social_chat_team) && network_chat_available())
	{
		network_chat_say(channel == _social_chat_team ? _chat_channel_team : _chat_channel_everyone, text);
		SET_FLAG(sources, _social_chat_upstream_bit, TRUE);
	}
	if (fork && channel == _social_chat_private && !peer)
	{
		social_chat_notice("No one to write to: pick a player with Up and Down");
		return;
	}
	social_chat_room(social_chat.room, sizeof(social_chat.room));
	if (fork &&
		(channel == _social_chat_global || channel == _social_chat_private ||
			(social_chat.room[0] && (channel == _social_chat_match || team != NONE))))
	{
		struct server_json json;

		social_player_name(name, sizeof(name));
		server_json_begin(&json);
		server_json_object_begin(&json, NULL);
		server_json_string(&json, "channel", channel == _social_chat_match ? "match" :
			channel == _social_chat_team ? "team" : channel == _social_chat_private ? "private" : "global");
		server_json_string(&json, "text", text);
		if (name[0])
			server_json_string(&json, "name", name);
		if (channel == _social_chat_match || channel == _social_chat_team)
			server_json_string(&json, "room", social_chat.room);
		if (channel == _social_chat_team)
			server_json_integer(&json, "team", team);
		if (channel == _social_chat_private)
			server_json_string(&json, "to", peer->code);
		server_json_object_end(&json);
		social_chat.send_ticket = social_send("/chat/messages", server_json_text(&json));
		server_json_free(&json);
		if (social_chat.send_ticket)
			SET_FLAG(sources, _social_chat_fork_bit, TRUE);
	}
	if (!sources)
	{
		/* (the reason named: off in the settings, the account's code not had
		yet from the server, or none of the requests' slots free) */
		if (channel != _social_chat_global && channel != _social_chat_private)
			social_chat_notice("No one can hear that channel here");
		else if (!community_net_enabled())
			social_chat_notice("The fork's chat is offline: ONLINE is off (community.enabled)");
		else if (!social_chat_online())
			social_chat_notice("The fork's chat is off (social.enabled, social.chat)");
		else if (!social_account_code()[0])
			social_chat_notice("The fork's chat has not signed in yet: the server did not answer");
		else
			social_chat_notice("The fork's chat is busy: try again");
		return;
	}
	/* (sent the fork's way: shown now, and the upstream chat's echo from the
	host marks it; sent the upstream way alone, that echo is the line) */
	if (TEST_FLAG(sources, _social_chat_fork_bit))
	{
		line = social_chat_line_new(system_milliseconds());
		social_player_name(name, sizeof(name));
		social_chat_wide_from_utf8(name, line->name, NUMBEROF(line->name));
		csstrncpy(line->text, text, SOCIAL_CHAT_TEXT_SIZE - 1);
		line->channel = channel;
		line->mine = TRUE;
		line->color = _social_chat_color_mine;
		SET_FLAG(line->sources, _social_chat_fork_bit, TRUE);
		if (channel == _social_chat_private && peer)
		{
			csstrncpy(line->peer, peer->code, SOCIAL_CHAT_CODE_SIZE - 1);
			ustrncpy(line->peer_name, peer->name, SOCIAL_CHAT_NAME_SIZE - 1);
		}
	}
}

/* ---------- opening, closing, typing */

boolean social_chat_typing(
	void)
{
	return social_chat.open;
}

boolean social_chat_keyboard_open(
	void)
{
	return social_chat.open && social_chat_keyboard.open;
}

short social_chat_controller(
	void)
{
	return social_chat.open && social_chat_keyboard.open ? social_chat.port : NONE;
}

/* a channel the box may be opened to here: MATCH and TEAM only in a network
game (TEAM in a team game), the others the fork's */
static short social_chat_channel_usable(
	short channel)
{
	if (channel == _social_chat_team && social_chat_team() == NONE)
		channel = _social_chat_match;
	if (channel == _social_chat_match && !social_chat_network_game())
		channel = _social_chat_global;
	return channel;
}

void social_chat_open(
	short channel,
	short port)
{
	struct key_stroke key;

	if (!social_chat_shown() || social_chat.open)
		return;
	social_chat.open = TRUE;
	social_chat.opened_at = system_milliseconds();
	social_chat.channel = social_chat_channel_usable(channel);
	social_chat.port = port;
	social_chat.typed[0] = 0;
	social_chat.scroll = 0;
	csmemset(&social_chat_keyboard, 0, sizeof(social_chat_keyboard));
	if (port != NONE)
	{
		social_chat_keyboard.open = TRUE;
		social_chat_keyboard.row = 1;
		/* (the buttons that opened it held over: none of them a key) */
		social_chat_keyboard.opening = halo_chat_pad_buttons_for_port(port);
	}
	/* (the keys pressed before, and the fork's lines asked for now) */
	while (input_get_key(&key))
		;
	social_chat.poll_at = system_milliseconds();
	if (social_chat.channel == _social_chat_private && !social_chat_peer_picked())
		social_chat_peer_next(0);
}

static void social_chat_close(
	void)
{
	social_chat.open = FALSE;
	social_chat_keyboard.open = FALSE;
	social_chat_keyboard.drawn = FALSE;
	social_chat.scroll = 0;
}

void social_chat_toggle_request(
	short port)
{
	social_chat.toggle_port = (short)(port + 1);
}

static void social_chat_channel_step(
	short step)
{
	short channel = social_chat.channel;
	short tries;

	for (tries = 0; tries < NUMBER_OF_SOCIAL_CHAT_CHANNELS; tries++)
	{
		channel = (short)((channel + step + NUMBER_OF_SOCIAL_CHAT_CHANNELS) % NUMBER_OF_SOCIAL_CHAT_CHANNELS);
		if (social_chat_channel_usable(channel) == channel)
			break;
	}
	social_chat.channel = channel;
	if (channel == _social_chat_private && !social_chat_peer_picked())
		social_chat_peer_next(0);
}

static void social_chat_delete(
	void)
{
	long length = (long)strlen(social_chat.typed);

	if (length)
		social_chat.typed[length - 1] = 0;
}

static void social_chat_send_typed(
	void)
{
	social_chat_say(social_chat.channel, social_chat.typed);
	social_chat_close();
}

static char social_chat_keyboard_character(
	short row,
	short column)
{
	char const *const *rows = social_chat_keyboard.symbols ? social_chat_symbols : social_chat_letters;
	char character = rows[row][column];

	return social_chat_keyboard.shift && character >= 'a' && character <= 'z' ? (char)(character - 'a' + 'A') :
		character;
}

static void social_chat_keyboard_press(
	void)
{
	if (social_chat_keyboard.row < SOCIAL_CHAT_KEYBOARD_ROWS - 1)
	{
		char typed[2];

		typed[0] = social_chat_keyboard_character(social_chat_keyboard.row, social_chat_keyboard.column);
		typed[1] = 0;
		social_chat_append(social_chat.typed, typed);
		return;
	}
	switch (social_chat_keyboard.column / SOCIAL_CHAT_KEYBOARD_WIDE_COLUMNS)
	{
	case _social_chat_key_shift:
		social_chat_keyboard.shift = !social_chat_keyboard.shift;
		break;
	case _social_chat_key_symbols:
		social_chat_keyboard.symbols = !social_chat_keyboard.symbols;
		break;
	case _social_chat_key_space:
		social_chat_append(social_chat.typed, " ");
		break;
	case _social_chat_key_delete:
		social_chat_delete();
		break;
	default:
		social_chat_send_typed();
		break;
	}
}

static void social_chat_keyboard_move(
	short rows_down,
	short columns_right)
{
	short row = (short)((social_chat_keyboard.row + rows_down + SOCIAL_CHAT_KEYBOARD_ROWS) % SOCIAL_CHAT_KEYBOARD_ROWS);
	short column = social_chat_keyboard.column;

	if (row == SOCIAL_CHAT_KEYBOARD_ROWS - 1)
	{
		column = (short)(column / SOCIAL_CHAT_KEYBOARD_WIDE_COLUMNS * SOCIAL_CHAT_KEYBOARD_WIDE_COLUMNS);
		column = (short)((column + columns_right * SOCIAL_CHAT_KEYBOARD_WIDE_COLUMNS + SOCIAL_CHAT_KEYBOARD_COLUMNS) %
			SOCIAL_CHAT_KEYBOARD_COLUMNS);
	}
	else
	{
		column = (short)((column + columns_right + SOCIAL_CHAT_KEYBOARD_COLUMNS) % SOCIAL_CHAT_KEYBOARD_COLUMNS);
	}
	social_chat_keyboard.row = row;
	social_chat_keyboard.column = column;
}

/* the on-screen keyboard's controller (as the upstream chat's: B closes,
Start sends, D-pad Up and Down the channel, the stick and D-pad Left and
Right the key, A presses it, X deletes, Y the next player to write to in
PRIVATE, else capitals) and taps */
static void social_chat_keyboard_update(
	void)
{
	unsigned long held = halo_chat_pad_buttons();
	unsigned long pressed;
	unsigned long now = system_milliseconds();
	short rows_down = 0;
	short columns_right = 0;
	float x;
	float y;

	/* (the buttons that opened it, until let go) */
	social_chat_keyboard.opening &= held;
	held &= ~social_chat_keyboard.opening;
	pressed = held & ~social_chat_keyboard.held;
	social_chat_keyboard.held = held;
	if (TEST_FLAG(pressed, HALO_CHAT_PAD_B))
	{
		social_chat_close();
		return;
	}
	if (TEST_FLAG(pressed, HALO_CHAT_PAD_START))
	{
		social_chat_send_typed();
		return;
	}
	if (TEST_FLAG(pressed, HALO_CHAT_PAD_UP))
		social_chat_channel_step(-1);
	if (TEST_FLAG(pressed, HALO_CHAT_PAD_DOWN))
		social_chat_channel_step(1);
	if (TEST_FLAG(held, HALO_CHAT_PAD_STICK_UP))
		rows_down = -1;
	else if (TEST_FLAG(held, HALO_CHAT_PAD_STICK_DOWN))
		rows_down = 1;
	if (TEST_FLAG(held, HALO_CHAT_PAD_STICK_LEFT) || TEST_FLAG(held, HALO_CHAT_PAD_LEFT))
		columns_right = -1;
	else if (TEST_FLAG(held, HALO_CHAT_PAD_STICK_RIGHT) || TEST_FLAG(held, HALO_CHAT_PAD_RIGHT))
		columns_right = 1;
	if (!rows_down && !columns_right)
	{
		social_chat_keyboard.repeat_at = 0;
	}
	else if (!social_chat_keyboard.repeat_at || (long)(now - social_chat_keyboard.repeat_at) >= 0)
	{
		social_chat_keyboard_move(rows_down, columns_right);
		social_chat_keyboard.repeat_at = now + (social_chat_keyboard.repeat_at ?
			SOCIAL_CHAT_KEYBOARD_REPEAT_MILLISECONDS : SOCIAL_CHAT_KEYBOARD_REPEAT_FIRST_MILLISECONDS);
	}
	if (TEST_FLAG(pressed, HALO_CHAT_PAD_A))
		social_chat_keyboard_press();
	if (social_chat.open && TEST_FLAG(pressed, HALO_CHAT_PAD_X))
		social_chat_delete();
	if (social_chat.open && TEST_FLAG(pressed, HALO_CHAT_PAD_Y))
	{
		if (social_chat.channel == _social_chat_private)
			social_chat_peer_next(1);
		else
			social_chat_keyboard.shift = !social_chat_keyboard.shift;
	}
	/* (a tap on a key presses it; elsewhere it closes the box) */
	if (social_chat.open && social_chat.port == 0 && halo_chat_taps(&x, &y) && social_chat_keyboard.drawn)
	{
		short tap_x = (short)(x * 1000.0f);
		short tap_y = (short)(y * 1000.0f);

		if (tap_x >= social_chat_keyboard.left && tap_x < social_chat_keyboard.right &&
			tap_y >= social_chat_keyboard.top && tap_y < social_chat_keyboard.bottom)
		{
			short row = (short)((tap_y - social_chat_keyboard.top) * SOCIAL_CHAT_KEYBOARD_ROWS /
				MAX(social_chat_keyboard.bottom - social_chat_keyboard.top, 1));
			short column = (short)((tap_x - social_chat_keyboard.left) * SOCIAL_CHAT_KEYBOARD_COLUMNS /
				MAX(social_chat_keyboard.right - social_chat_keyboard.left, 1));

			social_chat_keyboard.row = (short)PIN(row, 0, SOCIAL_CHAT_KEYBOARD_ROWS - 1);
			social_chat_keyboard.column = (short)PIN(column, 0, SOCIAL_CHAT_KEYBOARD_COLUMNS - 1);
			social_chat_keyboard_press();
		}
		else
		{
			social_chat_close();
		}
	}
}

/* the keyboard's keys, as the box takes them */
static void social_chat_keys_update(
	void)
{
	struct key_stroke key;

	while (social_chat.open && input_get_key(&key))
	{
		switch (key.key_code)
		{
		case _key_escape:
			social_chat_close();
			break;
		case _key_return:
		case _keypad_enter:
			social_chat_send_typed();
			break;
		case _key_tab:
			social_chat_channel_step(1);
			break;
		case _key_up_arrow:
			social_chat_peer_next(-1);
			break;
		case _key_down_arrow:
			social_chat_peer_next(1);
			break;
		case _key_backspace:
			social_chat_delete();
			break;
		case _key_page_up:
			social_chat.scroll = (short)(social_chat.scroll + SOCIAL_CHAT_PAGE_LINES);
			break;
		case _key_page_down:
			social_chat.scroll = (short)(social_chat.scroll - SOCIAL_CHAT_PAGE_LINES);
			break;
		case _key_backquote:
			break;
		default:
			if (TEST_FLAG(key.modifier_flags, SOCIAL_CHAT_KEY_MODIFIER_CONTROL_BIT))
			{
				char clipboard[SOCIAL_CHAT_SAID_SIZE];

				if (key.key_code == _key_v && platform_clipboard_get(clipboard, sizeof(clipboard)))
					social_chat_append(social_chat.typed, clipboard);
			}
			else if (key.ascii_code >= ' ' && key.ascii_code <= '~')
			{
				char typed[2];

				typed[0] = key.ascii_code;
				typed[1] = 0;
				social_chat_append(social_chat.typed, typed);
			}
			break;
		}
	}
	if (social_chat.open)
		social_chat.scroll = (short)(social_chat.scroll + halo_chat_wheel_steps());
	social_chat.scroll = (short)PIN(social_chat.scroll, 0, MAX(social_chat.line_count - 1, 0));
}

/* the keys that open it where the upstream chat's do not (the menus, a game
not a network one): T to everyone (GLOBAL there), Y to the team */
static void social_chat_open_keys(
	void)
{
	unsigned long held = 0;
	unsigned long pressed;

	if (!social_chat_network_game() || !game_in_progress())
	{
		held = (game_in_progress() && !ui_widgets_active() ? halo_keyboard_actions(0) :
			halo_keyboard_actions_anywhere()) & (FLAG(HALO_KEYBOARD_CHAT) | FLAG(HALO_KEYBOARD_TEAM_CHAT));
	}
	pressed = held & ~social_chat.keys_held;
	social_chat.keys_held = held;
	if (pressed && !social_chat.open && !console_is_active())
		social_chat_open(TEST_FLAG(pressed, HALO_KEYBOARD_CHAT) ? _social_chat_global : _social_chat_team, NONE);
}

void social_chat_update(
	void)
{
	unsigned long now = system_milliseconds();

	if (!social_chat_replaces_upstream())
	{
		social_chat_close();
		return;
	}
	/* (the fork's lines) */
	if (social_chat_online())
	{
		if (social_chat.send_ticket)
			social_chat_send_answer();
		if (social_chat.poll_ticket)
			social_chat_poll_answer(now);
		else if (social_account_code()[0] && (long)(now - social_chat.poll_at) >= 0)
			social_chat_poll_start(now);
	}
	if (!social_chat_shown() || network_replay_playing())
	{
		social_chat_close();
		social_chat.toggle_port = 0;
		return;
	}
	if (social_chat.toggle_port)
	{
		short port = (short)(social_chat.toggle_port - 1);

		social_chat.toggle_port = 0;
		if (social_chat.open && now - social_chat.opened_at > SOCIAL_CHAT_TOGGLE_MILLISECONDS)
			social_chat_close();
		else if (!console_is_active())
			social_chat_open(social_chat_network_game() ? _social_chat_match : _social_chat_global, port);
	}
	social_chat_open_keys();
	if (!social_chat.open || console_is_active())
		return;
	if (social_chat_keyboard.open)
		social_chat_keyboard_update();
	social_chat_keys_update();
	/* (a channel this game has not, as the game changes) */
	if (social_chat.open)
		social_chat.channel = social_chat_channel_usable(social_chat.channel);
}

/* ---------- drawing */

static boolean social_chat_font(
	long *font_index,
	short *line_height)
{
	struct font_header *font;

	*font_index = tag_loaded(FONT_GROUP_TAG, "ui\\small_ui");
	if (*font_index == NONE)
		*font_index = interface_get_tag_index(_interface_font_terminal);
	if (*font_index == NONE)
		return FALSE;
	font = font_definition_get(*font_index);
	*line_height = (short)(font->ascending_height + font->descending_height + font->leading_height);
	return *line_height > 0;
}

static void social_chat_color(
	short color,
	real alpha,
	real_argb_color *result)
{
	result->alpha = alpha;
	switch (color)
	{
	case _social_chat_color_red:
		result->red = 0.86f;
		result->green = 0.32f;
		result->blue = 0.28f;
		break;
	case _social_chat_color_blue:
		result->red = 0.34f;
		result->green = 0.51f;
		result->blue = 0.86f;
		break;
	case _social_chat_color_notice:
		result->red = 0.93f;
		result->green = 0.82f;
		result->blue = 0.45f;
		break;
	case _social_chat_color_mine:
		result->red = 0.55f;
		result->green = 0.85f;
		result->blue = 0.55f;
		break;
	default:
		result->red = 0.85f;
		result->green = 0.85f;
		result->blue = 0.85f;
		break;
	}
}

/* the width of a string's first count characters (NONE: all) in the draw mode's font */
static short social_chat_width(
	wchar_t const *string,
	short count)
{
	wchar_t part[SOCIAL_CHAT_TEXT_SIZE + 2 * SOCIAL_CHAT_NAME_SIZE + 32];
	rectangle2d measure;
	rectangle2d text_bounds;
	rectangle2d cursor_bounds;
	short index;

	for (index = 0; string[index] && (count == NONE || index < count) && index < (short)NUMBEROF(part) - 1; index++)
		part[index] = string[index];
	part[index] = 0;
	if (!index)
		return 0;
	measure.x0 = 0;
	measure.y0 = 0;
	measure.x1 = SHORT_MAX;
	measure.y1 = SHORT_MAX;
	draw_unicode_string_compute_bounds(&measure, part, &text_bounds, &cursor_bounds);
	return cursor_bounds.x0;
}

/* how many characters of text from start fit width, broken at a space where
one fits (at least one), and the spaces after them */
static short social_chat_wrap(
	wchar_t const *text,
	short width,
	short *skip)
{
	short length;
	short low = 1;
	short high;
	short index;

	*skip = 0;
	for (length = 0; text[length]; length++)
		;
	if (!length || social_chat_width(text, NONE) <= width)
		return length;
	for (high = length; low < high;)
	{
		short middle = (short)((low + high + 1) / 2);

		if (social_chat_width(text, middle) <= width)
			low = middle;
		else
			high = (short)(middle - 1);
	}
	for (index = low; index > 0 && text[index] != ' '; index--)
		;
	if (index > 0)
		low = index;
	while (text[low + *skip] == ' ')
		(*skip)++;
	return low;
}

static void social_chat_text(
	long font_index,
	rectangle2d const *bounds,
	real_argb_color const *color,
	wchar_t const *text)
{
	rectangle2d shadow = *bounds;
	real_argb_color black;

	black.alpha = color->alpha * 0.6f;
	black.red = black.green = black.blue = 0.0f;
	offset_rectangle2d(&shadow, 1, 1);
	rasterizer_text_set_shadow_color(0x00000001);
	draw_string_set_draw_mode(font_index, NONE, 0 /* left */, 0, &black);
	rasterizer_draw_unicode_string(&shadow, NULL, NULL, 0, text);
	draw_string_set_draw_mode(font_index, NONE, 0 /* left */, 0, color);
	rasterizer_draw_unicode_string(bounds, NULL, NULL, 0, text);
	rasterizer_text_set_shadow_color(0);
}

/* a line's head: its channel's tag, where it came from, and its name ("" for a notice) */
static void social_chat_head(
	struct social_chat_line const *line,
	wchar_t *head,
	long count)
{
	wchar_t source[8];
	long length;

	head[0] = 0;
	if (line->notice)
		return;
	ustrncpy(source, line->sources == (FLAG(_social_chat_upstream_bit) | FLAG(_social_chat_fork_bit)) ? L"U+F" :
		TEST_FLAG(line->sources, _social_chat_upstream_bit) ? L"U" : L"F", NUMBEROF(source) - 1);
	source[NUMBEROF(source) - 1] = 0;
	ustrncpy(head, social_chat_channel_tags[line->channel], count - 1);
	head[count - 1] = 0;
	length = ustrlen(head);
	if (length < count - 1)
	{
		head[length++] = '[';
		head[length] = 0;
		ustrncat(head, source, count - 1 - length);
		length = ustrlen(head);
		if (length < count - 2)
		{
			head[length++] = ']';
			head[length++] = ' ';
			head[length] = 0;
		}
	}
	length = ustrlen(head);
	ustrncat(head, line->name, count - 1 - length);
	/* (a private line: who it went to, when it was this one's) */
	if (line->channel == _social_chat_private && line->mine && line->peer_name[0])
	{
		length = ustrlen(head);
		ustrncat(head, L" > ", count - 1 - length);
		length = ustrlen(head);
		ustrncat(head, line->peer_name, count - 1 - length);
	}
	length = ustrlen(head);
	ustrncat(head, L": ", count - 1 - length);
}

/* how many rows a line takes in a column of width (its head, then its text) */
static short social_chat_line_rows(
	struct social_chat_line const *line,
	short width,
	wchar_t *head,
	long head_count,
	wchar_t *text,
	long text_count)
{
	short head_width;
	short rows = 0;
	short start = 0;

	social_chat_head(line, head, head_count);
	social_chat_wide_from_ascii(line->text, text, text_count);
	head_width = social_chat_width(head, NONE);
	while (text[start] && rows < SOCIAL_CHAT_LINE_ROWS)
	{
		short skip;
		short room = (short)(rows ? width : width - head_width);
		short count = social_chat_wrap(text + start, MAX(room, 8), &skip);

		start = (short)(start + MAX(count, 1) + skip);
		rows++;
	}
	return MAX(rows, 1);
}

/* a line drawn from top, a row each line_height: its head in its colour,
then its text */
static void social_chat_line_draw(
	long font_index,
	struct social_chat_line const *line,
	short left,
	short width,
	short top,
	short line_height,
	real alpha)
{
	wchar_t head[SOCIAL_CHAT_NAME_SIZE * 2 + 24];
	wchar_t text[SOCIAL_CHAT_TEXT_SIZE];
	wchar_t row_text[SOCIAL_CHAT_TEXT_SIZE];
	real_argb_color head_color;
	real_argb_color text_color;
	rectangle2d bounds;
	short head_width;
	short rows = 0;
	short start = 0;

	social_chat_head(line, head, NUMBEROF(head));
	social_chat_wide_from_ascii(line->text, text, NUMBEROF(text));
	social_chat_color(line->color, alpha, &head_color);
	social_chat_color(line->notice ? _social_chat_color_notice : _social_chat_color_none, alpha, &text_color);
	if (!line->notice)
	{
		text_color.red = 0.93f;
		text_color.green = 0.93f;
		text_color.blue = 0.93f;
	}
	if (line->channel == _social_chat_private && !line->notice)
	{
		text_color.red = 0.95f;
		text_color.green = 0.7f;
		text_color.blue = 0.95f;
	}
	else if (line->channel == _social_chat_global && !line->notice)
	{
		text_color.red = 0.75f;
		text_color.green = 0.88f;
		text_color.blue = 1.0f;
	}
	head_width = social_chat_width(head, NONE);
	bounds.x0 = left;
	bounds.x1 = (short)(left + width);
	bounds.y0 = top;
	bounds.y1 = (short)(top + line_height);
	if (head[0])
		social_chat_text(font_index, &bounds, &head_color, head);
	while (text[start] && rows < SOCIAL_CHAT_LINE_ROWS)
	{
		short skip;
		short room = (short)(rows ? width : width - head_width);
		short count = social_chat_wrap(text + start, MAX(room, 8), &skip);
		short index;

		count = MAX(count, 1);
		for (index = 0; index < count && index < (short)NUMBEROF(row_text) - 1; index++)
			row_text[index] = text[start + index];
		row_text[index] = 0;
		bounds.x0 = (short)(rows ? left : left + head_width);
		bounds.y0 = (short)(top + rows * line_height);
		bounds.y1 = (short)(bounds.y0 + line_height);
		social_chat_text(font_index, &bounds, &text_color, row_text);
		start = (short)(start + count + skip);
		rows++;
	}
}

/* the on-screen keyboard, under the box, its key picked lit; where it was
drawn kept, for a tap */
static void social_chat_keyboard_draw(
	long font_index,
	short line_height,
	short screen_width,
	short screen_height,
	short left,
	short top)
{
	static pixel32 const KEY = 0xC0102438UL;
	static pixel32 const PICKED_KEY = 0xF02896FFUL;
	static pixel32 const LIT_KEY = 0xE0205080UL;
	static wchar_t const *const wide_labels[] = { L"SHIFT", L"#+=", L"SPACE", L"DEL", L"SEND" };
	real_argb_color white = get_ui_argb_white();
	short key_width = (short)(screen_width * SOCIAL_CHAT_KEYBOARD_PERCENT / 100 / SOCIAL_CHAT_KEYBOARD_COLUMNS);
	short key_height = (short)MAX(key_width * 2 / 3, line_height + 2 * SOCIAL_CHAT_KEY_GAP + 4);
	rectangle2d panel;
	short row;
	short column;

	if (key_width <= 2 * SOCIAL_CHAT_KEY_GAP + 4 || top + key_height * SOCIAL_CHAT_KEYBOARD_ROWS > screen_height)
		return;
	panel.x0 = left;
	panel.y0 = top;
	panel.x1 = (short)(left + key_width * SOCIAL_CHAT_KEYBOARD_COLUMNS);
	panel.y1 = (short)(top + key_height * SOCIAL_CHAT_KEYBOARD_ROWS);
	draw_quad(&panel, (pixel32)0xA0 << 24);
	for (row = 0; row < SOCIAL_CHAT_KEYBOARD_ROWS; row++)
	{
		short span = row == SOCIAL_CHAT_KEYBOARD_ROWS - 1 ? SOCIAL_CHAT_KEYBOARD_WIDE_COLUMNS : 1;

		for (column = 0; column < SOCIAL_CHAT_KEYBOARD_COLUMNS; column += span)
		{
			boolean picked = social_chat_keyboard.row == row &&
				social_chat_keyboard.column / span == column / span;
			boolean lit = row == SOCIAL_CHAT_KEYBOARD_ROWS - 1 &&
				((column / span == _social_chat_key_shift && social_chat_keyboard.shift) ||
					(column / span == _social_chat_key_symbols && social_chat_keyboard.symbols));
			wchar_t label[8];
			rectangle2d key;
			rectangle2d bounds;

			key.x0 = (short)(panel.x0 + column * key_width + SOCIAL_CHAT_KEY_GAP);
			key.x1 = (short)(panel.x0 + (column + span) * key_width - SOCIAL_CHAT_KEY_GAP);
			key.y0 = (short)(panel.y0 + row * key_height + SOCIAL_CHAT_KEY_GAP);
			key.y1 = (short)(panel.y0 + (row + 1) * key_height - SOCIAL_CHAT_KEY_GAP);
			draw_quad(&key, picked ? PICKED_KEY : lit ? LIT_KEY : KEY);
			if (row < SOCIAL_CHAT_KEYBOARD_ROWS - 1)
			{
				label[0] = (wchar_t)(unsigned char)social_chat_keyboard_character(row, column);
				label[1] = 0;
			}
			else
			{
				ustrncpy(label, wide_labels[column / span], NUMBEROF(label) - 1);
				label[NUMBEROF(label) - 1] = 0;
			}
			bounds = key;
			bounds.y0 = (short)(key.y0 + (key.y1 - key.y0 - line_height) / 2);
			bounds.y1 = (short)(bounds.y0 + line_height);
			draw_string_set_draw_mode(font_index, NONE, 2 /* centred */, 0, &white);
			rasterizer_draw_unicode_string(&bounds, NULL, NULL, 0, label);
		}
	}
	social_chat_keyboard.left = (short)(panel.x0 * 1000L / screen_width);
	social_chat_keyboard.right = (short)(panel.x1 * 1000L / screen_width);
	social_chat_keyboard.top = (short)(panel.y0 * 1000L / screen_height);
	social_chat_keyboard.bottom = (short)(panel.y1 * 1000L / screen_height);
	social_chat_keyboard.drawn = TRUE;
}

/* the box's foot while open: the channels (the one picked lit), who a
private line goes to, the line typed, and the keys' hint */
static short social_chat_open_draw(
	long font_index,
	short line_height,
	short left,
	short width,
	short top)
{
	static real_argb_color const blue = { 1.0f, 0x28 / 255.0f, 0x96 / 255.0f, 1.0f };
	static real_argb_color const grey = { 1.0f, 0.55f, 0.55f, 0.55f };
	real_argb_color white = get_ui_argb_white();
	rectangle2d bounds;
	wchar_t text[SOCIAL_CHAT_SAID_SIZE + 64];
	short x = left;
	short channel;

	bounds.y0 = top;
	bounds.y1 = (short)(top + line_height);
	for (channel = 0; channel < NUMBER_OF_SOCIAL_CHAT_CHANNELS; channel++)
	{
		wchar_t name[16];
		boolean usable = social_chat_channel_usable(channel) == channel;

		social_chat_wide_from_ascii(social_chat_channel_names[channel], name, NUMBEROF(name));
		bounds.x0 = x;
		bounds.x1 = (short)(left + width);
		social_chat_text(font_index, &bounds, channel == social_chat.channel ? &blue : usable ? &white : &grey, name);
		x = (short)(x + social_chat_width(name, NONE) + line_height);
	}
	top = (short)(top + line_height);
	if (social_chat.channel == _social_chat_private)
	{
		struct social_chat_peer const *peer = social_chat_peer_picked();
		wchar_t code[SOCIAL_CHAT_CODE_SIZE];

		ustrncpy(text, L"TO: ", NUMBEROF(text) - 1);
		text[NUMBEROF(text) - 1] = 0;
		if (peer)
		{
			ustrncat(text, peer->name, NUMBEROF(text) - 1 - ustrlen(text));
			ustrncat(text, L" (", NUMBEROF(text) - 1 - ustrlen(text));
			social_chat_wide_from_ascii(peer->code, code, NUMBEROF(code));
			ustrncat(text, code, NUMBEROF(text) - 1 - ustrlen(text));
			ustrncat(text, L")", NUMBEROF(text) - 1 - ustrlen(text));
		}
		else
		{
			ustrncat(text, L"no one yet", NUMBEROF(text) - 1 - ustrlen(text));
		}
		bounds.x0 = left;
		bounds.x1 = (short)(left + width);
		bounds.y0 = top;
		bounds.y1 = (short)(top + line_height);
		social_chat_text(font_index, &bounds, &white, text);
		top = (short)(top + line_height);
	}
	/* (the line typed, its end where it is wider than the box, and the caret) */
	{
		wchar_t typed[SOCIAL_CHAT_SAID_SIZE + 2];
		short start = 0;
		short length;

		social_chat_wide_from_ascii(social_chat.typed, typed, SOCIAL_CHAT_SAID_SIZE);
		length = (short)ustrlen(typed);
		if ((system_milliseconds() / SOCIAL_CHAT_CARET_MILLISECONDS) % 2 == 0)
		{
			typed[length] = '_';
			typed[length + 1] = 0;
		}
		ustrncpy(text, L"> ", NUMBEROF(text) - 1);
		text[NUMBEROF(text) - 1] = 0;
		while (start < length && social_chat_width(typed + start, NONE) > width - line_height * 2)
			start++;
		ustrncat(text, typed + start, NUMBEROF(text) - 1 - ustrlen(text));
		bounds.x0 = left;
		bounds.x1 = (short)(left + width);
		bounds.y0 = top;
		bounds.y1 = (short)(top + line_height);
		social_chat_text(font_index, &bounds, &white, text);
		top = (short)(top + line_height);
	}
	/* (the keys' hint, and the account's code) */
	{
		char hint[160];
		wchar_t wide[160];

		if (social_chat_keyboard.open)
		{
			snprintf(hint, sizeof(hint), "D-pad: channel  X: delete  Y: %s  Start: send  B: close",
				social_chat.channel == _social_chat_private ? "player" : "caps");
		}
		else
		{
			snprintf(hint, sizeof(hint), "Tab: channel  %sEnter: send  Esc: close",
				social_chat.channel == _social_chat_private ? "Up/Down: player  " : "");
		}
		if (social_account_code()[0])
			snprintf(hint + strlen(hint), sizeof(hint) - strlen(hint), "   ID %s", social_account_code());
		else if (!social_chat_online())
			snprintf(hint + strlen(hint), sizeof(hint) - strlen(hint), "   (fork chat offline)");
		social_chat_wide_from_ascii(hint, wide, NUMBEROF(wide));
		bounds.x0 = left;
		bounds.x1 = (short)(left + width);
		bounds.y0 = top;
		bounds.y1 = (short)(top + line_height);
		social_chat_text(font_index, &bounds, &grey, wide);
		top = (short)(top + line_height);
	}
	return top;
}

void social_chat_draw(
	void)
{
	long font_index;
	short line_height;
	short screen_width;
	short screen_height;
	short left;
	short width;
	short rows_shown;
	short foot_rows;
	short rows_used = 0;
	short first_back;
	short back;
	short top;
	short bottom;
	boolean touch = halo_chat_touch_layout() != 0;
	unsigned long now = system_milliseconds();

	social_chat_keyboard.drawn = FALSE;
	if (!social_chat_shown() || network_replay_playing() || (!social_chat.open && cinematic_in_progress()))
		return;
	if (!social_chat.open && !social_chat.line_count)
		return;
	if (!social_chat_font(&font_index, &line_height))
		return;
	screen_width = (short)(render.camera.viewport_bounds.x1 - render.camera.viewport_bounds.x0);
	screen_height = (short)(render.camera.viewport_bounds.y1 - render.camera.viewport_bounds.y0);
	if (screen_width <= 0 || screen_height <= 0)
		return;
	left = (short)(screen_width * SOCIAL_CHAT_LEFT_PERCENT / 100);
	width = (short)(screen_width * SOCIAL_CHAT_WIDTH_PERCENT / 100);
	rows_shown = social_chat.open ? SOCIAL_CHAT_LINES_OPEN : SOCIAL_CHAT_LINES_CLOSED;
	foot_rows = social_chat.open ? (short)(social_chat.channel == _social_chat_private ? 4 : 3) : 0;
	{
		real_argb_color white = get_ui_argb_white();

		draw_string_set_draw_mode(font_index, NONE, 0 /* left */, 0, &white);
	}
	/* (the lines shown, the newest at the bottom: open, the latest, from
	where it is scrolled to; closed, the latest new ones not faded) */
	first_back = social_chat.open ? social_chat.scroll : 0;
	for (back = first_back; back < social_chat.line_count; back++)
	{
		struct social_chat_line const *line = social_chat_line_at(back);
		wchar_t head[SOCIAL_CHAT_NAME_SIZE * 2 + 24];
		wchar_t text[SOCIAL_CHAT_TEXT_SIZE];
		short rows;

		if (!social_chat.open && (!line->time || now - line->time > SOCIAL_CHAT_LINE_MILLISECONDS +
			SOCIAL_CHAT_FADE_MILLISECONDS))
		{
			break;
		}
		rows = social_chat_line_rows(line, (short)(width - 2 * SOCIAL_CHAT_PADDING), head, NUMBEROF(head), text,
			NUMBEROF(text));
		if (rows_used + rows > rows_shown)
			break;
		rows_used = (short)(rows_used + rows);
	}
	if (!social_chat.open && !rows_used)
		return;
	if (touch)
	{
		top = (short)(screen_height * SOCIAL_CHAT_TOUCH_TOP_PERCENT / 100);
		bottom = (short)(top + (rows_used + foot_rows) * line_height + 2 * SOCIAL_CHAT_PADDING);
	}
	else
	{
		bottom = (short)(screen_height * SOCIAL_CHAT_BOTTOM_PERCENT / 100);
		top = (short)(bottom - (rows_used + foot_rows) * line_height - 2 * SOCIAL_CHAT_PADDING);
	}
	if (social_chat.open)
	{
		rectangle2d panel;

		panel.x0 = left;
		panel.x1 = (short)(left + width);
		panel.y0 = top;
		panel.y1 = bottom;
		draw_quad(&panel, (pixel32)0x99 << 24);
	}
	/* (the lines, oldest first, down from the top) */
	{
		short y = (short)(top + SOCIAL_CHAT_PADDING);
		short index;
		short count = (short)(back - first_back);

		for (index = (short)(count - 1); index >= 0; index--)
		{
			struct social_chat_line const *line = social_chat_line_at((short)(first_back + index));
			wchar_t head[SOCIAL_CHAT_NAME_SIZE * 2 + 24];
			wchar_t text[SOCIAL_CHAT_TEXT_SIZE];
			real alpha = 1.0f;
			short rows = social_chat_line_rows(line, (short)(width - 2 * SOCIAL_CHAT_PADDING), head, NUMBEROF(head),
				text, NUMBEROF(text));

			if (!social_chat.open && now - line->time > SOCIAL_CHAT_LINE_MILLISECONDS)
			{
				alpha = 1.0f - (real)(now - line->time - SOCIAL_CHAT_LINE_MILLISECONDS) /
					(real)SOCIAL_CHAT_FADE_MILLISECONDS;
			}
			social_chat_line_draw(font_index, line, (short)(left + SOCIAL_CHAT_PADDING),
				(short)(width - 2 * SOCIAL_CHAT_PADDING), y, line_height, alpha);
			y = (short)(y + rows * line_height);
		}
		if (social_chat.open)
		{
			y = social_chat_open_draw(font_index, line_height, (short)(left + SOCIAL_CHAT_PADDING),
				(short)(width - 2 * SOCIAL_CHAT_PADDING), y);
			if (social_chat_keyboard.open)
			{
				short keyboard_width = (short)(screen_width * SOCIAL_CHAT_KEYBOARD_PERCENT / 100);
				short keyboard_left = touch ? (short)((screen_width - keyboard_width) / 2) :
					(short)(screen_width - keyboard_width - left);
				short keyboard_top = touch ? (short)(bottom + SOCIAL_CHAT_PADDING) :
					(short)(screen_height - (keyboard_width / SOCIAL_CHAT_KEYBOARD_COLUMNS) * 2 / 3 *
						SOCIAL_CHAT_KEYBOARD_ROWS - screen_height * 4 / 100);

				social_chat_keyboard_draw(font_index, line_height, screen_width, screen_height, keyboard_left,
					MAX(keyboard_top, 0));
			}
		}
	}
}
