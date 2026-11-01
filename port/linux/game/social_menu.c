/*
SOCIAL_MENU.C

The Social screen's lists and what their rows do (social_menu.h), from the
community server's answers.

- The server is asked one thing at a time for the screen (the friends and
  requests, the activity, a player), and once more for the players muted
  and blocked, which the chat needs whether the screen is open or not
  (social_chat_unheard_set). An action (a friend request, its answer, a
  mute, a block, a report) is one request too; once answered, what it
  changed is asked for again. All of it is taken in social_menu_update, from
  the main loop, so that an answer that comes after the screen closed still
  counts.
- The friends and requests are asked for again every
  SOCIAL_MENU_REFRESH_MILLISECONDS while a list of them is shown.
- An action that cannot be taken back at once (removing a friend, a block,
  a report) wants A pressed twice.
- A friend's game is joined by its invite (social.instant_join on its side,
  an internet game it hosts): menu_functions.c joins it as Direct Link's
  PASTE LINK does, and shows Direct Link, where it appears.
*/

/* ---------- headers */

#include "cseries.h"
#include "cseries/errors.h"
#include "math/real_math.h"
#include "bitmaps/bitmap_group.h"
#include "bitmaps/bitmap_group_lookup.h"
#include "interface/interface.h"
#include "interface/ui_widget.h"
#include "interface/virtual_keyboard.h"
#include "tag_files/tag_groups.h"
#include "text/draw_string.h"
#include "text/font_group.h"
#include "text/unicode.h"

#include "campaign_medals.h"
#include "campaign_score.h"
#include "social.h"
#include "social_chat.h"
#include "social_menu.h"
#include "../src/community_net.h"
#include "../src/port_config.h"
#include "../src/server_json.h"

#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

void platform_log(char const *format, ...);
unsigned long system_milliseconds(void);

/* ---------- constants */

#define SOCIAL_MENU_CODE_SIZE 16
#define SOCIAL_MENU_NAME_SIZE 48
#define SOCIAL_MENU_LABEL_SIZE 64
#define SOCIAL_MENU_TIME_SIZE 32
#define SOCIAL_MENU_INVITE_SIZE 168
/* what is kept of the server's lists */
#define SOCIAL_MENU_FRIENDS 100
#define SOCIAL_MENU_REQUESTS 48
#define SOCIAL_MENU_ACTIVITY 30
#define SOCIAL_MENU_MATCHES 20
#define SOCIAL_MENU_MODERATED 64
#define SOCIAL_MENU_RECENT 32
/* the lists opened one from another, at most */
#define SOCIAL_MENU_DEPTH 8
#define SOCIAL_MENU_ROWS 160
/* the friends asked for again while shown; a list not answered asked for
again; the players muted and blocked asked for again after a failure */
#define SOCIAL_MENU_REFRESH_MILLISECONDS 20000
#define SOCIAL_MENU_RETRY_MILLISECONDS 30000
/* how long the last thing done is said, and a second A press waited for */
#define SOCIAL_MENU_MESSAGE_MILLISECONDS 6000
#define SOCIAL_MENU_CONFIRM_MILLISECONDS 4000
/* the keyboard's caption (virtual_keyboard.c's first: a name) and room
(a code is 9 characters; room for spaces around it) */
#define SOCIAL_MENU_KEYBOARD_CAPTION 8
#define SOCIAL_MENU_TYPED_LENGTH 24

/* the lists (social_menu.h) */
enum
{
	_list_home,
	_list_friends,
	_list_requests,
	_list_activity,
	_list_recent,
	_list_card,
	_list_player,
	_list_matches,
	_list_moderation,
	_list_report,
	NUMBER_OF_LISTS
};

/* a row's kind; its value is an index into its list's data */
enum
{
	_row_note,
	_row_you,
	_row_friends,
	_row_requests,
	_row_activity,
	_row_recent,
	_row_add_friend,
	_row_moderation,
	_row_friend,
	_row_incoming,
	_row_outgoing,
	_row_activity_entry,
	_row_recent_player,
	_row_matches,
	_row_join,
	_row_message,
	_row_friend_add,
	_row_friend_accept,
	_row_friend_decline,
	_row_friend_cancel,
	_row_friend_remove,
	_row_mute,
	_row_unmute,
	_row_block,
	_row_unblock,
	_row_report,
	_row_match,
	_row_moderated,
	_row_reason,
};

/* a note row's words */
enum
{
	_note_loading,
	_note_offline,
	_note_failed,
	_note_none,
};

/* what the screen asked the server for */
enum
{
	_fetch_none,
	_fetch_friends,
	_fetch_activity,
	_fetch_player,
};

/* the keyboard: what for */
enum
{
	_typing_none,
	_typing_friend_code,
};

/* ---------- structures */

/* what a player is doing, as the server lets the one asking see it */
struct social_menu_presence
{
	boolean online;
	boolean host;
	char state[16];
	char map[SOCIAL_MENU_LABEL_SIZE];
	char gametype[SOCIAL_MENU_LABEL_SIZE];
	char game[SOCIAL_MENU_LABEL_SIZE];
	long players;
	long maximum;
	char invite[SOCIAL_MENU_INVITE_SIZE];
	char last_seen[SOCIAL_MENU_TIME_SIZE];
};

struct social_menu_person
{
	char code[SOCIAL_MENU_CODE_SIZE];
	char name[SOCIAL_MENU_NAME_SIZE];
	char at[SOCIAL_MENU_TIME_SIZE];
	struct social_menu_presence presence;
	/* (the moderation list's) */
	boolean muted;
	boolean blocked;
};

/* a match or a level, as the server keeps it (the activity's with its
player's code and name) */
struct social_menu_match
{
	char code[SOCIAL_MENU_CODE_SIZE];
	char player[SOCIAL_MENU_NAME_SIZE];
	char kind[16];
	char result[8];
	/* (a match left before its end: why, quit, ended or disconnected) */
	char end_reason[16];
	char map[SOCIAL_MENU_LABEL_SIZE];
	char gametype[SOCIAL_MENU_LABEL_SIZE];
	char network[8];
	char played_at[SOCIAL_MENU_TIME_SIZE];
	long score;
	long kills;
	long deaths;
	long assists;
	long suicides;
	long betrayals;
	long seconds;
	long players;
	long place;
	long difficulty;
	long medals;
	boolean teams;
};

struct social_menu_totals
{
	long matches;
	long wins;
	long losses;
	long ties;
	long quits;
	long score;
	long kills;
	long deaths;
	long assists;
	long suicides;
	long betrayals;
	long seconds;
	long medals;
};

struct social_menu_player
{
	char code[SOCIAL_MENU_CODE_SIZE];
	char name[SOCIAL_MENU_NAME_SIZE];
	/* its records had (else asked for, or not answered) */
	boolean had;
	char created_at[SOCIAL_MENU_TIME_SIZE];
	struct social_menu_totals multiplayer;
	struct social_menu_totals campaign;
	long medal_counts[NUMBER_OF_CAMPAIGN_MEDALS];
	struct social_menu_presence presence;
	/* self, friends, incoming, outgoing, none */
	char relation[12];
	boolean muted;
	boolean blocked;
	/* it takes friend requests */
	boolean requests;
	struct social_menu_match matches[SOCIAL_MENU_MATCHES];
	short match_count;
};

struct social_menu_row
{
	short kind;
	short value;
};

/* ---------- globals */

static struct
{
	boolean open;
	short opening;
	/* the list shown, its first row shown and the one chosen, and those it
	was opened from */
	short list;
	short list_serial;
	short first;
	short chosen;
	short depth;
	struct
	{
		short list;
		short first;
		short chosen;
	} stack[SOCIAL_MENU_DEPTH];
	struct social_menu_row rows[SOCIAL_MENU_ROWS];
	short count;
	/* the last thing done, and a second A press waited for */
	char message[160];
	unsigned long message_time;
	short confirming_kind;
	unsigned long confirming_time;
	/* the keyboard */
	short typing;
	wchar_t typed[SOCIAL_MENU_TYPED_LENGTH + 1];
	/* the screen's request, what it is, and the action's */
	int fetch_ticket;
	short fetching;
	int action_ticket;
	short action_kind;
	/* the action was the chat's (its player's names): what it did said there */
	boolean action_from_chat;
	char action_name[SOCIAL_MENU_NAME_SIZE];
	/* the friends and requests: had, when, and whether it failed */
	boolean friends_had;
	boolean friends_failed;
	boolean friends_enabled;
	unsigned long friends_at;
	struct social_menu_person friends[SOCIAL_MENU_FRIENDS];
	short friend_count;
	struct social_menu_person incoming[SOCIAL_MENU_REQUESTS];
	short incoming_count;
	struct social_menu_person outgoing[SOCIAL_MENU_REQUESTS];
	short outgoing_count;
	/* the friends' activity */
	boolean activity_had;
	boolean activity_failed;
	struct social_menu_match activity[SOCIAL_MENU_ACTIVITY];
	short activity_count;
	/* the player shown, and whether asking for it failed */
	struct social_menu_player player;
	boolean player_failed;
	boolean player_wanted;
	/* the chat's players, as the screen opened */
	char recent_codes[SOCIAL_MENU_RECENT][16];
	wchar_t recent_names[SOCIAL_MENU_RECENT][32];
	short recent_count;
	/* the players muted and blocked: had, asked for, and when again */
	boolean moderation_had;
	boolean moderation_due;
	boolean moderation_failed;
	int moderation_ticket;
	unsigned long moderation_at;
	struct social_menu_person moderated[SOCIAL_MENU_MODERATED];
	short moderated_count;
	/* the invite of the game joined */
	char join_invite[SOCIAL_MENU_INVITE_SIZE];
	char answer[COMMUNITY_NET_ANSWER_MAXIMUM];
} social_menu;

static char const *const social_menu_reasons[] = {
	"SPAM", "ABUSIVE LANGUAGE", "CHEATING", "OFFENSIVE NAME", "OTHER" };
static char const *const social_menu_reason_keys[] = { "spam", "abuse", "cheating", "name", "other" };
static char const *const social_menu_difficulties[] = { "EASY", "NORMAL", "HEROIC", "LEGENDARY" };

/* ---------- text */

static void message_set(
	char const *format,
	...)
{
	va_list arguments;

	va_start(arguments, format);
	vsnprintf(social_menu.message, sizeof(social_menu.message), format, arguments);
	va_end(arguments);
	social_menu.message_time = system_milliseconds();
}

/* text appended to a buffer of size (cut short where it is full) */
static void text_add(
	char *text,
	long size,
	char const *format,
	...)
{
	long length = (long)strlen(text);
	va_list arguments;

	if (length >= size - 1)
		return;
	va_start(arguments, format);
	vsnprintf(text + length, (size_t)(size - length), format, arguments);
	va_end(arguments);
}

/* a name as the game's wide text (the basic plane of UTF-8; '?' past it) */
static void wide_from_utf8(
	char const *text,
	wchar_t *wide,
	long count)
{
	long length = 0;
	unsigned char const *cursor = (unsigned char const *)text;

	while (*cursor && length < count - 1)
	{
		unsigned long character = *cursor++;

		if (character >= 0xE0 && character < 0xF0 && (cursor[0] & 0xC0) == 0x80 && (cursor[1] & 0xC0) == 0x80)
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

/* the game's wide text (a name of the chat's, a code typed) as UTF-8 */
static void utf8_from_wide(
	wchar_t const *wide,
	char *text,
	long size)
{
	long length = 0;
	long index;

	for (index = 0; wide[index] && length < size - 1; index++)
	{
		unsigned long character = (unsigned short)wide[index];

		if (character < 0x80)
		{
			text[length++] = (char)character;
		}
		else if (character < 0x800 && length + 2 < size)
		{
			text[length++] = (char)(0xC0 | (character >> 6));
			text[length++] = (char)(0x80 | (character & 0x3F));
		}
		else if (length + 3 < size)
		{
			text[length++] = (char)(0xE0 | (character >> 12));
			text[length++] = (char)(0x80 | ((character >> 6) & 0x3F));
			text[length++] = (char)(0x80 | (character & 0x3F));
		}
		else
		{
			break;
		}
	}
	text[length] = 0;
}

static void upper_text(
	char *text)
{
	for (; *text; text++)
	{
		if (*text >= 'a' && *text <= 'z')
			*text = (char)(*text - 'a' + 'A');
	}
}

/* a code as typed: its letters and digits in capitals, the dash put back
after the fourth (the on-screen keyboard may have no "-": "abcd1234" is
"ABCD-1234"); else as typed, for the server to refuse */
static void code_normalize(
	char *code)
{
	char kept[16];
	long length = 0;
	char const *cursor;

	for (cursor = code; *cursor && length < (long)sizeof(kept) - 1; cursor++)
	{
		char character = *cursor;

		if (character >= 'a' && character <= 'z')
			character = (char)(character - 'a' + 'A');
		if ((character >= 'A' && character <= 'Z') || (character >= '0' && character <= '9'))
			kept[length++] = character;
	}
	kept[length] = 0;
	if (length == 8)
		snprintf(code, 10, "%.4s-%.4s", kept, kept + 4);
	else
		upper_text(code);
}

/* a day of the calendar as days since 1970-01-01 (Howard Hinnant's) */
static long days_from_civil(
	long year,
	long month,
	long day)
{
	long era;
	long year_of_era;
	long day_of_year;
	long day_of_era;

	year -= month <= 2;
	era = (year >= 0 ? year : year - 399) / 400;
	year_of_era = year - era * 400;
	day_of_year = (153 * (month + (month > 2 ? -3 : 9)) + 2) / 5 + day - 1;
	day_of_era = year_of_era * 365 + year_of_era / 4 - year_of_era / 100 + day_of_year;
	return era * 146097 + day_of_era - 719468;
}

/* how long ago a time the server said was ("2026-11-01T12:00:00.000Z"):
"JUST NOW", "5M AGO", "3H AGO", "2D AGO", else its day; "" for none */
static void ago_text(
	char const *iso,
	char *text,
	long size)
{
	int year;
	int month;
	int day;
	int hour = 0;
	int minute = 0;
	int second = 0;
	long seconds;
	long now = (long)time(NULL);

	text[0] = 0;
	if (!iso[0] || sscanf(iso, "%d-%d-%dT%d:%d:%d", &year, &month, &day, &hour, &minute, &second) < 3)
		return;
	seconds = now - (days_from_civil(year, month, day) * 86400L + hour * 3600L + minute * 60L + second);
	if (seconds < 60)
		snprintf(text, (size_t)size, "JUST NOW");
	else if (seconds < 3600)
		snprintf(text, (size_t)size, "%ldM AGO", seconds / 60);
	else if (seconds < 86400)
		snprintf(text, (size_t)size, "%ldH AGO", seconds / 3600);
	else if (seconds < 30 * 86400L)
		snprintf(text, (size_t)size, "%ldD AGO", seconds / 86400);
	else
		snprintf(text, (size_t)size, "%04d-%02d-%02d", year, month, day);
}

/* a time played, "1H 05M" or "12M 30S" */
static void duration_text(
	long seconds,
	char *text,
	long size)
{
	if (seconds >= 3600)
		snprintf(text, (size_t)size, "%ldH %02ldM", seconds / 3600, (seconds / 60) % 60);
	else
		snprintf(text, (size_t)size, "%ldM %02ldS", seconds / 60, seconds % 60);
}

/* kills and assists for each death, as "1.75" */
static void kda_text(
	long kills,
	long deaths,
	long assists,
	char *text,
	long size)
{
	long hundredths = (kills + assists) * 100 / MAX(deaths, 1);

	snprintf(text, (size_t)size, "%ld.%02ld", hundredths / 100, hundredths % 100);
}

/* ---------- the server's answers */

static void json_text(
	struct server_json_document const *document,
	int token,
	char const *key,
	char *text,
	int size)
{
	int member = token >= 0 ? server_json_member(document, token, key) : -1;

	text[0] = 0;
	if (member < 0 || !server_json_get_string(document, member, text, size))
		text[0] = 0;
}

static long json_number(
	struct server_json_document const *document,
	int token,
	char const *key,
	long otherwise)
{
	int member = token >= 0 ? server_json_member(document, token, key) : -1;
	double value;

	return member >= 0 && server_json_get_number(document, member, &value) ? (long)value : otherwise;
}

static boolean json_boolean(
	struct server_json_document const *document,
	int token,
	char const *key)
{
	int member = token >= 0 ? server_json_member(document, token, key) : -1;
	int value = 0;

	return member >= 0 && server_json_get_boolean(document, member, &value) && value;
}

/* the answer parsed, its data's token (-1: not one the server sent whole) */
static int answer_data(
	struct server_json_document *document)
{
	if (!server_json_parse(document, social_menu.answer, (int)strlen(social_menu.answer), 16))
		return -2;
	return server_json_member(document, 0, "data");
}

static void presence_read(
	struct server_json_document const *document,
	int token,
	struct social_menu_presence *presence)
{
	csmemset(presence, 0, sizeof(*presence));
	presence->online = json_boolean(document, token, "online");
	presence->host = json_boolean(document, token, "host");
	json_text(document, token, "state", presence->state, sizeof(presence->state));
	json_text(document, token, "map", presence->map, sizeof(presence->map));
	json_text(document, token, "gametype", presence->gametype, sizeof(presence->gametype));
	json_text(document, token, "game", presence->game, sizeof(presence->game));
	json_text(document, token, "invite", presence->invite, sizeof(presence->invite));
	json_text(document, token, "lastSeenAt", presence->last_seen, sizeof(presence->last_seen));
	presence->players = json_number(document, token, "players", 0);
	presence->maximum = json_number(document, token, "maximum", 0);
	/* (an older game's main menu, its scenario ui, said as a campaign) */
	if (!strcmp(presence->state, "campaign") && !strcmp(presence->map, "ui"))
	{
		snprintf(presence->state, sizeof(presence->state), "menus");
		presence->map[0] = 0;
	}
}

static short people_read(
	struct server_json_document const *document,
	int array,
	struct social_menu_person *people,
	short maximum)
{
	short count = 0;
	int index;

	for (index = 0; array >= 0 && count < maximum; index++)
	{
		int element = server_json_element(document, array, index);
		struct social_menu_person *person = &people[count];

		if (element < 0)
			break;
		csmemset(person, 0, sizeof(*person));
		json_text(document, element, "code", person->code, sizeof(person->code));
		json_text(document, element, "name", person->name, sizeof(person->name));
		json_text(document, element, "at", person->at, sizeof(person->at));
		if (!person->at[0])
			json_text(document, element, "since", person->at, sizeof(person->at));
		presence_read(document, element, &person->presence);
		if (person->code[0])
			count++;
	}
	return count;
}

static void match_read(
	struct server_json_document const *document,
	int token,
	struct social_menu_match *match)
{
	int medals = server_json_member(document, token, "medals");
	int index;

	csmemset(match, 0, sizeof(*match));
	json_text(document, token, "code", match->code, sizeof(match->code));
	json_text(document, token, "player", match->player, sizeof(match->player));
	json_text(document, token, "kind", match->kind, sizeof(match->kind));
	json_text(document, token, "result", match->result, sizeof(match->result));
	json_text(document, token, "endReason", match->end_reason, sizeof(match->end_reason));
	json_text(document, token, "map", match->map, sizeof(match->map));
	json_text(document, token, "gametype", match->gametype, sizeof(match->gametype));
	json_text(document, token, "network", match->network, sizeof(match->network));
	json_text(document, token, "playedAt", match->played_at, sizeof(match->played_at));
	match->score = json_number(document, token, "score", 0);
	match->kills = json_number(document, token, "kills", 0);
	match->deaths = json_number(document, token, "deaths", 0);
	match->assists = json_number(document, token, "assists", 0);
	match->suicides = json_number(document, token, "suicides", 0);
	match->betrayals = json_number(document, token, "betrayals", 0);
	match->seconds = json_number(document, token, "seconds", 0);
	match->players = json_number(document, token, "players", 0);
	match->place = json_number(document, token, "place", 0);
	match->difficulty = json_number(document, token, "difficulty", 0);
	match->teams = json_boolean(document, token, "teams");
	/* (the medals won in it, all told) */
	for (index = 0; medals >= 0 && index < NUMBER_OF_CAMPAIGN_MEDALS; index++)
		match->medals += json_number(document, medals, campaign_medal_descriptions[index].key, 0);
}

static void totals_read(
	struct server_json_document const *document,
	int token,
	struct social_menu_totals *totals)
{
	totals->matches = json_number(document, token, "matches", 0);
	totals->wins = json_number(document, token, "wins", 0);
	totals->losses = json_number(document, token, "losses", 0);
	totals->ties = json_number(document, token, "ties", 0);
	totals->quits = json_number(document, token, "quits", 0);
	totals->score = json_number(document, token, "score", 0);
	totals->kills = json_number(document, token, "kills", 0);
	totals->deaths = json_number(document, token, "deaths", 0);
	totals->assists = json_number(document, token, "assists", 0);
	totals->suicides = json_number(document, token, "suicides", 0);
	totals->betrayals = json_number(document, token, "betrayals", 0);
	totals->seconds = json_number(document, token, "seconds", 0);
	totals->medals = json_number(document, token, "medals", 0);
}

static void friends_take(
	boolean answered)
{
	struct server_json_document document;
	int data;

	social_menu.friends_at = system_milliseconds();
	social_menu.friends_failed = !answered;
	if (!answered)
		return;
	data = answer_data(&document);
	if (data == -2)
	{
		social_menu.friends_failed = TRUE;
		return;
	}
	if (data >= 0)
	{
		social_menu.friends_enabled = json_boolean(&document, data, "enabled");
		social_menu.friend_count = people_read(&document, server_json_member(&document, data, "friends"),
			social_menu.friends, SOCIAL_MENU_FRIENDS);
		social_menu.incoming_count = people_read(&document, server_json_member(&document, data, "incoming"),
			social_menu.incoming, SOCIAL_MENU_REQUESTS);
		social_menu.outgoing_count = people_read(&document, server_json_member(&document, data, "outgoing"),
			social_menu.outgoing, SOCIAL_MENU_REQUESTS);
		social_menu.friends_had = TRUE;
	}
	else
	{
		social_menu.friends_failed = TRUE;
	}
	server_json_document_free(&document);
}

static void activity_take(
	boolean answered)
{
	struct server_json_document document;
	int data;
	int array;
	int index;

	social_menu.activity_failed = !answered;
	if (!answered)
		return;
	data = answer_data(&document);
	if (data == -2)
	{
		social_menu.activity_failed = TRUE;
		return;
	}
	array = data >= 0 ? server_json_member(&document, data, "activity") : -1;
	social_menu.activity_count = 0;
	for (index = 0; array >= 0 && social_menu.activity_count < SOCIAL_MENU_ACTIVITY; index++)
	{
		int element = server_json_element(&document, array, index);

		if (element < 0)
			break;
		match_read(&document, element, &social_menu.activity[social_menu.activity_count++]);
	}
	social_menu.activity_had = data >= 0;
	social_menu.activity_failed = data < 0;
	server_json_document_free(&document);
}

static void player_take(
	boolean answered,
	int status)
{
	struct social_menu_player *player = &social_menu.player;
	struct server_json_document document;
	int data;
	int token;
	int medals;
	int matches;
	short index;

	social_menu.player_failed = !answered || status != 200;
	if (social_menu.player_failed)
	{
		if (answered && status == 404 && !strstr(social_menu.answer, "\"not_found\""))
			message_set("No player has the code %s.", player->code);
		else if (answered && status == 404)
			message_set("The community server has no player pages yet:\nit needs updating.");
		return;
	}
	data = answer_data(&document);
	if (data == -2)
	{
		social_menu.player_failed = TRUE;
		return;
	}
	token = data >= 0 ? server_json_member(&document, data, "player") : -1;
	if (token >= 0)
	{
		char code[SOCIAL_MENU_CODE_SIZE];
		int stats = server_json_member(&document, token, "stats");

		/* (the answer of a player asked for before another was) */
		json_text(&document, token, "code", code, sizeof(code));
		if (!strcmp(code, player->code))
		{
			json_text(&document, token, "name", player->name, sizeof(player->name));
			if (!player->name[0])
				snprintf(player->name, sizeof(player->name), "%s", player->code);
			json_text(&document, token, "createdAt", player->created_at, sizeof(player->created_at));
			json_text(&document, token, "relation", player->relation, sizeof(player->relation));
			player->muted = json_boolean(&document, token, "muted");
			player->blocked = json_boolean(&document, token, "blocked");
			player->requests = json_boolean(&document, token, "requests");
			presence_read(&document, token, &player->presence);
			totals_read(&document, stats >= 0 ? server_json_member(&document, stats, "multiplayer") : -1,
				&player->multiplayer);
			totals_read(&document, stats >= 0 ? server_json_member(&document, stats, "campaign") : -1,
				&player->campaign);
			medals = server_json_member(&document, token, "medals");
			for (index = 0; index < NUMBER_OF_CAMPAIGN_MEDALS; index++)
				player->medal_counts[index] = json_number(&document, medals, campaign_medal_descriptions[index].key, 0);
			matches = server_json_member(&document, data, "matches");
			player->match_count = 0;
			for (index = 0; matches >= 0 && player->match_count < SOCIAL_MENU_MATCHES; index++)
			{
				int element = server_json_element(&document, matches, index);

				if (element < 0)
					break;
				match_read(&document, element, &player->matches[player->match_count++]);
			}
			player->had = TRUE;
		}
	}
	else
	{
		social_menu.player_failed = TRUE;
	}
	server_json_document_free(&document);
}

/* the players muted and blocked, one row each (both, once), and the chat's
names of them */
static void moderation_take(
	void)
{
	struct server_json_document document;
	struct social_menu_person blocked[SOCIAL_MENU_MODERATED];
	wchar_t names[SOCIAL_MENU_MODERATED][32];
	int data = answer_data(&document);
	short blocked_count;
	short index;

	if (data == -2)
		return;
	if (data >= 0)
	{
		social_menu.moderated_count = people_read(&document, server_json_member(&document, data, "muted"),
			social_menu.moderated, SOCIAL_MENU_MODERATED);
		for (index = 0; index < social_menu.moderated_count; index++)
			social_menu.moderated[index].muted = TRUE;
		blocked_count = people_read(&document, server_json_member(&document, data, "blocked"), blocked,
			SOCIAL_MENU_MODERATED);
		for (index = 0; index < blocked_count; index++)
		{
			short other;

			for (other = 0; other < social_menu.moderated_count; other++)
			{
				if (!strcmp(social_menu.moderated[other].code, blocked[index].code))
					break;
			}
			if (other == social_menu.moderated_count)
			{
				if (social_menu.moderated_count >= SOCIAL_MENU_MODERATED)
					continue;
				social_menu.moderated[social_menu.moderated_count++] = blocked[index];
			}
			social_menu.moderated[other].blocked = TRUE;
		}
		social_menu.moderation_had = TRUE;
		for (index = 0; index < social_menu.moderated_count; index++)
			wide_from_utf8(social_menu.moderated[index].name, names[index], NUMBEROF(names[index]));
		social_chat_unheard_set((wchar_t const (*)[32])names, social_menu.moderated_count);
	}
	server_json_document_free(&document);
}

/* ---------- asking */

static boolean social_menu_online(
	void)
{
	return social_enabled() && social_account_code()[0];
}

/* the screen's request: the friends, the activity or the player shown, if
none is asked already */
static void fetch(
	short what)
{
	char path[64];

	if (social_menu.fetch_ticket || !social_menu_online())
		return;
	if (what == _fetch_friends)
		snprintf(path, sizeof(path), "/friends");
	else if (what == _fetch_activity)
		snprintf(path, sizeof(path), "/activity?limit=%d", SOCIAL_MENU_ACTIVITY);
	else
		snprintf(path, sizeof(path), "/players/%s?matches=%d", social_menu.player.code, SOCIAL_MENU_MATCHES);
	social_menu.fetch_ticket = social_send(path, NULL);
	if (social_menu.fetch_ticket)
		social_menu.fetching = what;
	else if (what == _fetch_friends)
		social_menu.friends_at = system_milliseconds();
	if (what == _fetch_player)
		social_menu.player_wanted = !social_menu.fetch_ticket;
}

/* an action: POST path of {code, ...}, said as done once answered */
static void act_as(
	short kind,
	char const *path,
	char const *code,
	char const *name,
	char const *action,
	char const *reason,
	boolean from_chat)
{
	struct server_json json;

	social_menu.action_from_chat = from_chat;

	if (!social_menu_online())
	{
		message_set("The community server is not reached: Settings > Gameplay > Community's ONLINE.");
		return;
	}
	if (social_menu.action_ticket)
	{
		message_set("Still waiting for the server: try again.");
		return;
	}
	server_json_begin(&json);
	server_json_object_begin(&json, NULL);
	server_json_string(&json, "code", code);
	if (action)
		server_json_string(&json, "action", action);
	if (reason)
		server_json_string(&json, "reason", reason);
	server_json_object_end(&json);
	social_menu.action_ticket = social_send(path, server_json_text(&json));
	server_json_free(&json);
	if (!social_menu.action_ticket)
	{
		message_set("The server could not be asked: try again.");
		return;
	}
	social_menu.action_kind = kind;
	snprintf(social_menu.action_name, sizeof(social_menu.action_name), "%s", name && name[0] ? name : code);
	message_set("Asking the server...");
}

static void act(
	short kind,
	char const *path,
	char const *code,
	char const *name,
	char const *action,
	char const *reason)
{
	act_as(kind, path, code, name, action, reason, FALSE);
}

/* an action answered: what it did, or why not; what it changed asked for again */
static void action_take(
	boolean answered,
	int status)
{
	char const *name = social_menu.action_name;
	char const *answer = social_menu.answer;

	if (!answered)
		message_set("The server did not answer: try again.");
	else if (status == 404 && strstr(answer, "\"not_found\""))
		message_set("The community server has no friends yet: it needs updating.");
	else if (status == 404)
		message_set(social_menu.action_kind == _row_friend_accept ? "That request is gone." : "No player has that code.");
	else if (status == 403 && strstr(answer, "not_accepting"))
		message_set("%s takes no friend requests.", name);
	else if (status == 403 && strstr(answer, "friends_off"))
		message_set("Your friend list is off: Settings > Gameplay > Social > Friends.");
	else if (status == 403 && strstr(answer, "\"blocked\""))
		message_set("You blocked %s: unblock them first.", name);
	else if (status == 403)
		message_set("%s cannot be added.", name);
	else if (status == 422 && strstr(answer, "own code"))
		message_set("That is your own code.");
	else if (status == 422 && strstr(answer, "too_many"))
		message_set("Your list is full.");
	else if (status == 422)
		message_set("That is not a player's code (XXXX-XXXX).");
	else if (status == 429)
		message_set("Too many at once: wait a moment.");
	else if (status != 200)
		message_set("The server refused it (%d).", status);
	else
	{
		switch (social_menu.action_kind)
		{
		case _row_add_friend:
		case _row_friend_add:
			message_set(strstr(answer, "\"friends\"") ? "%s is now your friend." : "Asked %s to be your friend.", name);
			break;
		case _row_friend_accept:
			message_set("%s is now your friend.", name);
			break;
		case _row_friend_decline:
			message_set("Declined %s's request.", name);
			break;
		case _row_friend_cancel:
			message_set("Took back the request to %s.", name);
			break;
		case _row_friend_remove:
			message_set("%s is no longer your friend.", name);
			break;
		case _row_mute:
			message_set("Muted %s: their lines are hidden.", name);
			break;
		case _row_unmute:
			message_set("%s is no longer muted.", name);
			break;
		case _row_block:
			message_set("Blocked %s.", name);
			break;
		case _row_unblock:
			message_set("%s is no longer blocked.", name);
			break;
		case _row_reason:
			message_set(strstr(answer, "\"duplicate\":true") ? "You reported %s already (and muted them)." :
				"Reported %s, and muted them. Thank you.", name);
			break;
		}
	}
	/* (said in the chat too, when it asked) */
	if (social_menu.action_from_chat)
		social_chat_notice_text(social_menu.message);
	social_menu.action_from_chat = FALSE;
	/* (what it changed) */
	social_menu.friends_at = 0;
	social_menu.friends_had = social_menu.friends_had && answered;
	social_menu.moderation_due = TRUE;
	if (social_menu.list == _list_card || social_menu.list == _list_player || social_menu.depth)
		social_menu.player_wanted = TRUE;
	if (social_menu.list == _list_report && answered && status == 200)
	{
		/* (back to the player reported) */
		social_menu_back();
	}
}

void social_menu_update(
	void)
{
	unsigned long now = system_milliseconds();

	if (!social_menu_online())
		return;
	if (social_menu.fetch_ticket)
	{
		int status = 0;
		int result = community_net_poll(social_menu.fetch_ticket, &status, social_menu.answer,
			sizeof(social_menu.answer));
		boolean answered = result == _community_net_answered && status == 200;

		if (result != _community_net_waiting)
		{
			short what = social_menu.fetching;

			social_menu.fetch_ticket = 0;
			social_menu.fetching = _fetch_none;
			if (what == _fetch_friends)
				friends_take(answered);
			else if (what == _fetch_activity)
				activity_take(answered);
			else if (what == _fetch_player)
				player_take(result == _community_net_answered, status);
		}
	}
	if (social_menu.action_ticket)
	{
		int status = 0;
		int result = community_net_poll(social_menu.action_ticket, &status, social_menu.answer,
			sizeof(social_menu.answer));

		if (result != _community_net_waiting)
		{
			social_menu.action_ticket = 0;
			action_take(result == _community_net_answered, status);
		}
	}
	/* (a player asked for, by the screen or the chat; and the friends once,
	which the chat's names ask about) */
	if (social_menu.player_wanted && social_menu.player.code[0])
		fetch(_fetch_player);
	if (!social_menu.friends_had && !social_menu.friends_at)
		fetch(_fetch_friends);
	/* (the players muted and blocked: the chat's, whether the screen is open) */
	if (social_menu.moderation_ticket)
	{
		int status = 0;
		int result = community_net_poll(social_menu.moderation_ticket, &status, social_menu.answer,
			sizeof(social_menu.answer));

		if (result != _community_net_waiting)
		{
			social_menu.moderation_ticket = 0;
			social_menu.moderation_failed = result != _community_net_answered || status != 200;
			if (!social_menu.moderation_failed)
				moderation_take();
			social_menu.moderation_at = now ? now : 1;
		}
	}
	else if (social_menu.moderation_due ||
		((!social_menu.moderation_had || social_menu.moderation_failed) &&
			(!social_menu.moderation_at || now - social_menu.moderation_at > SOCIAL_MENU_RETRY_MILLISECONDS)))
	{
		social_menu.moderation_ticket = social_send("/moderation", NULL);
		if (social_menu.moderation_ticket)
			social_menu.moderation_due = FALSE;
		social_menu.moderation_at = now ? now : 1;
	}
}

/* ---------- the lists */

static void row_add(
	short kind,
	short value)
{
	if (social_menu.count >= SOCIAL_MENU_ROWS)
		return;
	social_menu.rows[social_menu.count].kind = kind;
	social_menu.rows[social_menu.count].value = value;
	social_menu.count++;
}

static struct social_menu_row const *row_get(
	short row)
{
	return row >= 0 && row < social_menu.count ? &social_menu.rows[row] : NULL;
}

/* a list's note when it has nothing: the server not reached, asked, or none */
static void note_add(
	boolean had,
	boolean failed)
{
	row_add(_row_note, !social_menu_online() ? _note_offline : failed ? _note_failed : had ? _note_none : _note_loading);
}

static void rows_build(
	void)
{
	struct social_menu_player const *player = &social_menu.player;
	short index;

	social_menu.count = 0;
	switch (social_menu.list)
	{
	case _list_home:
		row_add(_row_you, 0);
		row_add(_row_friends, 0);
		row_add(_row_requests, 0);
		row_add(_row_activity, 0);
		row_add(_row_recent, 0);
		row_add(_row_add_friend, 0);
		row_add(_row_moderation, 0);
		break;
	case _list_friends:
		row_add(_row_add_friend, 0);
		for (index = 0; index < social_menu.friend_count; index++)
			row_add(_row_friend, index);
		if (!social_menu.friend_count)
			note_add(social_menu.friends_had, social_menu.friends_failed);
		break;
	case _list_requests:
		for (index = 0; index < social_menu.incoming_count; index++)
			row_add(_row_incoming, index);
		for (index = 0; index < social_menu.outgoing_count; index++)
			row_add(_row_outgoing, index);
		if (!social_menu.incoming_count && !social_menu.outgoing_count)
			note_add(social_menu.friends_had, social_menu.friends_failed);
		break;
	case _list_activity:
		for (index = 0; index < social_menu.activity_count; index++)
			row_add(_row_activity_entry, index);
		if (!social_menu.activity_count)
			note_add(social_menu.activity_had, social_menu.activity_failed);
		break;
	case _list_recent:
		for (index = 0; index < social_menu.recent_count; index++)
			row_add(_row_recent_player, index);
		if (!social_menu.recent_count)
			row_add(_row_note, _note_none);
		break;
	case _list_card:
		/* (the card is drawn where the rows are: none; its OPTIONS button,
		social_menu_card_options, opens what can be done) */
		break;
	case _list_player:
		row_add(_row_matches, 0);
		if (!player->had || !strcmp(player->relation, "self"))
			break;
		if (player->presence.invite[0])
			row_add(_row_join, 0);
		if (config_boolean("social.chat") && config_boolean("social.private_chat") && !player->blocked)
			row_add(_row_message, 0);
		if (!strcmp(player->relation, "friends"))
			row_add(_row_friend_remove, 0);
		else if (!strcmp(player->relation, "incoming"))
		{
			row_add(_row_friend_accept, 0);
			row_add(_row_friend_decline, 0);
		}
		else if (!strcmp(player->relation, "outgoing"))
			row_add(_row_friend_cancel, 0);
		else if (!player->blocked)
			row_add(_row_friend_add, 0);
		row_add(player->muted ? _row_unmute : _row_mute, 0);
		row_add(player->blocked ? _row_unblock : _row_block, 0);
		row_add(_row_report, 0);
		break;
	case _list_matches:
		for (index = 0; index < player->match_count; index++)
			row_add(_row_match, index);
		if (!player->match_count)
			note_add(player->had, social_menu.player_failed);
		break;
	case _list_moderation:
		for (index = 0; index < social_menu.moderated_count; index++)
			row_add(_row_moderated, index);
		if (!social_menu.moderated_count)
			note_add(social_menu.moderation_had, FALSE);
		break;
	case _list_report:
		for (index = 0; index < (short)NUMBEROF(social_menu_reasons); index++)
			row_add(_row_reason, index);
		break;
	}
}

/* a list opened from the one shown (B comes back to it as it was) */
static void list_open(
	short list)
{
	if (social_menu.depth < SOCIAL_MENU_DEPTH)
	{
		social_menu.stack[social_menu.depth].list = social_menu.list;
		social_menu.stack[social_menu.depth].first = social_menu.first;
		social_menu.stack[social_menu.depth].chosen = social_menu.chosen;
		social_menu.depth++;
	}
	social_menu.list = list;
	social_menu.list_serial++;
	social_menu.first = 0;
	social_menu.chosen = 0;
	social_menu.confirming_kind = NONE;
	if (list == _list_friends || list == _list_requests)
		fetch(_fetch_friends);
	else if (list == _list_activity)
	{
		social_menu.activity_had = FALSE;
		fetch(_fetch_activity);
	}
	else if (list == _list_moderation)
		social_menu.moderation_due = TRUE;
	else if (list == _list_recent)
		social_menu.recent_count = social_chat_recent_players(social_menu.recent_codes, social_menu.recent_names,
			SOCIAL_MENU_RECENT);
}

/* a player's list (its records asked for), by its code; its name shown
until they come */
static void player_open(
	char const *code,
	char const *name)
{
	struct social_menu_player *player = &social_menu.player;

	if (!code[0])
		return;
	if (strcmp(player->code, code))
	{
		csmemset(player, 0, sizeof(*player));
		snprintf(player->code, sizeof(player->code), "%s", code);
		snprintf(player->name, sizeof(player->name), "%s", name && name[0] ? name : code);
	}
	social_menu.player_failed = FALSE;
	list_open(_list_card);
	social_menu.player_wanted = TRUE;
}

void social_menu_open_at(
	short where)
{
	social_menu.opening = where;
}

void social_menu_open(
	void)
{
	social_menu.open = TRUE;
	social_menu.depth = 0;
	social_menu.list = _list_home;
	social_menu.list_serial++;
	social_menu.first = 0;
	social_menu.chosen = 0;
	social_menu.message[0] = 0;
	social_menu.confirming_kind = NONE;
	social_menu.typing = _typing_none;
	social_menu.friends_at = 0;
	if (social_menu.opening == _social_menu_open_moderation)
	{
		list_open(_list_moderation);
		/* (B leaves the screen, back to Settings) */
		social_menu.depth = 0;
	}
	else if (social_menu.opening == _social_menu_open_profile && social_account_code()[0])
	{
		char me[SOCIAL_MENU_NAME_SIZE];

		social_player_name(me, sizeof(me));
		player_open(social_account_code(), me);
		social_menu.depth = 0;
	}
	social_menu.opening = _social_menu_open_home;
}

void social_menu_close(
	void)
{
	social_menu.open = FALSE;
	if (social_menu.typing != _typing_none && virtual_keyboard_active())
		virtual_keyboard_close();
	social_menu.typing = _typing_none;
}

static void keyboard_open(
	void)
{
	csmemset(social_menu.typed, 0, sizeof(social_menu.typed));
	virtual_keyboard_allow_any_name();
	if (!virtual_keyboard_launch(social_menu.typed, (word)sizeof(social_menu.typed), SOCIAL_MENU_KEYBOARD_CAPTION))
	{
		message_set("The keyboard did not open.");
		return;
	}
	social_menu.typing = _typing_friend_code;
}

void social_menu_poll(
	void)
{
	unsigned long now = system_milliseconds();

	/* (a friend's code typed, once the keyboard has closed) */
	if (social_menu.typing != _typing_none && !virtual_keyboard_active())
	{
		social_menu.typing = _typing_none;
		if (virtual_keyboard_last_exit_saved_text())
		{
			char code[SOCIAL_MENU_TYPED_LENGTH * 3 + 1];

			utf8_from_wide(social_menu.typed, code, sizeof(code));
			code_normalize(code);
			if (code[0])
				act(_row_add_friend, "/friends", code, code, NULL, NULL);
		}
	}
	if (social_menu.message[0] && now - social_menu.message_time > SOCIAL_MENU_MESSAGE_MILLISECONDS &&
		!social_menu.action_ticket)
	{
		social_menu.message[0] = 0;
	}
	if (social_menu.confirming_kind != NONE && now - social_menu.confirming_time > SOCIAL_MENU_CONFIRM_MILLISECONDS)
		social_menu.confirming_kind = NONE;
	/* (what the lists shown want: the friends again a while after, the
	player asked for) */
	if (social_menu.list == _list_home || social_menu.list == _list_friends || social_menu.list == _list_requests)
	{
		if (!social_menu.friends_at || now - social_menu.friends_at > SOCIAL_MENU_REFRESH_MILLISECONDS)
			fetch(_fetch_friends);
	}
	rows_build();
	if (social_menu.chosen >= social_menu.count)
		social_menu.chosen = (short)MAX(0, social_menu.count - 1);
}

short social_menu_list(
	void)
{
	return social_menu.list_serial;
}

short social_menu_count(
	void)
{
	return social_menu.count;
}

short *social_menu_first(
	void)
{
	return &social_menu.first;
}

short *social_menu_chosen(
	void)
{
	return &social_menu.chosen;
}

/* ---------- what the rows say */

/* a player's state in a row: ONLINE, IN GAME, OFFLINE... */
static void presence_state(
	struct social_menu_presence const *presence,
	char *text,
	long size)
{
	if (!presence->online)
		snprintf(text, (size_t)size, "OFFLINE");
	else if (presence->invite[0])
		snprintf(text, (size_t)size, "JOINABLE");
	else if (!strcmp(presence->state, "multiplayer"))
		snprintf(text, (size_t)size, "IN GAME");
	else if (!strcmp(presence->state, "campaign"))
		snprintf(text, (size_t)size, "CAMPAIGN");
	else if (!strcmp(presence->state, "theater"))
		snprintf(text, (size_t)size, "THEATER");
	else
		snprintf(text, (size_t)size, "ONLINE");
}

/* what a player is doing, as a line of the details */
static void presence_line(
	struct social_menu_presence const *presence,
	char *text,
	long size)
{
	char ago[SOCIAL_MENU_TIME_SIZE];

	if (!presence->online)
	{
		ago_text(presence->last_seen, ago, sizeof(ago));
		text_add(text, size, ago[0] ? "Offline, last seen %s.\n" : "Offline.\n", ago);
		return;
	}
	if (!strcmp(presence->state, "multiplayer"))
	{
		text_add(text, size, "Playing %s%s%s", presence->gametype[0] ? presence->gametype : "multiplayer",
			presence->map[0] ? " on " : "", presence->map);
		if (presence->maximum > 0)
			text_add(text, size, " (%ld/%ld)", presence->players, presence->maximum);
		text_add(text, size, presence->host ? ", hosting %s.\n" : ".\n", presence->game);
		if (presence->invite[0])
			text_add(text, size, "JOIN GAME joins it.\n");
	}
	else if (!strcmp(presence->state, "campaign"))
	{
		text_add(text, size, "Playing the campaign%s%s.\n", presence->map[0] ? ": " : "", presence->map);
	}
	else if (!strcmp(presence->state, "theater"))
	{
		text_add(text, size, "Watching a replay.\n");
	}
	else
	{
		text_add(text, size, presence->state[0] ? "Online, in the menus.\n" : "Online.\n");
	}
}

/* a match in a row: its result and what it was */
static void match_name(
	struct social_menu_match const *match,
	boolean with_player,
	char *text,
	long size)
{
	char result[16];

	/* (one left before its end: QUIT, ENDED or DISCONNECTED) */
	snprintf(result, sizeof(result), "%s", match->end_reason[0] ? match->end_reason : match->result);
	upper_text(result);
	text[0] = 0;
	if (with_player)
		text_add(text, size, "%s: ", match->player);
	if (!strcmp(match->kind, "campaign"))
	{
		text_add(text, size, "%s %s", match->map, match->difficulty >= 0 && match->difficulty <= 3 ?
			social_menu_difficulties[match->difficulty] : "");
	}
	else
	{
		text_add(text, size, "%s%s%s", result[0] ? result : "", result[0] ? " " : "",
			match->gametype[0] ? match->gametype : "MATCH");
	}
}

static void match_details(
	struct social_menu_match const *match,
	char *text,
	long size)
{
	char line[32];

	if (!strcmp(match->kind, "campaign"))
	{
		text_add(text, size, "Campaign level %s won on %s.\n", match->map, match->difficulty >= 0 &&
			match->difficulty <= 3 ? social_menu_difficulties[match->difficulty] : "?");
		text_add(text, size, "Score %ld. Kills %ld, deaths %ld.\n", match->score, match->kills, match->deaths);
	}
	else
	{
		text_add(text, size, "%s on %s%s, %ld players.\n", match->gametype[0] ? match->gametype : "A match",
			match->map[0] ? match->map : "?", match->teams ? " (teams)" : "", match->players);
		if (!strcmp(match->end_reason, "quit"))
			text_add(text, size, "Quit before its end.\n");
		else if (!strcmp(match->end_reason, "disconnected"))
			text_add(text, size, "Left before its end: the connection was lost.\n");
		else if (match->end_reason[0])
			text_add(text, size, "Ended by its host before its end.\n");
		else if (match->result[0])
			text_add(text, size, "Result: %s.\n", match->result);
		if (match->place > 0)
			text_add(text, size, "Place: %ld.\n", match->place);
		kda_text(match->kills, match->deaths, match->assists, line, sizeof(line));
		text_add(text, size, "Score %ld. K %ld, D %ld, A %ld (KDA %s).\n", match->score, match->kills, match->deaths,
			match->assists, line);
		if (match->suicides || match->betrayals)
			text_add(text, size, "Suicides %ld, betrayals %ld.\n", match->suicides, match->betrayals);
	}
	if (match->medals)
		text_add(text, size, "Medals: %ld.\n", match->medals);
	if (match->seconds)
	{
		char duration[24];

		duration_text(match->seconds, duration, sizeof(duration));
		text_add(text, size, "Time: %s.\n", duration);
	}
	ago_text(match->played_at, line, sizeof(line));
	if (line[0])
		text_add(text, size, "Played %s.\n", line);
}

/* ---------- the player's card

drawn over the screen's rows while a player's card is shown (_list_card), as
the level's summary is drawn (campaign_score.c's panels), in units of the
screen's 480 lines from the card's top left: the player's name, code and
what they are doing; their multiplayer and campaign totals side by side;
and every medal's icon, those won with how many times, the others dimmed */

enum
{
	/* (the least it is: wider, as its room is when it is made smaller) */
	SOCIAL_CARD_WIDTH = 600,
	SOCIAL_CARD_HEIGHT = 335,
	SOCIAL_CARD_PADDING = 14,
	SOCIAL_CARD_GAP = 8,
	/* (between the two halves, and a half's two columns) */
	SOCIAL_CARD_HALF_GAP = 24,
	SOCIAL_CARD_COLUMN_GAP = 16,
	SOCIAL_CARD_MEDAL_SIZE = 22,
	/* (the least a medal and its count take: the row's room shared out
	among as many as fit) */
	SOCIAL_CARD_MEDAL_SPACE = 56,
	SOCIAL_CARD_TOTALS_ROWS = 6,
};

/* the card's fonts: its text, and the name's */
struct social_card_fonts
{
	struct campaign_score_panel text;
	struct campaign_score_panel title;
};

static void card_color(
	real_argb_color *color,
	real red,
	real green,
	real blue)
{
	color->alpha = 1.0f;
	color->red = red;
	color->green = green;
	color->blue = blue;
}

/* a label at the left of a column and its value at its right */
static void card_pair(
	struct campaign_score_panel const *panel,
	boolean draw,
	real x0,
	real x1,
	real y,
	char const *label,
	char const *value,
	boolean highlight)
{
	real_argb_color label_color;
	real_argb_color value_color;

	if (!draw || !label[0])
		return;
	card_color(&label_color, 0.55f, 0.72f, 1.0f);
	if (highlight)
		card_color(&value_color, 1.0f, 0.84f, 0.35f);
	else
		card_color(&value_color, 0.95f, 0.95f, 0.95f);
	campaign_score_panel_text(panel, label, NULL, x0, x1, y, 1.0f, _campaign_score_text_left, &label_color);
	campaign_score_panel_text(panel, value, NULL, x0, x1, y, 1.0f, _campaign_score_text_right, &value_color);
}

/* a half's totals: two columns of label and value, rows of
pairs[row][column][label, value] (the first highlighted's value gold) */
static void card_totals(
	struct campaign_score_panel const *panel,
	boolean draw,
	real x0,
	real x1,
	real y,
	real row_height,
	char const *title,
	char pairs[SOCIAL_CARD_TOTALS_ROWS][2][2][24],
	short highlight_row,
	short highlight_column)
{
	real const middle = (x0 + x1) / 2.0f;
	real_argb_color color;
	short row;

	if (!draw)
		return;
	card_color(&color, 0.95f, 0.95f, 0.95f);
	campaign_score_panel_text(panel, title, NULL, x0, x1, y, 1.0f, _campaign_score_text_center, &color);
	y += row_height + 2.0f;
	for (row = 0; row < SOCIAL_CARD_TOTALS_ROWS; row++)
	{
		card_pair(panel, draw, x0, middle - SOCIAL_CARD_COLUMN_GAP / 2.0f, y, pairs[row][0][0], pairs[row][0][1],
			row == highlight_row && highlight_column == 0);
		card_pair(panel, draw, middle + SOCIAL_CARD_COLUMN_GAP / 2.0f, x1, y, pairs[row][1][0], pairs[row][1][1],
			row == highlight_row && highlight_column == 1);
		y += row_height;
	}
}

static void card_pair_set(
	char pair[2][24],
	char const *label,
	char const *format,
	...)
{
	va_list arguments;

	snprintf(pair[0], 24, "%s", label);
	va_start(arguments, format);
	vsnprintf(pair[1], 24, format, arguments);
	va_end(arguments);
}

/* the card, from its top: its height, drawn or not */
static real card_layout(
	struct social_card_fonts const *fonts,
	boolean draw)
{
	struct social_menu_player const *player = &social_menu.player;
	struct campaign_score_panel const *panel = &fonts->text;
	real const left = SOCIAL_CARD_PADDING;
	real const right = panel->width - SOCIAL_CARD_PADDING;
	real const middle = panel->width / 2.0f;
	real const line = panel->line_height;
	real const row = line + 4.0f;
	real_argb_color color;
	char text[160];
	char other[64];
	real y = SOCIAL_CARD_PADDING;
	boolean self = player->had && !strcmp(player->relation, "self");
	short index;

	/* the name, and the code */
	if (draw)
	{
		card_color(&color, 0.95f, 0.95f, 0.95f);
		campaign_score_panel_text(&fonts->title, player->name, NULL, left, right, y, 1.0f, _campaign_score_text_left,
			&color);
		snprintf(other, sizeof(other), "CODE %s", player->code);
		card_color(&color, 0.6f, 0.66f, 0.75f);
		campaign_score_panel_text(panel, other, NULL, left, right, y + (fonts->title.line_height - line) / 2.0f, 1.0f,
			_campaign_score_text_right, &color);
	}
	y += fonts->title.line_height + 2.0f;
	/* whose friend */
	text[0] = 0;
	if (self)
		snprintf(text, sizeof(text), "THIS IS YOU");
	else if (player->had)
	{
		snprintf(text, sizeof(text), "%s", !strcmp(player->relation, "friends") ? "YOUR FRIEND" :
			!strcmp(player->relation, "incoming") ? "WANTS TO BE YOUR FRIEND" :
			!strcmp(player->relation, "outgoing") ? "FRIEND REQUEST SENT" : "PLAYER");
		presence_state(&player->presence, other, sizeof(other));
		text_add(text, sizeof(text), " - %s%s%s", other, player->muted ? " - MUTED" : "",
			player->blocked ? " - BLOCKED" : "");
	}
	if (draw)
	{
		card_color(&color, 1.0f, 0.84f, 0.35f);
		campaign_score_panel_text(panel, text, NULL, left, right, y, 1.0f, _campaign_score_text_left, &color);
	}
	y += row;
	/* (what they are doing, its first line) */
	if (player->had && !self)
	{
		char *end;

		text[0] = 0;
		presence_line(&player->presence, text, sizeof(text));
		if ((end = strchr(text, '\n')) != NULL)
			*end = 0;
		if (draw)
		{
			card_color(&color, 0.6f, 0.66f, 0.75f);
			campaign_score_panel_text(panel, text, NULL, left, right, y, 1.0f, _campaign_score_text_left, &color);
		}
		y += row;
	}
	y += SOCIAL_CARD_GAP - 4.0f;
	if (draw)
		campaign_score_panel_quad(panel, left, y, right, y + 1.0f, CAMPAIGN_SCORE_CARD_RULE);
	y += SOCIAL_CARD_GAP;
	if (!player->had)
	{
		/* (asked for, or why not: what the server said, on a line) */
		snprintf(text, sizeof(text), "%s", !social_menu.player_failed ? "ASKING THE SERVER..." :
			social_menu.message[0] ? social_menu.message : "THE SERVER DID NOT ANSWER");
		for (index = 0; text[index]; index++)
		{
			if (text[index] == '\n')
				text[index] = ' ';
		}
		upper_text(text);
		if (draw)
		{
			card_color(&color, 0.6f, 0.66f, 0.75f);
			campaign_score_panel_text(panel, text, NULL, left, right, y + row, 1.0f, _campaign_score_text_center,
				&color);
		}
		return y + row * 3.0f + SOCIAL_CARD_PADDING;
	}

	/* the totals: multiplayer's on the left, the campaign's on the right */
	{
		struct social_menu_totals const *multiplayer = &player->multiplayer;
		struct social_menu_totals const *campaign = &player->campaign;
		char pairs[SOCIAL_CARD_TOTALS_ROWS][2][2][24];
		char duration[24];

		csmemset(pairs, 0, sizeof(pairs));
		card_pair_set(pairs[0][0], "MATCHES", "%ld", multiplayer->matches);
		card_pair_set(pairs[0][1], "WON", "%ld", multiplayer->wins);
		card_pair_set(pairs[1][0], "LOST", "%ld", multiplayer->losses);
		card_pair_set(pairs[1][1], "TIED", "%ld", multiplayer->ties);
		card_pair_set(pairs[2][0], "QUIT", "%ld", multiplayer->quits);
		kda_text(multiplayer->kills, multiplayer->deaths, multiplayer->assists, other, sizeof(other));
		card_pair_set(pairs[2][1], "KDA", "%s", other);
		card_pair_set(pairs[3][0], "KILLS", "%ld", multiplayer->kills);
		card_pair_set(pairs[3][1], "DEATHS", "%ld", multiplayer->deaths);
		card_pair_set(pairs[4][0], "ASSISTS", "%ld", multiplayer->assists);
		card_pair_set(pairs[4][1], "SUICIDES", "%ld", multiplayer->suicides);
		card_pair_set(pairs[5][0], "BETRAYALS", "%ld", multiplayer->betrayals);
		duration_text(multiplayer->seconds, duration, sizeof(duration));
		card_pair_set(pairs[5][1], "TIME", "%s", duration);
		card_totals(panel, draw, left, middle - SOCIAL_CARD_HALF_GAP / 2.0f, y, row, "MULTIPLAYER", pairs, 2, 1);

		csmemset(pairs, 0, sizeof(pairs));
		card_pair_set(pairs[0][0], "LEVELS WON", "%ld", campaign->matches);
		card_pair_set(pairs[0][1], "SCORE", "%ld", campaign->score);
		card_pair_set(pairs[1][0], "KILLS", "%ld", campaign->kills);
		card_pair_set(pairs[1][1], "DEATHS", "%ld", campaign->deaths);
		kda_text(campaign->kills, campaign->deaths, campaign->assists, other, sizeof(other));
		card_pair_set(pairs[2][0], "KDA", "%s", other);
		duration_text(campaign->seconds, duration, sizeof(duration));
		card_pair_set(pairs[2][1], "TIME", "%s", duration);
		/* (and the medals, and how long they have played here) */
		card_pair_set(pairs[4][0], "MEDALS", "%ld", multiplayer->medals + campaign->medals);
		ago_text(player->created_at, duration, sizeof(duration));
		card_pair_set(pairs[4][1], "JOINED", "%s", duration[0] ? duration : "-");
		card_totals(panel, draw, middle + SOCIAL_CARD_HALF_GAP / 2.0f, right, y, row, "CAMPAIGN", pairs, 0, 1);
		if (draw)
		{
			campaign_score_panel_quad(panel, middle, y, middle + 1.0f, y + row * (SOCIAL_CARD_TOTALS_ROWS + 1),
				CAMPAIGN_SCORE_CARD_RULE);
		}
		y += row * (SOCIAL_CARD_TOTALS_ROWS + 1) + 2.0f;
	}
	y += SOCIAL_CARD_GAP - 4.0f;
	if (draw)
		campaign_score_panel_quad(panel, left, y, right, y + 1.0f, CAMPAIGN_SCORE_CARD_RULE);
	y += SOCIAL_CARD_GAP;

	/* every medal: those won with how many, the others dimmed */
	{
		long bitmap_index = campaign_medals_bitmap();
		short per_row = (short)MAX((right - left) / SOCIAL_CARD_MEDAL_SPACE, 1);
		real space = (right - left) / per_row;
		short kinds = 0;

		for (index = 0; index < NUMBER_OF_CAMPAIGN_MEDALS; index++)
			kinds += player->medal_counts[index] > 0;
		if (draw)
		{
			card_color(&color, 0.95f, 0.95f, 0.95f);
			campaign_score_panel_text(panel, "MEDALS", NULL, left, right, y, 1.0f, _campaign_score_text_left, &color);
			snprintf(text, sizeof(text), "%d OF %d", (int)kinds, (int)NUMBER_OF_CAMPAIGN_MEDALS);
			card_color(&color, 0.6f, 0.66f, 0.75f);
			campaign_score_panel_text(panel, text, NULL, left, right, y, 1.0f, _campaign_score_text_right, &color);
		}
		y += row + 2.0f;
		for (index = 0; index < NUMBER_OF_CAMPAIGN_MEDALS; index++)
		{
			real x = left + (index % per_row) * space;
			real top = y + (index / per_row) * (SOCIAL_CARD_MEDAL_SIZE + 4.0f);
			boolean won = player->medal_counts[index] > 0;
			struct bitmap_data *bitmap;

			if (!draw)
				continue;
			bitmap = bitmap_index != NONE ? bitmap_group_try_and_get_bitmap(bitmap_index, index) : NULL;
			if (bitmap)
			{
				rectangle2d bounds;

				bounds.x0 = (short)(panel->left + x * panel->scale);
				bounds.y0 = (short)(panel->top + top * panel->scale);
				bounds.x1 = (short)(panel->left + (x + SOCIAL_CARD_MEDAL_SIZE) * panel->scale);
				bounds.y1 = (short)(panel->top + (top + SOCIAL_CARD_MEDAL_SIZE) * panel->scale);
				draw_bitmap_in_rect(bitmap, &bounds, NULL, NULL, won ? 0xFFFFFFFF : 0x38FFFFFF, NULL, TRUE);
			}
			if (won)
			{
				snprintf(text, sizeof(text), "x%ld", player->medal_counts[index]);
				card_color(&color, 0.95f, 0.95f, 0.95f);
				campaign_score_panel_text(panel, text, NULL, x + SOCIAL_CARD_MEDAL_SIZE + 3.0f, x + space,
					top + (SOCIAL_CARD_MEDAL_SIZE - line) / 2.0f, 1.0f, _campaign_score_text_left, &color);
			}
		}
		y += ((NUMBER_OF_CAMPAIGN_MEDALS + per_row - 1) / per_row) * (SOCIAL_CARD_MEDAL_SIZE + 4.0f);
	}
	return y + SOCIAL_CARD_PADDING - 4.0f;
}

static boolean card_font(
	char const *name,
	struct campaign_score_panel *panel)
{
	struct font_header *font;

	/* (a map without the menus' fonts: the terminal's, as the chat's) */
	panel->font_index = tag_loaded('font', name);
	if (panel->font_index == NONE)
		panel->font_index = interface_get_tag_index(_interface_font_terminal);
	if (panel->font_index == NONE)
		return FALSE;
	font = font_definition_get(panel->font_index);
	panel->line_height = (short)(font->ascending_height + font->descending_height);
	return panel->line_height > 0;
}

/* the player's card in its room from x0 to x1, from y0 down: its bottom
(y0 for none drawn) */
static short card_draw(
	short x0,
	short y0,
	short x1)
{
	struct social_card_fonts fonts;
	real scale;
	real height;

	if (x1 <= x0)
		return y0;
	if (!card_font("ui\\small_ui", &fonts.text) || !card_font("ui\\large_ui", &fonts.title))
		return y0;
	/* (the widget's bounds are the card's room: SOCIAL_CARD_WIDTH by
	SOCIAL_CARD_HEIGHT; a card taller than that is made smaller, and as
	much wider in its units, so that it still fills the room's width) */
	scale = (real)(x1 - x0) / SOCIAL_CARD_WIDTH;
	fonts.text.scale = scale;
	fonts.text.width = SOCIAL_CARD_WIDTH;
	height = card_layout(&fonts, FALSE);
	if (height > SOCIAL_CARD_HEIGHT)
	{
		scale *= SOCIAL_CARD_HEIGHT / height;
		fonts.text.width = (x1 - x0) / scale;
		height = card_layout(&fonts, FALSE);
	}
	fonts.text.scale = fonts.title.scale = scale;
	fonts.text.left = fonts.title.left = x0;
	fonts.text.top = fonts.title.top = y0;
	fonts.title.width = fonts.text.width;
	campaign_score_panel_quad(&fonts.text, 0.0f, 0.0f, fonts.text.width, height, CAMPAIGN_SCORE_CARD_FILL);
	campaign_score_panel_frame(&fonts.text, 0.0f, 0.0f, fonts.text.width, height, CAMPAIGN_SCORE_PANEL_EDGE);
	card_layout(&fonts, TRUE);
	return (short)(y0 + height * scale);
}

void social_menu_card_draw(
	short x0,
	short y0,
	short x1,
	short y1)
{
	(void)y1;
	if (social_menu.open && social_menu.list == _list_card)
		card_draw(x0, y0, x1);
}

short social_menu_profile_card_draw(
	char const *code,
	short x0,
	short y0,
	short x1)
{
	if (strcmp(social_menu.player.code, code))
		return y0;
	return card_draw(x0, y0, x1);
}

boolean social_menu_card_shown(
	void)
{
	return social_menu.open && social_menu.list == _list_card;
}

boolean social_menu_card_has_options(
	void)
{
	return social_menu_card_shown() && strcmp(social_menu.player.code, social_account_code());
}

void social_menu_card_options(
	void)
{
	if (social_menu_card_has_options())
		list_open(_list_player);
}

void social_menu_row(
	short row,
	char *name,
	long name_size,
	char *state,
	long state_size)
{
	struct social_menu_row const *entry = row_get(row);
	struct social_menu_player const *player = &social_menu.player;
	long friends_online = 0;
	long requests = 0;
	short index;

	name[0] = 0;
	state[0] = 0;
	if (!entry)
		return;
	social_presence_counts(&friends_online, &requests);
	if (social_menu.friends_had)
	{
		friends_online = 0;
		for (index = 0; index < social_menu.friend_count; index++)
			friends_online += social_menu.friends[index].presence.online;
		requests = social_menu.incoming_count;
	}
	switch (entry->kind)
	{
	case _row_note:
		snprintf(name, (size_t)name_size, "%s", entry->value == _note_loading ? "ASKING THE SERVER..." :
			entry->value == _note_offline ? "OFFLINE" : entry->value == _note_failed ? "NOT ANSWERED" : "NONE YET");
		break;
	case _row_you:
		{
			char me[SOCIAL_MENU_NAME_SIZE];

			social_player_name(me, sizeof(me));
			snprintf(name, (size_t)name_size, "YOU: %s", me[0] ? me : "?");
			snprintf(state, (size_t)state_size, "%s", social_account_code()[0] ? social_account_code() : "...");
		}
		break;
	case _row_friends:
		snprintf(name, (size_t)name_size, "FRIENDS");
		if (!config_boolean("social.friends"))
			snprintf(state, (size_t)state_size, "OFF");
		else
			snprintf(state, (size_t)state_size, "%ld ONLINE", friends_online);
		break;
	case _row_requests:
		snprintf(name, (size_t)name_size, "FRIEND REQUESTS");
		if (requests)
			snprintf(state, (size_t)state_size, "%ld NEW", requests);
		break;
	case _row_activity:
		snprintf(name, (size_t)name_size, "ACTIVITY");
		break;
	case _row_recent:
		snprintf(name, (size_t)name_size, "RECENT PLAYERS");
		break;
	case _row_add_friend:
		snprintf(name, (size_t)name_size, "ADD FRIEND BY CODE");
		break;
	case _row_moderation:
		snprintf(name, (size_t)name_size, "BLOCKED & MUTED");
		if (social_menu.moderation_had && social_menu.moderated_count)
			snprintf(state, (size_t)state_size, "%d", (int)social_menu.moderated_count);
		break;
	case _row_friend:
		snprintf(name, (size_t)name_size, "%s", social_menu.friends[entry->value].name);
		presence_state(&social_menu.friends[entry->value].presence, state, state_size);
		break;
	case _row_incoming:
		snprintf(name, (size_t)name_size, "%s", social_menu.incoming[entry->value].name);
		snprintf(state, (size_t)state_size, "ASKED YOU");
		break;
	case _row_outgoing:
		snprintf(name, (size_t)name_size, "%s", social_menu.outgoing[entry->value].name);
		snprintf(state, (size_t)state_size, "SENT");
		break;
	case _row_activity_entry:
		match_name(&social_menu.activity[entry->value], TRUE, name, name_size);
		ago_text(social_menu.activity[entry->value].played_at, state, state_size);
		break;
	case _row_recent_player:
		utf8_from_wide(social_menu.recent_names[entry->value], name, name_size);
		snprintf(state, (size_t)state_size, "%s", social_menu.recent_codes[entry->value]);
		break;
	case _row_matches:
		snprintf(name, (size_t)name_size, "LATEST MATCHES");
		if (player->had)
			snprintf(state, (size_t)state_size, "%d", (int)player->match_count);
		break;
	case _row_join:
		snprintf(name, (size_t)name_size, "JOIN GAME");
		break;
	case _row_message:
		snprintf(name, (size_t)name_size, "SEND MESSAGE");
		break;
	case _row_friend_add:
		snprintf(name, (size_t)name_size, "ADD FRIEND");
		if (!player->requests)
			snprintf(state, (size_t)state_size, "NOT TAKEN");
		break;
	case _row_friend_accept:
		snprintf(name, (size_t)name_size, "ACCEPT REQUEST");
		break;
	case _row_friend_decline:
		snprintf(name, (size_t)name_size, "DECLINE REQUEST");
		break;
	case _row_friend_cancel:
		snprintf(name, (size_t)name_size, "TAKE BACK REQUEST");
		break;
	case _row_friend_remove:
		snprintf(name, (size_t)name_size, "REMOVE FRIEND");
		break;
	case _row_mute:
		snprintf(name, (size_t)name_size, "MUTE");
		break;
	case _row_unmute:
		snprintf(name, (size_t)name_size, "UNMUTE");
		snprintf(state, (size_t)state_size, "MUTED");
		break;
	case _row_block:
		snprintf(name, (size_t)name_size, "BLOCK");
		break;
	case _row_unblock:
		snprintf(name, (size_t)name_size, "UNBLOCK");
		snprintf(state, (size_t)state_size, "BLOCKED");
		break;
	case _row_report:
		snprintf(name, (size_t)name_size, "REPORT");
		break;
	case _row_match:
		match_name(&player->matches[entry->value], FALSE, name, name_size);
		if (!strcmp(player->matches[entry->value].kind, "campaign"))
			snprintf(state, (size_t)state_size, "%ld PTS", player->matches[entry->value].score);
		else
			snprintf(state, (size_t)state_size, "%ld-%ld", player->matches[entry->value].kills,
				player->matches[entry->value].deaths);
		break;
	case _row_moderated:
		snprintf(name, (size_t)name_size, "%s", social_menu.moderated[entry->value].name);
		snprintf(state, (size_t)state_size, "%s", social_menu.moderated[entry->value].blocked ?
			(social_menu.moderated[entry->value].muted ? "BLOCKED, MUTED" : "BLOCKED") : "MUTED");
		break;
	case _row_reason:
		snprintf(name, (size_t)name_size, "%s", social_menu_reasons[entry->value]);
		if (social_menu.confirming_kind == _row_reason && social_menu.chosen == row)
			snprintf(state, (size_t)state_size, "A AGAIN");
		break;
	}
	if (entry->kind == social_menu.confirming_kind && entry->kind != _row_reason)
		snprintf(state, (size_t)state_size, "A AGAIN");
}

/* the player's head of the details: its name, code and what it is doing */
static void player_head(
	char *title,
	long title_size,
	char *text,
	long text_size)
{
	struct social_menu_player const *player = &social_menu.player;

	snprintf(title, (size_t)title_size, "%s", player->name);
	text_add(text, text_size, "Code: %s\n", player->code);
	if (social_menu.player_failed && !player->had)
	{
		text_add(text, text_size, "The server did not answer.\n");
		return;
	}
	if (!player->had)
	{
		text_add(text, text_size, "Asking the server...\n");
		return;
	}
	if (!strcmp(player->relation, "self"))
		text_add(text, text_size, "This is you: give your code to\nfriends to be added.\n");
	else
	{
		if (!strcmp(player->relation, "friends"))
			text_add(text, text_size, "Your friend.\n");
		else if (!strcmp(player->relation, "incoming"))
			text_add(text, text_size, "Wants to be your friend.\n");
		else if (!strcmp(player->relation, "outgoing"))
			text_add(text, text_size, "You asked to be friends.\n");
		presence_line(&player->presence, text, text_size);
		if (player->muted || player->blocked)
			text_add(text, text_size, "%s%s%s.\n", player->muted ? "Muted" : "", player->muted && player->blocked ?
				", " : "", player->blocked ? (player->muted ? "blocked" : "Blocked") : "");
	}
}

void social_menu_details(
	short row,
	char *title,
	long title_size,
	char *text,
	long text_size)
{
	struct social_menu_row const *entry = row_get(row);
	struct social_menu_player const *player = &social_menu.player;

	title[0] = 0;
	text[0] = 0;
	if (social_menu.message[0])
		text_add(text, text_size, "%s\n\n", social_menu.message);
	if (!social_enabled())
	{
		snprintf(title, (size_t)title_size, "SOCIAL");
		text_add(text, text_size, "Offline. Turn on Settings > Gameplay >\nCommunity's ONLINE and Social's\nSOCIAL to "
			"see your friends.");
		return;
	}
	if (!social_account_code()[0])
	{
		snprintf(title, (size_t)title_size, "SOCIAL");
		text_add(text, text_size, "Signing in to the community server...");
		return;
	}
	if (!entry)
		return;
	switch (entry->kind)
	{
	case _row_note:
		snprintf(title, (size_t)title_size, "SOCIAL");
		text_add(text, text_size, entry->value == _note_loading ? "Asking the server..." :
			entry->value == _note_failed ? "The server did not answer: it is\nasked again in a while." :
			entry->value == _note_offline ? "The community server is not reached." :
			social_menu.list == _list_activity ? "Your friends' matches and levels\nshow here (those who show\ntheir activity)." :
			social_menu.list == _list_recent ? "The players you meet in the chat\n(in a game, or who wrote to you)\nshow here." :
			social_menu.list == _list_moderation ? "No one is muted or blocked.\nA player's MUTE and BLOCK are\nin their page." :
			"None yet.");
		break;
	case _row_you:
		{
			char me[SOCIAL_MENU_NAME_SIZE];

			social_player_name(me, sizeof(me));
			snprintf(title, (size_t)title_size, "%s", me[0] ? me : "YOU");
			text_add(text, text_size, "Your code: %s\n\nFriends add you by it. A shows\nyour records: totals, matches\nand "
				"medals.", social_account_code());
		}
		break;
	case _row_friends:
		snprintf(title, (size_t)title_size, "FRIENDS");
		if (!config_boolean("social.friends"))
			text_add(text, text_size, "Your friend list is off: Settings >\nGameplay > Social > Friends.\n\n");
		text_add(text, text_size, social_menu.friends_had ? "%d friends.\nWho is online, what they play,\nand joining "
			"their games." : "Your friends: who is online, what\nthey play, and joining their games.",
			(int)social_menu.friend_count);
		break;
	case _row_requests:
		snprintf(title, (size_t)title_size, "FRIEND REQUESTS");
		text_add(text, text_size, "Players who asked to be your\nfriend (%d), and those you asked (%d).",
			(int)social_menu.incoming_count, (int)social_menu.outgoing_count);
		break;
	case _row_activity:
		snprintf(title, (size_t)title_size, "ACTIVITY");
		text_add(text, text_size, "Your friends' latest matches and\nlevels.");
		break;
	case _row_recent:
		snprintf(title, (size_t)title_size, "RECENT PLAYERS");
		text_add(text, text_size, "The players of the chat: those in\nyour game, and those who wrote to\nyou or you "
			"wrote to.");
		break;
	case _row_add_friend:
		snprintf(title, (size_t)title_size, "ADD FRIEND");
		text_add(text, text_size, "Type a player's code (XXXX-XXXX,\nthe dash can be left out): they\nbecome your "
			"friend once they\naccept.\n\nYours is %s.", social_account_code());
		break;
	case _row_moderation:
		snprintf(title, (size_t)title_size, "BLOCKED & MUTED");
		text_add(text, text_size, "The players you muted (their lines\nhidden) and blocked (neither of you\nhears the "
			"other, no requests).");
		break;
	case _row_friend:
	case _row_incoming:
	case _row_outgoing:
	case _row_moderated:
		{
			struct social_menu_person const *person =
				entry->kind == _row_friend ? &social_menu.friends[entry->value] :
				entry->kind == _row_incoming ? &social_menu.incoming[entry->value] :
				entry->kind == _row_outgoing ? &social_menu.outgoing[entry->value] :
				&social_menu.moderated[entry->value];
			char ago[SOCIAL_MENU_TIME_SIZE];

			snprintf(title, (size_t)title_size, "%s", person->name);
			text_add(text, text_size, "Code: %s\n", person->code);
			if (entry->kind == _row_friend)
				presence_line(&person->presence, text, text_size);
			ago_text(person->at, ago, sizeof(ago));
			if (entry->kind == _row_incoming)
				text_add(text, text_size, "Asked to be your friend %s.\n", ago);
			else if (entry->kind == _row_outgoing)
				text_add(text, text_size, "You asked %s.\n", ago);
			text_add(text, text_size, "\nA: their page.");
		}
		break;
	case _row_activity_entry:
		snprintf(title, (size_t)title_size, "%s", social_menu.activity[entry->value].player);
		match_details(&social_menu.activity[entry->value], text, text_size);
		text_add(text, text_size, "\nA: their page.");
		break;
	case _row_recent_player:
		utf8_from_wide(social_menu.recent_names[entry->value], title, title_size);
		text_add(text, text_size, "Code: %s\n\nA: their page.", social_menu.recent_codes[entry->value]);
		break;
	case _row_matches:
		player_head(title, title_size, text, text_size);
		if (player->had && !player->match_count &&
			strcmp(player->relation, "self"))
		{
			text_add(text, text_size, "\nTheir matches are not shown\n(their activity is hidden), or they\nhave "
				"none yet.");
		}
		break;
	case _row_join:
		player_head(title, title_size, text, text_size);
		text_add(text, text_size, "\nJoins their game: it shows in\nDirect Link, where A joins it.");
		break;
	case _row_message:
		player_head(title, title_size, text, text_size);
		text_add(text, text_size, "\nOpens the chat to write to them\nalone.");
		break;
	case _row_friend_add:
		player_head(title, title_size, text, text_size);
		text_add(text, text_size, player->requests ? "\nAsks them to be your friend." :
			"\nThey take no friend requests.");
		break;
	case _row_friend_accept:
	case _row_friend_decline:
	case _row_friend_cancel:
	case _row_friend_remove:
		player_head(title, title_size, text, text_size);
		break;
	case _row_mute:
	case _row_unmute:
		player_head(title, title_size, text, text_size);
		text_add(text, text_size, "\nA muted player's lines are hidden\nfrom you, in the fork's chat and\n(by their "
			"name) the game's.");
		break;
	case _row_block:
	case _row_unblock:
		player_head(title, title_size, text, text_size);
		text_add(text, text_size, "\nBlocked, neither of you hears the\nother, no private lines or friend\nrequests "
			"either way; no longer\nfriends.");
		break;
	case _row_report:
		player_head(title, title_size, text, text_size);
		text_add(text, text_size, "\nReports them, and mutes them.\nPlayers reported by many are\nhidden from "
			"everyone's chat.");
		break;
	case _row_match:
		snprintf(title, (size_t)title_size, "%s", player->name);
		match_details(&player->matches[entry->value], text, text_size);
		break;
	case _row_reason:
		snprintf(title, (size_t)title_size, "REPORT %s", player->name);
		text_add(text, text_size, "Why: %s.\n\nPress A twice to report them.\nThey are muted for you too.",
			social_menu_reasons[entry->value]);
		break;
	}
}

/* ---------- choosing */

/* an action that wants A twice: TRUE the second time */
static boolean confirmed(
	short kind,
	char const *what)
{
	if (social_menu.confirming_kind == kind &&
		system_milliseconds() - social_menu.confirming_time <= SOCIAL_MENU_CONFIRM_MILLISECONDS)
	{
		social_menu.confirming_kind = NONE;
		return TRUE;
	}
	social_menu.confirming_kind = kind;
	social_menu.confirming_time = system_milliseconds();
	message_set("Press A again to %s.", what);
	return FALSE;
}

static void moderate(
	short kind,
	char const *action,
	char const *reason)
{
	act(kind, "/moderation", social_menu.player.code, social_menu.player.name, action, reason);
}

short social_menu_choose(
	short row)
{
	struct social_menu_row const *entry = row_get(row);
	struct social_menu_player *player = &social_menu.player;
	char what[SOCIAL_MENU_NAME_SIZE + 32];

	if (!entry)
		return _social_menu_stays;
	if (entry->kind != social_menu.confirming_kind)
		social_menu.confirming_kind = NONE;
	switch (entry->kind)
	{
	case _row_you:
		player_open(social_account_code(), NULL);
		break;
	case _row_friends:
		list_open(_list_friends);
		break;
	case _row_requests:
		list_open(_list_requests);
		break;
	case _row_activity:
		list_open(_list_activity);
		break;
	case _row_recent:
		list_open(_list_recent);
		break;
	case _row_moderation:
		list_open(_list_moderation);
		break;
	case _row_add_friend:
		if (!social_menu_online())
		{
			message_set("The community server is not reached.");
			break;
		}
		keyboard_open();
		return social_menu.typing != _typing_none ? _social_menu_typing : _social_menu_stays;
	case _row_friend:
		player_open(social_menu.friends[entry->value].code, social_menu.friends[entry->value].name);
		break;
	case _row_incoming:
		player_open(social_menu.incoming[entry->value].code, social_menu.incoming[entry->value].name);
		break;
	case _row_outgoing:
		player_open(social_menu.outgoing[entry->value].code, social_menu.outgoing[entry->value].name);
		break;
	case _row_moderated:
		player_open(social_menu.moderated[entry->value].code, social_menu.moderated[entry->value].name);
		break;
	case _row_activity_entry:
		player_open(social_menu.activity[entry->value].code, social_menu.activity[entry->value].player);
		break;
	case _row_recent_player:
		{
			char name[SOCIAL_MENU_NAME_SIZE];

			utf8_from_wide(social_menu.recent_names[entry->value], name, sizeof(name));
			player_open(social_menu.recent_codes[entry->value], name);
		}
		break;
	case _row_matches:
		list_open(_list_matches);
		break;
	case _row_join:
		snprintf(social_menu.join_invite, sizeof(social_menu.join_invite), "%s", player->presence.invite);
		if (social_menu.join_invite[0])
			return _social_menu_join;
		break;
	case _row_message:
		{
			wchar_t name[32];

			wide_from_utf8(player->name, name, NUMBEROF(name));
			social_chat_open_private(player->code, name);
		}
		break;
	case _row_friend_add:
		act(entry->kind, "/friends", player->code, player->name, NULL, NULL);
		break;
	case _row_friend_accept:
		act(entry->kind, "/friends/accept", player->code, player->name, NULL, NULL);
		break;
	case _row_friend_decline:
		act(entry->kind, "/friends/remove", player->code, player->name, NULL, NULL);
		break;
	case _row_friend_cancel:
		act(entry->kind, "/friends/remove", player->code, player->name, NULL, NULL);
		break;
	case _row_friend_remove:
		snprintf(what, sizeof(what), "remove %s from your friends", player->name);
		if (confirmed(entry->kind, what))
			act(entry->kind, "/friends/remove", player->code, player->name, NULL, NULL);
		break;
	case _row_mute:
		moderate(entry->kind, "mute", NULL);
		break;
	case _row_unmute:
		moderate(entry->kind, "unmute", NULL);
		break;
	case _row_block:
		snprintf(what, sizeof(what), "block %s", player->name);
		if (confirmed(entry->kind, what))
			moderate(entry->kind, "block", NULL);
		break;
	case _row_unblock:
		moderate(entry->kind, "unblock", NULL);
		break;
	case _row_report:
		list_open(_list_report);
		break;
	case _row_reason:
		snprintf(what, sizeof(what), "report %s (%s)", player->name, social_menu_reasons[entry->value]);
		if (confirmed(entry->kind, what))
			moderate(_row_reason, "report", social_menu_reason_keys[entry->value]);
		break;
	}
	return _social_menu_stays;
}

boolean social_menu_back(
	void)
{
	social_menu.confirming_kind = NONE;
	if (!social_menu.depth)
		return FALSE;
	social_menu.depth--;
	social_menu.list = social_menu.stack[social_menu.depth].list;
	social_menu.first = social_menu.stack[social_menu.depth].first;
	social_menu.chosen = social_menu.stack[social_menu.depth].chosen;
	social_menu.list_serial++;
	return TRUE;
}

char const *social_menu_join_invite(
	void)
{
	return social_menu.join_invite;
}

void social_menu_join_failed(
	void)
{
	message_set("That game could not be joined: internet play\n(network.online) is off, or the invite is old.");
}

/* ---------- the chat's (a player's name clicked: social_chat.c) */

void social_menu_player_act(
	char const *code,
	char const *name,
	short action)
{
	static char const *const actions[] = { NULL, "mute", "unmute", "report" };
	static short const kinds[] = { _row_friend_add, _row_mute, _row_unmute, _row_reason };

	if (action < 0 || action >= (short)NUMBEROF(kinds))
		return;
	act_as(kinds[action], action == _social_menu_act_friend ? "/friends" : "/moderation", code, name,
		actions[action], action == _social_menu_act_report ? "chat" : NULL, TRUE);
	/* (not asked: why, in the chat) */
	if (!social_menu.action_ticket)
	{
		social_chat_notice_text(social_menu.message);
		social_menu.action_from_chat = FALSE;
	}
}

void social_menu_profile_ask(
	char const *code,
	char const *name)
{
	struct social_menu_player *player = &social_menu.player;

	if (strcmp(player->code, code))
	{
		csmemset(player, 0, sizeof(*player));
		snprintf(player->code, sizeof(player->code), "%s", code);
		snprintf(player->name, sizeof(player->name), "%s", name && name[0] ? name : code);
	}
	social_menu.player_failed = FALSE;
	social_menu.player_wanted = TRUE;
}

short social_menu_profile_text(
	char const *code,
	char *text,
	long size)
{
	struct social_menu_player const *player = &social_menu.player;
	char line[32];

	text[0] = 0;
	if (strcmp(player->code, code))
		return 0;
	if (!player->had)
	{
		if (!social_menu.player_failed)
			return 0;
		text_add(text, size, "%s", social_menu.message[0] ? social_menu.message : "The server did not answer.");
		return -1;
	}
	if (!strcmp(player->relation, "friends"))
		text_add(text, size, "Your friend.\n");
	else if (!strcmp(player->relation, "incoming"))
		text_add(text, size, "Wants to be your friend.\n");
	else if (!strcmp(player->relation, "outgoing"))
		text_add(text, size, "You asked to be friends.\n");
	if (strcmp(player->relation, "self"))
		presence_line(&player->presence, text, size);
	kda_text(player->multiplayer.kills, player->multiplayer.deaths, player->multiplayer.assists, line, sizeof(line));
	text_add(text, size, "Multiplayer: %ld matches, %ld won.\nKills %ld, deaths %ld, KDA %s.\n",
		player->multiplayer.matches, player->multiplayer.wins, player->multiplayer.kills,
		player->multiplayer.deaths, line);
	text_add(text, size, "Campaign: %ld levels won.\nMedals: %ld.\n", player->campaign.matches,
		player->multiplayer.medals + player->campaign.medals);
	if (player->muted || player->blocked)
		text_add(text, size, "%s.\n", player->blocked ? "Blocked" : "Muted");
	return 1;
}

boolean social_menu_is_friend(
	char const *code)
{
	short index;

	for (index = 0; index < social_menu.friend_count; index++)
	{
		if (!strcmp(social_menu.friends[index].code, code))
			return TRUE;
	}
	return FALSE;
}

boolean social_menu_is_muted(
	char const *code)
{
	short index;

	for (index = 0; index < social_menu.moderated_count; index++)
	{
		if (!strcmp(social_menu.moderated[index].code, code))
			return social_menu.moderated[index].muted;
	}
	return FALSE;
}
