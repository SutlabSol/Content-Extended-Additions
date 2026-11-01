/*
SOCIAL.C

This fork's social side (social.h): the install's account on the community
server (api-opence's database/halo_social.js), and the records of its
players' matches and levels.

- The account is the install's, whatever its players' names: its requests
  carry community.key alone (community_net_send with no profile's part). No
  one registers: the first request (POST /account, as the game starts and
  again when player 1's profile's name changes) makes it, and the server
  answers with its public code (XXXX-XXXX), which others know it by.
- A multiplayer game over (its scores shown: game_engine_showing_postgame),
  each of this machine's players' match is recorded: kills, deaths, assists,
  suicides, betrayals, the score and place the HUD has, won or lost, the map
  and the gametype, the time, and each medal's count (campaign_score.c's log,
  kept with game.multiplayer_medals). A campaign level won is recorded as
  campaign_score.c sends it to the leaderboards (social_level_won). Each goes
  as POST /account/matches with a random matchId, so one sent twice (its
  answer lost) is counted once; one that could not be sent is tried again a
  while after, as long as the game runs.
- A multiplayer game left before its scores (quit, its host gone, the
  network lost) is recorded too, as not completed (completed false, no
  result) with why it ended (endReason quit, ended or disconnected), from
  what its players had the last second they played: the server counts its
  kills and medals, a quit as a quit, and never a win or a loss. One left
  before SOCIAL_MATCH_COUNTED_SECONDS with no kill or death is not. While
  it is played, what it would be recorded as is kept every
  SOCIAL_MATCH_SAVE_MILLISECONDS in SOCIAL_MATCH_FILE (the data folder's),
  as disconnected: a game that stopped with it (a crash, the system's)
  sends it as it next starts.
- social.enabled (with community.enabled) turns it all on; social.record_matches
  the records.
- The account's social settings (social.friends, social.friend_requests,
  social.show_activity, social.instant_join, social.private_chat) go with
  its POST /account, again whenever Settings changes one: the server keeps
  them, and others see this account as they say.
- What the game is doing (the menus, the campaign, a multiplayer game, the
  Theater: its map, gametype, game and players, and the invite of the
  internet game it hosts with social.instant_join on) goes as POST /presence
  every SOCIAL_PRESENCE_MILLISECONDS, and as soon as it changes; its answer
  says how many friends are online and how many requests wait.

The fork's chat is social_chat.c's, over the same account; the friend list,
the players and their records social_menu.c's.
*/

#include "cseries.h"
#include "game/game.h"
#include "game/game_engine.h"
#include "game/players.h"
#include "interface/player_ui.h"
#include "interface/ui_widget.h"
#include "memory/data.h"
#include "networking/network_game_globals.h"
#include "networking/network_game_manager.h"
#include "saved games/player_profile.h"
#include "scenario/scenario.h"
#include "tag_files/tag_files.h"

#include "campaign_medals.h"
#include "campaign_score.h"
#include "community.h"
#include "network_replay.h"
#include "social.h"
#include "social_chat.h"
#include "social_menu.h"
#include "../src/community_net.h"
#include "../src/port_config.h"
#include "../src/posix.h"
#include "../src/server_json.h"

#include <stdio.h>
#include <string.h>

void platform_log(char const *format, ...);
const char *platform_data_root(void);
/* (a host path, under the data folder: network_replay.c's) */
FILE *platform_fopen_host(char const *path, char const *mode);
int platform_remove_host(char const *path);
unsigned long system_milliseconds(void);
unsigned long config_changes(void);
int p2p_invite_link(char *link, int size);

/* ---------- constants */

enum
{
	/* the records not sent yet kept at once (the oldest gives way), and
	how big each one's body may be */
	SOCIAL_PENDING_RECORDS = 16,
	SOCIAL_RECORD_SIZE = 2048,
	/* how often an account not answered is asked for again, and a record
	not sent sent again; how many times a record is tried */
	SOCIAL_RETRY_MILLISECONDS = 60000,
	SOCIAL_RECORD_ATTEMPTS = 5,
	SOCIAL_CODE_SIZE = 16,
	SOCIAL_NAME_SIZE = 40,
	SOCIAL_ANSWER_SIZE = 8192,
	/* what the game is doing, said again this often (the server counts an
	account online two minutes after it was last heard from) */
	SOCIAL_PRESENCE_MILLISECONDS = 45000,
	/* ... and this soon after it changed, at the soonest */
	SOCIAL_PRESENCE_CHANGE_MILLISECONDS = 3000,
	SOCIAL_PRESENCE_SIZE = 512,
	SOCIAL_INVITE_SIZE = 160,
	/* a match left before its end: what its players had, taken this often
	while it is played, kept in its file this often; one left this soon,
	with no kill or death, is not recorded */
	SOCIAL_MATCH_TAKE_MILLISECONDS = 1000,
	SOCIAL_MATCH_SAVE_MILLISECONDS = 30000,
	SOCIAL_MATCH_COUNTED_SECONDS = 60,
};

/* (the data folder's) a match being played, as it would be recorded if the
game stopped with it */
#define SOCIAL_MATCH_FILE "social_match.txt"

/* why a match left before its end ended (endReason): a player of this
machine quit (counted as a quit), the host ended it, the network was lost */
enum
{
	_social_match_end_ended,
	_social_match_end_disconnected,
	_social_match_end_quit,
};

/* ---------- structures */

/* a record to send: its body, its request while it is asked, and when it is
tried again */
struct social_record
{
	boolean used;
	int ticket;
	short attempts;
	unsigned long retry_at;
	char body[SOCIAL_RECORD_SIZE];
};

/* a player of this machine in the match being played, as it was last taken
(social_match_take): its record's id (the same in the file and at its end),
its name and gametype, and its figures and medals */
struct social_match_player
{
	boolean used;
	short local_player_index;
	char match_id[32];
	char name[SOCIAL_NAME_SIZE];
	char gametype[96];
	char const *result;
	long score;
	long place;
	long kills;
	long deaths;
	long assists;
	long suicides;
	long betrayals;
	long medals[NUMBER_OF_CAMPAIGN_MEDALS];
};

/* ---------- globals */

static struct
{
	/* the account: its request while asked, when it is asked again, the
	name it was last given, and its code once known */
	int hello_ticket;
	boolean hello_due;
	unsigned long hello_at;
	char hello_name[SOCIAL_NAME_SIZE];
	char code[SOCIAL_CODE_SIZE];
	/* the settings the server was last given (social_settings_text), and
	when Settings last changed */
	char hello_settings[64];
	unsigned long settings_read_at;
	/* what the game is doing: its request while asked, what was last said
	and when, and the counts the server answered */
	int presence_ticket;
	unsigned long presence_at;
	char presence_said[SOCIAL_PRESENCE_SIZE];
	long friends_online;
	long requests_waiting;
	/* a multiplayer game being played (one a replay plays is not), and
	whether its end was recorded; when it started */
	boolean match_running;
	boolean match_recorded;
	unsigned long match_started;
	/* ... why it would end if left now (a quit latched, as one of this
	machine's players quit it: social_match_quit), when its players were
	last taken and kept in its file, what it is (taken with them), and its
	players; whether the file of a game that stopped was looked for */
	boolean match_quit;
	short match_end;
	unsigned long match_taken_at;
	unsigned long match_saved_at;
	boolean match_teams;
	long match_player_count;
	char match_map[64];
	char match_network[8];
	struct social_match_player match_players[MAXIMUM_NUMBER_OF_LOCAL_PLAYERS];
	boolean match_file_looked;
	struct social_record records[SOCIAL_PENDING_RECORDS];
	char answer[SOCIAL_ANSWER_SIZE];
} social = { 0, TRUE, 0, "", "", "", (unsigned long)-1 };

/* ---------- the account */

boolean social_enabled(
	void)
{
	return community_net_enabled() && config_boolean("social.enabled");
}

char const *social_account_code(
	void)
{
	return social.code;
}

int social_send(
	char const *path,
	char const *body)
{
	return social_enabled() ? community_net_send(path, body, NULL) : 0;
}

/* the game's text as UTF-8 (the basic plane), at most size - 1 bytes */
static void social_utf8_from_wide(
	wchar_t const *wide,
	long count,
	char *text,
	long size)
{
	long length = 0;
	long index;

	for (index = 0; index < count && wide[index] && length < size - 1; index++)
	{
		unsigned long character = (unsigned short)wide[index];

		if (character < 0x80)
		{
			if (character >= ' ')
				text[length++] = (char)character;
		}
		else if (character < 0x800)
		{
			if (length + 2 > size - 1)
				break;
			text[length++] = (char)(0xC0 | (character >> 6));
			text[length++] = (char)(0x80 | (character & 0x3F));
		}
		else
		{
			if (length + 3 > size - 1)
				break;
			text[length++] = (char)(0xE0 | (character >> 12));
			text[length++] = (char)(0x80 | ((character >> 6) & 0x3F));
			text[length++] = (char)(0x80 | (character & 0x3F));
		}
	}
	text[length] = 0;
}

void social_player_name(
	char *name,
	long size)
{
	/* (as the main menu's current_profile_name: the active profile as the
	menus hold it, else the one used last, read from its file at most once
	a second) */
	static struct player_profile profile;
	static long read_index = NONE;
	static unsigned long read_time;
	static boolean read_good;
	long profile_index = player_ui_get_active_player_profile_index(0);

	name[0] = 0;
	if (profile_index != NONE)
	{
		player_ui_get_active_player_profile(0, &profile);
		read_index = NONE;
		read_good = TRUE;
	}
	else if ((profile_index = player_ui_get_player1_last_used_profile_index()) == NONE)
	{
		return;
	}
	else if (profile_index != read_index || system_milliseconds() - read_time > 1000)
	{
		read_index = profile_index;
		read_good = player_profile_get(profile_index, &profile);
		read_time = system_milliseconds();
	}
	if (read_good)
		social_utf8_from_wide(profile.player_name, NUMBEROF(profile.player_name), name, size);
}

/* the social settings as the server keeps them (each "1" or "0", in
SOCIAL_SETTING_FIELDS' order: what changed, the account says again) */
static char const *const social_setting_fields[][2] = {
	{ "friends", "social.friends" },
	{ "requests", "social.friend_requests" },
	{ "activity", "social.show_activity" },
	{ "join", "social.instant_join" },
	{ "privateChat", "social.private_chat" },
};

static void social_settings_text(
	char *text,
	long size)
{
	long index;

	text[0] = 0;
	for (index = 0; index < (long)NUMBEROF(social_setting_fields) && index < size - 1; index++)
		text[index] = config_boolean(social_setting_fields[index][1]) ? '1' : '0';
	text[MIN(index, size - 1)] = 0;
}

void social_presence_counts(
	long *friends_online,
	long *requests_waiting)
{
	*friends_online = social.friends_online;
	*requests_waiting = social.requests_waiting;
}

/* the answer's data's text at a path of members ("account.code"), "" for none */
static void social_answer_text(
	char const *answer,
	char const *path,
	char *text,
	int size)
{
	struct server_json_document document;
	int token;

	text[0] = 0;
	if (!server_json_parse(&document, answer, (int)strlen(answer), 16))
		return;
	token = server_json_member(&document, 0, "data");
	while (token >= 0 && *path)
	{
		char member[32];
		size_t length = strcspn(path, ".");

		if (length >= sizeof(member))
		{
			token = -1;
			break;
		}
		memcpy(member, path, length);
		member[length] = 0;
		token = server_json_member(&document, token, member);
		path += length;
		if (*path == '.')
			path++;
	}
	if (token >= 0 && !server_json_get_string(&document, token, text, size))
		text[0] = 0;
	server_json_document_free(&document);
}

static void social_hello_update(
	unsigned long now)
{
	char name[SOCIAL_NAME_SIZE];

	if (social.hello_ticket)
	{
		int status = 0;
		int result = community_net_poll(social.hello_ticket, &status, social.answer, sizeof(social.answer));

		if (result == _community_net_waiting)
			return;
		social.hello_ticket = 0;
		if (result == _community_net_answered && status == 200)
		{
			char code[SOCIAL_CODE_SIZE];

			social_answer_text(social.answer, "account.code", code, sizeof(code));
			if (code[0])
			{
				if (strcmp(code, social.code))
					platform_log("social: the account is %s", code);
				csstrncpy(social.code, code, sizeof(social.code) - 1);
				return;
			}
		}
		platform_log("social: the account was not had (%d)", status);
		social.hello_due = TRUE;
		social.hello_at = now + SOCIAL_RETRY_MILLISECONDS;
		return;
	}
	/* (asked as the game starts, again when player 1's name or the social
	settings change, and again a while after the server was not reached) */
	social_player_name(name, sizeof(name));
	if (strcmp(name, social.hello_name))
	{
		csstrncpy(social.hello_name, name, sizeof(social.hello_name) - 1);
		social.hello_due = TRUE;
	}
	if (social.settings_read_at != config_changes())
	{
		char settings[sizeof(social.hello_settings)];

		social.settings_read_at = config_changes();
		social_settings_text(settings, sizeof(settings));
		if (strcmp(settings, social.hello_settings))
		{
			csstrncpy(social.hello_settings, settings, sizeof(social.hello_settings) - 1);
			social.hello_due = TRUE;
			/* (the invite given, or no longer) */
			social.presence_said[0] = 0;
		}
	}
	if (social.hello_due && (!social.hello_at || (long)(now - social.hello_at) >= 0))
	{
		struct server_json json;

		server_json_begin(&json);
		server_json_object_begin(&json, NULL);
		if (name[0])
			server_json_string(&json, "name", name);
		server_json_string(&json, "platform", community_net_platform());
		server_json_integer(&json, "build", community_build_number());
		server_json_object_begin(&json, "settings");
		{
			short index;

			for (index = 0; index < (short)NUMBEROF(social_setting_fields); index++)
			{
				server_json_boolean(&json, social_setting_fields[index][0],
					social.hello_settings[index] == '1');
			}
		}
		server_json_object_end(&json);
		server_json_object_end(&json);
		social.hello_ticket = social_send("/account", server_json_text(&json));
		server_json_free(&json);
		social.hello_due = FALSE;
		/* (not sent: none of the requests' slots free, say) */
		if (!social.hello_ticket)
		{
			social.hello_due = TRUE;
			social.hello_at = now + SOCIAL_RETRY_MILLISECONDS;
		}
	}
}

/* ---------- the records */

/* a record's body kept, to be sent (the oldest not being asked gives way) */
static void social_record_add(
	char const *body)
{
	struct social_record *record = NULL;
	short index;

	if ((long)strlen(body) >= SOCIAL_RECORD_SIZE)
	{
		platform_log("social: a record too long was not sent");
		return;
	}
	for (index = 0; index < SOCIAL_PENDING_RECORDS && !record; index++)
	{
		if (!social.records[index].used)
			record = &social.records[index];
	}
	for (index = 0; index < SOCIAL_PENDING_RECORDS && !record; index++)
	{
		if (!social.records[index].ticket)
			record = &social.records[index];
	}
	if (!record)
	{
		platform_log("social: too many records waiting; one was not sent");
		return;
	}
	csmemset(record, 0, sizeof(*record));
	record->used = TRUE;
	csstrncpy(record->body, body, SOCIAL_RECORD_SIZE - 1);
}

static void social_records_update(
	unsigned long now)
{
	short index;

	for (index = 0; index < SOCIAL_PENDING_RECORDS; index++)
	{
		struct social_record *record = &social.records[index];

		if (!record->used)
			continue;
		if (record->ticket)
		{
			int status = 0;
			int result = community_net_poll(record->ticket, &status, social.answer, sizeof(social.answer));

			if (result == _community_net_waiting)
				continue;
			record->ticket = 0;
			/* (taken, or refused as it is: sending it again would not help) */
			if (result == _community_net_answered && status != 429 && status < 500)
			{
				if (status != 200)
					platform_log("social: a record was refused (%d): %s", status, social.answer);
				record->used = FALSE;
				continue;
			}
			if (record->attempts >= SOCIAL_RECORD_ATTEMPTS)
			{
				platform_log("social: a record was not sent after %d attempts", (int)record->attempts);
				record->used = FALSE;
				continue;
			}
			record->retry_at = now + SOCIAL_RETRY_MILLISECONDS;
			continue;
		}
		if (record->retry_at && (long)(now - record->retry_at) < 0)
			continue;
		record->ticket = social_send("/account/matches", record->body);
		record->attempts++;
		if (!record->ticket)
			record->retry_at = now + SOCIAL_RETRY_MILLISECONDS;
	}
}

static boolean social_recording(
	void)
{
	return social_enabled() && config_boolean("social.record_matches");
}

/* a record's id: random, the same whenever it is sent again */
static void social_match_id(
	char *text,
	long size)
{
	unsigned char bytes[12];
	long index;

	posix_random_bytes(bytes, sizeof(bytes));
	text[0] = 0;
	for (index = 0; index < (long)sizeof(bytes) && index * 2 + 2 < size; index++)
		snprintf(text + index * 2, 3, "%02x", bytes[index]);
}

/* the map's name: its tag's last part (levels\test\bloodgulch\bloodgulch: bloodgulch) */
static void social_map_name(
	char *text,
	long size)
{
	char const *name = global_scenario_index != NONE ? tag_get_name(global_scenario_index) : NULL;
	char const *last;

	text[0] = 0;
	if (!name)
		return;
	last = strrchr(name, '\\');
	snprintf(text, (size_t)size, "%s", last ? last + 1 : name);
}

/* the medals' counts (campaign_score.c's, NUMBER_OF_CAMPAIGN_MEDALS of
them), as an object of their keys (those won alone) */
static void social_medals_write(
	struct server_json *json,
	long const *counts)
{
	short medal;

	server_json_object_begin(json, "medals");
	for (medal = 0; medal < NUMBER_OF_CAMPAIGN_MEDALS; medal++)
	{
		if (counts[medal] > 0)
			server_json_integer(json, campaign_medal_descriptions[medal].key, counts[medal]);
	}
	server_json_object_end(json);
}

static void social_medal_counts(
	short player_index,
	long *counts)
{
	short medal;

	for (medal = 0; medal < NUMBER_OF_CAMPAIGN_MEDALS; medal++)
		counts[medal] = campaign_score_medal_count(player_index, medal);
}

/* the game's network side as a record says it */
static char const *social_network_name(
	void)
{
	short connection = game_connection();

	return connection == _game_connection_network_server ? "host" :
		connection == _game_connection_network_client ? "client" : "local";
}

/* a record begun: its id (match_id, a new one for NULL) and the network
side it was played on (network, the game's now for NULL) */
static void social_record_begin(
	struct server_json *json,
	char const *kind,
	char const *name,
	char const *match_id,
	char const *network)
{
	char new_id[32];

	if (!match_id)
	{
		social_match_id(new_id, sizeof(new_id));
		match_id = new_id;
	}
	server_json_begin(json);
	server_json_object_begin(json, NULL);
	server_json_string(json, "matchId", match_id);
	server_json_string(json, "kind", kind);
	if (name && name[0])
		server_json_string(json, "name", name);
	server_json_string(json, "network", network ? network : social_network_name());
	server_json_string(json, "platform", community_net_platform());
	server_json_integer(json, "build", community_build_number());
}

static void social_record_end(
	struct server_json *json)
{
	server_json_object_end(json);
	if (!json->failed)
		social_record_add(server_json_text(json));
	server_json_free(json);
}

/* the leading number of a score as the HUD writes it ("25", "-3"), 0 for none */
static long social_score_number(
	wchar_t const *text)
{
	long value = 0;
	boolean negative = FALSE;

	while (*text == ' ')
		text++;
	if (*text == '-')
	{
		negative = TRUE;
		text++;
	}
	while (*text >= '0' && *text <= '9' && value < 100000000L)
		value = value * 10 + (*text++ - '0');
	return negative ? -value : value;
}

/* the game's players: the network game's, or this machine's */
static long social_player_count(
	void)
{
	struct network_game *game = network_game_get_game();
	long count = 0;
	short local_player_index;

	if (game && game_connection() != _game_connection_local)
		return MAX(game->player_count, 1);
	for (local_player_index = local_player_get_next(NONE); local_player_index != NONE;
		local_player_index = local_player_get_next(local_player_index))
	{
		count++;
	}
	return MAX(count, 1);
}

/* a match left before its end recorded only once it was played a while,
or someone was killed in it */
static boolean social_match_counts(
	struct social_match_player const *player,
	long seconds)
{
	return seconds >= SOCIAL_MATCH_COUNTED_SECONDS || player->kills || player->deaths;
}

static char const *social_match_end_name(
	short end)
{
	return end == _social_match_end_quit ? "quit" :
		end == _social_match_end_disconnected ? "disconnected" : "ended";
}

/* a player's match as its record's body (completed, or left before its end
as end says); FALSE if it does not fit */
static boolean social_match_body(
	struct social_match_player const *player,
	long seconds,
	boolean completed,
	short end,
	char *body,
	long size)
{
	struct server_json json;
	boolean written;

	social_record_begin(&json, "multiplayer", player->name, player->match_id, social.match_network);
	if (completed && player->result)
		server_json_string(&json, "result", player->result);
	server_json_boolean(&json, "completed", completed);
	if (!completed)
		server_json_string(&json, "endReason", social_match_end_name(end));
	server_json_integer(&json, "score", player->score);
	server_json_integer(&json, "place", player->place);
	server_json_integer(&json, "kills", player->kills);
	server_json_integer(&json, "deaths", player->deaths);
	server_json_integer(&json, "assists", player->assists);
	server_json_integer(&json, "suicides", player->suicides);
	server_json_integer(&json, "betrayals", player->betrayals);
	server_json_integer(&json, "seconds", seconds);
	server_json_integer(&json, "players", social.match_player_count);
	server_json_boolean(&json, "teams", social.match_teams);
	server_json_string(&json, "map", social.match_map);
	server_json_string(&json, "gametype", player->gametype);
	social_medals_write(&json, player->medals);
	server_json_object_end(&json);
	written = !json.failed && csstrlen(server_json_text(&json)) < size;
	if (written)
		csstrncpy(body, server_json_text(&json), size - 1);
	server_json_free(&json);
	return written;
}

/* a player's match left before its end, recorded */
static void social_match_send(
	struct social_match_player const *player,
	long seconds,
	short end)
{
	char body[SOCIAL_RECORD_SIZE];

	csmemset(body, 0, sizeof(body));
	if (!social_match_body(player, seconds, FALSE, end, body, sizeof(body)))
		return;
	social_record_add(body);
	platform_log("social: a match of %s recorded, left before its end (%s)", player->name,
		social_match_end_name(end));
}

/* ---------- the file of the match being played */

static void social_match_file_path(
	char *path,
	long size)
{
	snprintf(path, (size_t)size, "%s/%s", platform_data_root(), SOCIAL_MATCH_FILE);
}

/* what the match would be recorded as if the game stopped now (as
disconnected), kept: one record's body a line */
static void social_match_save(
	void)
{
	long seconds = (long)((system_milliseconds() - social.match_started) / 1000);
	char path[512];
	char body[SOCIAL_RECORD_SIZE];
	FILE *file = NULL;
	short slot;

	social_match_file_path(path, sizeof(path));
	for (slot = 0; slot < MAXIMUM_NUMBER_OF_LOCAL_PLAYERS; slot++)
	{
		struct social_match_player const *player = &social.match_players[slot];

		csmemset(body, 0, sizeof(body));
		if (!player->used || !social_match_counts(player, seconds) ||
			!social_match_body(player, seconds, FALSE, _social_match_end_disconnected, body, sizeof(body)))
		{
			continue;
		}
		if (!file && !(file = platform_fopen_host(path, "wb")))
			return;
		fprintf(file, "%s\n", body);
	}
	if (file)
		fclose(file);
}

static void social_match_forget(
	void)
{
	char path[512];

	social_match_file_path(path, sizeof(path));
	platform_remove_host(path);
}

/* (as the game starts) the match of a game that stopped as it was played:
its records sent (its server takes each once, by its id), its file gone */
static void social_match_file_look(
	void)
{
	char path[512];
	char line[SOCIAL_RECORD_SIZE];
	FILE *file;

	social.match_file_looked = TRUE;
	social_match_file_path(path, sizeof(path));
	if (!(file = platform_fopen_host(path, "rb")))
		return;
	while (fgets(line, sizeof(line), file))
	{
		long length = csstrlen(line);

		while (length > 0 && (line[length - 1] == '\n' || line[length - 1] == '\r'))
			line[--length] = 0;
		if (length > 0 && line[0] == '{' && social_recording())
		{
			social_record_add(line);
			platform_log("social: a match left as the game stopped recorded");
		}
	}
	fclose(file);
	platform_remove_host(path);
}

/* ---------- the match being played */

/* each of this machine's players in the match: what it has now. A player
gone from it, as one of this machine's players quit (a split screen
player's, the others staying), is recorded at once, as a quit */
static void social_match_take(
	void)
{
	unsigned long seconds = (system_milliseconds() - social.match_started) / 1000;
	short local_player_index;
	short slot;
	boolean taken[MAXIMUM_NUMBER_OF_LOCAL_PLAYERS];

	csmemset(taken, 0, sizeof(taken));
	social.match_teams = game_engine_has_teams();
	social.match_player_count = social_player_count();
	social_map_name(social.match_map, sizeof(social.match_map));
	snprintf(social.match_network, sizeof(social.match_network), "%s", social_network_name());
	for (local_player_index = local_player_get_next(NONE); local_player_index != NONE;
		local_player_index = local_player_get_next(local_player_index))
	{
		long player_index = local_player_get_player_index(local_player_index);
		struct player_datum *player = player_index != NONE ? player_try_and_get(player_index) : NULL;
		struct social_match_player *taking = NULL;
		struct game_engine_hud_score hud_score;

		if (!player)
			continue;
		csmemset(&hud_score, 0, sizeof(hud_score));
		if (!game_engine_hud_score_get(player_index, &hud_score))
			continue;
		for (slot = 0; slot < MAXIMUM_NUMBER_OF_LOCAL_PLAYERS && !taking; slot++)
		{
			if (social.match_players[slot].used && social.match_players[slot].local_player_index == local_player_index)
				taking = &social.match_players[slot];
		}
		for (slot = 0; slot < MAXIMUM_NUMBER_OF_LOCAL_PLAYERS && !taking; slot++)
		{
			if (!social.match_players[slot].used)
			{
				taking = &social.match_players[slot];
				csmemset(taking, 0, sizeof(*taking));
				taking->used = TRUE;
				taking->local_player_index = local_player_index;
				social_match_id(taking->match_id, sizeof(taking->match_id));
			}
		}
		if (!taking)
			continue;
		taken[taking - social.match_players] = TRUE;
		taking->result = NULL;
		if (social.match_teams)
		{
			taking->result = hud_score.team_standing == _game_engine_hud_winning ? "win" :
				hud_score.team_standing == _game_engine_hud_losing ? "loss" :
				hud_score.team_standing == _game_engine_hud_tied ? "tie" : NULL;
		}
		else if (hud_score.place > 0)
		{
			taking->result = hud_score.place == 1 ? (hud_score.place_tied ? "tie" : "win") : "loss";
		}
		social_utf8_from_wide(player->name, NUMBEROF(player->name), taking->name, sizeof(taking->name));
		social_utf8_from_wide(hud_score.kind, NUMBEROF(hud_score.kind), taking->gametype, sizeof(taking->gametype));
		taking->score = social_score_number(hud_score.score);
		taking->place = MAX(hud_score.place, 0);
		taking->kills = player->statistics.kills[0];
		taking->deaths = player->statistics.deaths;
		taking->assists = player->statistics.assists[0];
		taking->suicides = player->statistics.suicides;
		taking->betrayals = player->statistics.friendly_fire_kills;
		social_medal_counts((short)DATUM_INDEX_TO_ABSOLUTE_INDEX(player_index), taking->medals);
	}
	if (!social.match_quit)
		return;
	for (slot = 0; slot < MAXIMUM_NUMBER_OF_LOCAL_PLAYERS; slot++)
	{
		struct social_match_player *gone = &social.match_players[slot];

		if (!gone->used || taken[slot])
			continue;
		if (social_recording() && social_match_counts(gone, (long)seconds))
			social_match_send(gone, (long)seconds, _social_match_end_quit);
		gone->used = FALSE;
	}
}

static void social_match_begin(
	void)
{
	social.match_recorded = FALSE;
	social.match_started = system_milliseconds();
	social.match_quit = FALSE;
	social.match_end = _social_match_end_ended;
	social.match_taken_at = 0;
	social.match_saved_at = social.match_started;
	csmemset(social.match_players, 0, sizeof(social.match_players));
}

/* (its scores shown) each of this machine's players' match, as it ends */
static void social_match_record(
	void)
{
	long seconds = (long)((system_milliseconds() - social.match_started) / 1000);
	char body[SOCIAL_RECORD_SIZE];
	short slot;

	social_match_take();
	for (slot = 0; slot < MAXIMUM_NUMBER_OF_LOCAL_PLAYERS; slot++)
	{
		struct social_match_player const *player = &social.match_players[slot];

		csmemset(body, 0, sizeof(body));
		if (!player->used || !social_match_body(player, seconds, TRUE, _social_match_end_ended, body, sizeof(body)))
			continue;
		social_record_add(body);
		platform_log("social: a match of %s recorded (%s)", player->name, player->result ? player->result : "no result");
	}
}

/* (the game gone before its scores) each of this machine's players' match,
as it was last taken: left as a quit, or as why it ended */
static void social_match_left(
	void)
{
	long seconds = (long)((social.match_taken_at ? social.match_taken_at : system_milliseconds()) -
		social.match_started) / 1000;
	short end = social.match_quit ? _social_match_end_quit : social.match_end;
	short slot;

	for (slot = 0; slot < MAXIMUM_NUMBER_OF_LOCAL_PLAYERS; slot++)
	{
		struct social_match_player const *player = &social.match_players[slot];

		if (player->used && social_match_counts(player, seconds))
			social_match_send(player, seconds, end);
	}
	csmemset(social.match_players, 0, sizeof(social.match_players));
}

/* a multiplayer game: begun, over (recorded once), left before its end
(recorded as it was), or a new round of it */
static void social_match_update(
	void)
{
	boolean playing = game_in_progress() && game_engine_running() && !network_replay_playing();
	unsigned long now = system_milliseconds();

	if (!social.match_file_looked && social_enabled())
		social_match_file_look();
	if (!playing)
	{
		if (social.match_running && !social.match_recorded)
		{
			if (social_recording())
				social_match_left();
			social_match_forget();
		}
		social.match_running = FALSE;
		return;
	}
	if (!social.match_running)
	{
		social.match_running = TRUE;
		social_match_begin();
		return;
	}
	if (!social.match_recorded && game_engine_showing_postgame())
	{
		social.match_recorded = TRUE;
		if (social_recording())
			social_match_record();
		social_match_forget();
	}
	else if (social.match_recorded && game_engine_in_play())
	{
		/* (the next game of the same map: game_engine_reset) */
		social_match_begin();
	}
	else if (!social.match_recorded && social_recording())
	{
		if (!social.match_taken_at || now - social.match_taken_at >= SOCIAL_MATCH_TAKE_MILLISECONDS)
		{
			social_match_take();
			social.match_taken_at = now ? now : 1;
		}
		if (now - social.match_saved_at >= SOCIAL_MATCH_SAVE_MILLISECONDS)
		{
			social_match_save();
			social.match_saved_at = now;
		}
	}
}

void social_match_quit(
	void)
{
	if (social.match_running && !social.match_recorded)
		social.match_quit = TRUE;
}

void social_match_error(
	short error_code)
{
	if (!social.match_running || social.match_recorded)
		return;
	if (error_code == _error_network_connection_lost)
		social.match_end = _social_match_end_disconnected;
	else if (error_code == _error_network_server_shut_down)
		social.match_end = _social_match_end_ended;
}

void social_level_won(
	short player_index,
	struct community_run const *run,
	char const *level_name,
	wchar_t const *name)
{
	struct server_json json;
	char text[SOCIAL_NAME_SIZE];
	char map[64];
	long medals[NUMBER_OF_CAMPAIGN_MEDALS];
	char const *last = level_name ? strrchr(level_name, '\\') : NULL;

	if (!social_recording() || !run)
		return;
	social_utf8_from_wide(name, 32, text, sizeof(text));
	snprintf(map, sizeof(map), "%s", last ? last + 1 : level_name ? level_name : "");
	social_record_begin(&json, "campaign", text, NULL, NULL);
	server_json_string(&json, "result", "win");
	server_json_integer(&json, "score", run->score);
	server_json_integer(&json, "kills", run->kills);
	server_json_integer(&json, "deaths", run->deaths);
	server_json_integer(&json, "seconds", run->seconds);
	server_json_integer(&json, "difficulty", run->difficulty);
	server_json_integer(&json, "players", MAX(run->players, 1));
	server_json_string(&json, "map", map);
	social_medal_counts(player_index, medals);
	social_medals_write(&json, medals);
	social_record_end(&json);
}

/* ---------- what the game is doing */

/* the game's name, gametype and players (a network game's), as UTF-8 */
static void social_presence_game(
	struct server_json *json)
{
	struct network_game *game = network_game_get_game();
	char text[96];

	if (!game || game_connection() == _game_connection_local)
		return;
	social_utf8_from_wide(game->name, NUMBEROF(game->name), text, sizeof(text));
	server_json_string(json, "game", text);
	social_utf8_from_wide(game->variant.human_readable_game_description,
		NUMBEROF(game->variant.human_readable_game_description), text, sizeof(text));
	server_json_string(json, "gametype", text);
	server_json_integer(json, "players", MAX(game->player_count, 0));
	server_json_integer(json, "maximum", game->maximum_players);
}

/* what the game is doing as POST /presence's body (the invite with
social.instant_join and social.friends on, of an internet game hosted) */
static void social_presence_text(
	char *text,
	long size)
{
	struct server_json json;
	short connection = game_connection();
	char map[64];
	char invite[SOCIAL_INVITE_SIZE];
	char name[SOCIAL_NAME_SIZE];
	char const *state = "menus";
	/* (the main menu is a scenario too, ui: not a game) */
	boolean playing = game_in_progress() && !main_menu_is_active();

	text[0] = 0;
	if (network_replay_playing())
		state = "theater";
	else if (playing && (connection != _game_connection_local || game_engine_running()))
		state = "multiplayer";
	else if (playing)
		state = "campaign";
	server_json_begin(&json);
	server_json_object_begin(&json, NULL);
	server_json_string(&json, "state", state);
	social_player_name(name, sizeof(name));
	if (name[0])
		server_json_string(&json, "name", name);
	if (playing)
	{
		social_map_name(map, sizeof(map));
		server_json_string(&json, "map", map);
	}
	social_presence_game(&json);
	server_json_boolean(&json, "host", connection == _game_connection_network_server);
	if (config_boolean("social.friends") && config_boolean("social.instant_join") &&
		p2p_invite_link(invite, sizeof(invite)) && invite[0])
	{
		server_json_string(&json, "invite", invite);
	}
	server_json_object_end(&json);
	if (!json.failed)
		snprintf(text, (size_t)size, "%s", server_json_text(&json));
	server_json_free(&json);
}

static long social_answer_number(
	char const *answer,
	char const *member,
	long otherwise)
{
	struct server_json_document document;
	long value = otherwise;

	if (server_json_parse(&document, answer, (int)strlen(answer), 16))
	{
		int data = server_json_member(&document, 0, "data");
		int token = data >= 0 ? server_json_member(&document, data, member) : -1;
		double number;

		if (token >= 0 && server_json_get_number(&document, token, &number))
			value = (long)number;
		server_json_document_free(&document);
	}
	return value;
}

static void social_presence_update(
	unsigned long now)
{
	char said[SOCIAL_PRESENCE_SIZE];

	if (social.presence_ticket)
	{
		int status = 0;
		int result = community_net_poll(social.presence_ticket, &status, social.answer, sizeof(social.answer));

		if (result == _community_net_waiting)
			return;
		social.presence_ticket = 0;
		if (result == _community_net_answered && status == 200)
		{
			social.friends_online = social_answer_number(social.answer, "friendsOnline", social.friends_online);
			social.requests_waiting = social_answer_number(social.answer, "requests", social.requests_waiting);
		}
		else
		{
			/* (said again a while after, as when it is unchanged) */
			social.presence_at = now ? now : 1;
		}
		return;
	}
	/* (once the account is had: said again a while after, or soon after it
	changed) */
	if (!social.code[0])
		return;
	social_presence_text(said, sizeof(said));
	if (!said[0])
		return;
	if (social.presence_at && (long)(now - social.presence_at) < SOCIAL_PRESENCE_MILLISECONDS &&
		(!strcmp(said, social.presence_said) ||
			(long)(now - social.presence_at) < SOCIAL_PRESENCE_CHANGE_MILLISECONDS))
	{
		return;
	}
	social.presence_ticket = social_send("/presence", said);
	if (social.presence_ticket)
	{
		csstrncpy(social.presence_said, said, sizeof(social.presence_said) - 1);
		social.presence_at = now ? now : 1;
	}
}

/* ---------- the frame */

void social_update(
	void)
{
	unsigned long now = system_milliseconds();

	social_match_update();
	if (social_enabled())
	{
		social_hello_update(now);
		social_records_update(now);
		social_presence_update(now);
	}
	social_chat_update();
	social_menu_update();
}
