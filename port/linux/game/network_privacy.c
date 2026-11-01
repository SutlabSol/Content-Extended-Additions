/* Whether an internet game is public (listed in the server browser) and has
a password: what a player's friends may do about it (social.c's presence: a
public game's players say how to join it, a private one's that it is
private). A player who joined from the server browser knows it already; one
who joined by an invite is told by the host, reliably, when it is ready and
when it changes, as a message upstream's builds drop as a kind they do not
know. Until it arrives, and in an upstream host's game, which never sends
it, the game is taken as private. */
#include "cseries.h"
#include "game/game.h"
#include "interface/ui_widget.h"
#include "main/main.h"
#include "networking/network_game_globals.h"
#include "network_distributed.h"
#include "network_privacy.h"
#include <string.h>

int p2p_hosting_internet(void);
int p2p_hosting_listed(void);
int p2p_hosting_password(void);

static boolean client_known = FALSE;
static boolean client_listed = FALSE;
static boolean client_locked = FALSE;
static short sent_privacy = NONE;

struct privacy_message
{
	struct distributed_message_header header;
	word listed;
	word locked;
};

/* the host's: bit 0 listed, bit 1 locked */
static short host_privacy(void)
{
	boolean listed = p2p_hosting_internet() && p2p_hosting_listed();

	return (short)((listed ? 1 : 0) | (listed && p2p_hosting_password() ? 2 : 0));
}

void network_privacy_reset(void)
{
	client_known = client_listed = client_locked = FALSE;
	sent_privacy = NONE;
}

boolean network_privacy_known(boolean *listed, boolean *locked)
{
	*listed = client_listed;
	*locked = client_locked;
	return client_known && game_connection() == _game_connection_network_client;
}

static void privacy_message_make(struct privacy_message *message, short privacy)
{
	memset(message, 0, sizeof(*message));
	message->listed = (privacy & 1) ? 1 : 0;
	message->locked = (privacy & 2) ? 1 : 0;
}

void network_privacy_send(long machine_index)
{
	struct privacy_message message;

	if (game_connection() != _game_connection_network_server)
		return;
	privacy_message_make(&message, host_privacy());
	distributed_send_to_machine_reliably(machine_index, &message, _distributed_message_game_privacy, 1,
		sizeof(message));
}

void network_privacy_update(void)
{
	struct privacy_message message;
	short privacy;

	if (!game_in_progress() || main_menu_is_active() || game_connection() != _game_connection_network_server)
		return;
	privacy = host_privacy();
	if (sent_privacy == privacy)
		return;
	sent_privacy = privacy;
	privacy_message_make(&message, privacy);
	distributed_send(&message, _distributed_message_game_privacy, 1, sizeof(message),
		_distributed_to_clients_reliably);
}

boolean network_privacy_handles_message(word const *message, word size)
{
	struct distributed_message_header header;

	if (size < sizeof(header))
		return FALSE;
	memcpy(&header, message, sizeof(header));
	return header.type == _distributed_message_game_privacy;
}

/* (the host's alone, over its stream, whole) */
void network_privacy_handle_message(long machine_index, word const *data, word size)
{
	struct privacy_message message;

	if (machine_index != NONE || game_connection() != _game_connection_network_client ||
		network_connection_last_read_was_unreliable() || size != sizeof(message))
		return;
	memcpy(&message, data, sizeof(message));
	if (GET_MESSAGE_TYPE(message.header.header) != 2 || message.header.type != _distributed_message_game_privacy ||
		message.header.count != 1 || message.listed > 1 || message.locked > 1)
		return;
	client_known = TRUE;
	client_listed = message.listed != 0;
	client_locked = message.locked != 0;
}
