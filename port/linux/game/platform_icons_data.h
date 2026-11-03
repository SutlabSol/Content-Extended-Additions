/*
PLATFORM_ICONS_DATA.H

The embedded icon data shared by the generated asset source and its renderer.
*/

#ifndef __PLATFORM_ICONS_DATA_H
#define __PLATFORM_ICONS_DATA_H
#pragma once

struct platform_icon_image
{
	short kind;
	const unsigned int *png;
	unsigned long png_size;
};

extern const struct platform_icon_image platform_icon_images[];
extern const unsigned int platform_icon_image_count;

#endif
