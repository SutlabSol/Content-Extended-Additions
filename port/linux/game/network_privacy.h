#ifndef NETWORK_PRIVACY_H
#define NETWORK_PRIVACY_H
#include "cseries.h"
/* whether the internet game being played is listed in the server browser,
and has a password: the host's, which its clients are told (the social
presence's: social.c) */
void network_privacy_reset(void);
void network_privacy_update(void);
void network_privacy_send(long machine_index);
/* a client: TRUE once the host said (listed, locked its word); FALSE until
then, and in an upstream host's game, which never says */
boolean network_privacy_known(boolean *listed, boolean *locked);
boolean network_privacy_handles_message(word const *message, word size);
void network_privacy_handle_message(long machine_index, word const *message, word size);
#endif
