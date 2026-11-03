/*
PLATFORM_ICONS.H

The small platform indicators shown beside social and multiplayer players.
*/

#ifndef __PLATFORM_ICONS_H
#define __PLATFORM_ICONS_H
#pragma once

#include "cseries.h"
#include "platform_icons_data.h"

enum platform_icon_kind
{
	_platform_icon_none,
	_platform_icon_pc_web,
	_platform_icon_switch,
	_platform_icon_android,
	NUMBER_OF_PLATFORM_ICON_KINDS
};

short platform_icon_for_name(char const *platform);
short platform_icon_local(void);
short platform_icon_for_machine(long machine_index);
char const *platform_icon_label(char const *platform);
void platform_icon_draw(short kind, rectangle2d const *bounds, pixel32 color);

#endif
