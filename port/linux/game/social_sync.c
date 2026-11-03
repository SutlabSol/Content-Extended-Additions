/*
SOCIAL_SYNC.C

Account sync's game side (social_sync.h). The skulls of an account with more
than one install are kept by the server (api-opence's database/halo_sync.js):

- unlocked: the skulls unlocked, as game.skulls_unlocked's words. Each install
  sends its own and takes the union, so a skull unlocked on one is unlocked
  on the others.
- style: game.skulls_unlock_mode, game.skulls_all_unlocked,
  game.skulls_instant_unlock and game.skulls_lose_on_death. The server keeps
  a version of it: an install that has the version the server has changes it
  (and the version goes up); one that has an older version takes the server's.
- epoch: reset on one install starts a new epoch with nothing unlocked. An
  install that sees another epoch than the one it had drops its own
  unlocked skulls for the server's, so a reset is not undone by the installs
  that have not heard of it.

An install that has not asked yet has no epoch (-1) and takes the account's
style and skulls the first time. None of this is kept between runs.
*/

#include "cseries.h"

#include "halo_skulls.h"
#include "social_sync.h"
#include "social.h"
#include "../src/community_net.h"
#include "../src/port_config.h"
#include "../src/posix.h"
#include "../src/server_json.h"

#include <string.h>

void platform_log(char const *format, ...);

/* ---------- constants */

enum
{
	SOCIAL_SYNC_MILLISECONDS = 20000,
	SOCIAL_SYNC_RETRY_MILLISECONDS = 30000,
	SOCIAL_SYNC_ANSWER_SIZE = 4096,
	SOCIAL_SYNC_MODE_SIZE = 16
};

/* ---------- globals */

static struct
{
	boolean synced;
	int ticket;
	boolean pull;
	boolean reset;
	boolean reset_sent;
	unsigned long sent_at;
	char sent[SKULLS_TEXT_LENGTH + 64];
	long epoch;
	long version;
	boolean had;
	char answer[SOCIAL_SYNC_ANSWER_SIZE];
} social_sync = { FALSE, 0, FALSE, FALSE, FALSE, 0, "", -1, 0, FALSE, "" };

/* ---------- local skulls */

struct social_sync_style
{
	char mode[SOCIAL_SYNC_MODE_SIZE];
	boolean all;
	boolean instant;
	boolean lose;
};

static void social_sync_style_read(
	struct social_sync_style *style)
{
	if (!config_text("game.skulls_unlock_mode", style->mode, sizeof(style->mode)))
		style->mode[0] = 0;
	style->all = config_boolean("game.skulls_all_unlocked") != 0;
	style->instant = config_boolean("game.skulls_instant_unlock") != 0;
	style->lose = config_boolean("game.skulls_lose_on_death") != 0;
}

static void social_sync_unlocked_read(
	char *text,
	unsigned int size)
{
	if (!config_text("game.skulls_unlocked", text, size))
		text[0] = 0;
}

/* ---------- sending */

void social_sync_skulls_write(
	struct server_json *json,
	char const *key)
{
	struct social_sync_style style;
	char unlocked[SKULLS_TEXT_LENGTH];

	social_sync_style_read(&style);
	social_sync_unlocked_read(unlocked, sizeof(unlocked));
	server_json_object_begin(json, key);
	server_json_object_begin(json, "style");
	server_json_string(json, "mode", style.mode);
	server_json_boolean(json, "all", style.all);
	server_json_boolean(json, "instant", style.instant);
	server_json_boolean(json, "lose", style.lose);
	server_json_object_end(json);
	server_json_string(json, "unlocked", unlocked);
	server_json_integer(json, "version", social_sync.version);
	server_json_integer(json, "epoch", social_sync.epoch);
	if (social_sync.reset)
		server_json_boolean(json, "reset", TRUE);
	server_json_object_end(json);
}

/* the skulls as they are now, to tell whether they changed since they were sent */
static void social_sync_snapshot(
	char *text,
	unsigned int size)
{
	struct social_sync_style style;
	char unlocked[SKULLS_TEXT_LENGTH];

	social_sync_style_read(&style);
	social_sync_unlocked_read(unlocked, sizeof(unlocked));
	snprintf(text, size, "%s|%d%d%d|%s|%d", style.mode, style.all, style.instant, style.lose, unlocked,
		social_sync.reset);
}

/* ---------- taking */

static void social_sync_write_flag(
	char const *name,
	boolean value)
{
	if ((config_boolean(name) != 0) != (value != 0))
		config_write(name, value ? "true" : "false");
}

static void social_sync_take_skulls(
	struct server_json_document const *document,
	int skulls)
{
	struct social_sync_style style;
	struct social_sync_style server;
	char unlocked[SKULLS_TEXT_LENGTH];
	char text[SKULLS_TEXT_LENGTH];
	double number;
	long epoch = -1;
	long version = 0;
	int member;
	int token;
	int flag;
	boolean first = social_sync.epoch < 0;

	member = server_json_member(document, skulls, "epoch");
	if (member >= 0 && server_json_get_number(document, member, &number))
		epoch = (long)number;
	member = server_json_member(document, skulls, "version");
	if (member >= 0 && server_json_get_number(document, member, &number))
		version = (long)number;
	text[0] = 0;
	member = server_json_member(document, skulls, "unlocked");
	if (member >= 0 && !server_json_get_string(document, member, text, sizeof(text)))
		text[0] = 0;

	/* (the unlocked skulls: the account's own when it started again, else both) */
	social_sync_unlocked_read(unlocked, sizeof(unlocked));
	if (!first && epoch != social_sync.epoch)
	{
		csstrncpy(unlocked, text, sizeof(unlocked) - 1);
	}
	else
	{
		struct skull_set set = skull_set_union(skulls_set_from_text(unlocked), skulls_set_from_text(text));

		skulls_text_from_set(set, unlocked, sizeof(unlocked));
	}
	{
		char current[SKULLS_TEXT_LENGTH];

		social_sync_unlocked_read(current, sizeof(current));
		if (strcmp(current, unlocked))
		{
			platform_log("social: skulls unlocked on the account: %s", unlocked);
			config_write("game.skulls_unlocked", unlocked);
		}
	}

	/* (the style: the account's when this install had not seen its version) */
	token = server_json_member(document, skulls, "style");
	if (token >= 0 && (version != social_sync.version || (first && version > 0)))
	{
		social_sync_style_read(&style);
		server = style;
		member = server_json_member(document, token, "mode");
		if (member >= 0 && !server_json_get_string(document, member, server.mode, sizeof(server.mode)))
			server.mode[0] = 0;
		member = server_json_member(document, token, "all");
		if (member >= 0 && server_json_get_boolean(document, member, &flag))
			server.all = flag != 0;
		member = server_json_member(document, token, "instant");
		if (member >= 0 && server_json_get_boolean(document, member, &flag))
			server.instant = flag != 0;
		member = server_json_member(document, token, "lose");
		if (member >= 0 && server_json_get_boolean(document, member, &flag))
			server.lose = flag != 0;
		if (strcmp(style.mode, server.mode))
			config_write("game.skulls_unlock_mode", server.mode);
		social_sync_write_flag("game.skulls_all_unlocked", server.all);
		social_sync_write_flag("game.skulls_instant_unlock", server.instant);
		social_sync_write_flag("game.skulls_lose_on_death", server.lose);
	}
	social_sync.epoch = epoch;
	social_sync.version = version;
	social_sync.had = TRUE;
}

void social_sync_answer(
	char const *answer)
{
	struct server_json_document document;
	int data;
	int token;
	int flag;

	if (!answer || !server_json_parse(&document, answer, (int)strlen(answer), 16))
		return;
	data = server_json_member(&document, 0, "data");
	if (data >= 0)
	{
		token = server_json_member(&document, data, "account");
		token = token >= 0 ? server_json_member(&document, token, "synced") : -1;
		if (token >= 0 && server_json_get_boolean(&document, token, &flag))
		{
			if (flag && !social_sync.synced)
			{
				platform_log("social: the account is shared with other installs");
				social_sync.pull = TRUE;
			}
			social_sync.synced = flag != 0;
		}
		token = server_json_member(&document, data, "synced");
		if (token >= 0 && server_json_get_boolean(&document, token, &flag))
			social_sync.synced = flag != 0;
		token = server_json_member(&document, data, "skulls");
		if (token >= 0 && social_sync.synced)
			social_sync_take_skulls(&document, token);
	}
	server_json_document_free(&document);
}

/* ---------- the account's skulls */

boolean social_sync_active(
	void)
{
	return social_sync.synced;
}

void social_sync_skulls_reset(
	void)
{
	social_sync.reset = TRUE;
	social_sync.sent[0] = 0;
}

void social_sync_pull_soon(
	void)
{
	social_sync.pull = TRUE;
}

void social_sync_update(
	unsigned long now)
{
	char snapshot[sizeof(social_sync.sent)];

	if (!social_enabled() || !social_sync.synced)
		return;
	if (social_sync.ticket)
	{
		int status = 0;
		int result = community_net_poll(social_sync.ticket, &status, social_sync.answer,
			sizeof(social_sync.answer));

		if (result == _community_net_waiting)
			return;
		social_sync.ticket = 0;
		if (result == _community_net_answered && status == 200)
		{
			if (social_sync.reset_sent)
				social_sync.reset = FALSE;
			social_sync.reset_sent = FALSE;
			social_sync_answer(social_sync.answer);
			/* (what the answer did to the skulls is not a change to send) */
			social_sync_snapshot(social_sync.sent, sizeof(social_sync.sent));
		}
		else
		{
			social_sync.reset_sent = FALSE;
			social_sync.sent[0] = 0;
			social_sync.sent_at = now + SOCIAL_SYNC_RETRY_MILLISECONDS - SOCIAL_SYNC_MILLISECONDS;
		}
		return;
	}
	social_sync_snapshot(snapshot, sizeof(snapshot));
	if (social_sync.pull || strcmp(snapshot, social_sync.sent) ||
		(long)(now - social_sync.sent_at) >= SOCIAL_SYNC_MILLISECONDS)
	{
		struct server_json json;

		server_json_begin(&json);
		social_sync_skulls_write(&json, NULL);
		social_sync.reset_sent = social_sync.reset;
		social_sync.ticket = social_send("/account/skulls", server_json_text(&json));
		server_json_free(&json);
		social_sync.pull = FALSE;
		social_sync.sent_at = now;
		if (!social_sync.ticket)
			social_sync.reset_sent = FALSE;
	}
}
