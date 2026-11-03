/*
PLATFORM_ICONS.C

The indicators in port/assets/buttons/platforms/icons, embedded by
tools/embed_assets.py and drawn as ordinary game bitmaps on every renderer.
*/

#include "cseries.h"
#include "bitmaps/bitmap_group.h"
#include "bitmaps/bitmaps.h"
#include "interface/interface.h"
#include "interface/ui_widget.h"
#include "rasterizer/rasterizer.h"
#include "rasterizer/xbox/rasterizer_xbox_hardware_bitmaps.h"

#include "platform_icons.h"
#include "network_distributed.h"
#include "../src/community_net.h"
#include "../src/hud_hires.h"

#include <stdlib.h>
#include <string.h>

void platform_log(char const *format, ...);

static struct bitmap_data *platform_icon_bitmaps[NUMBER_OF_PLATFORM_ICON_KINDS];
static boolean platform_icon_bitmaps_loaded;

short platform_icon_for_name(
	char const *platform)
{
	if (!platform)
		return _platform_icon_none;
	if (!strcmp(platform, "web") || !strcmp(platform, "windows") || !strcmp(platform, "linux"))
		return _platform_icon_pc_web;
	if (!strcmp(platform, "switch"))
		return _platform_icon_switch;
	if (!strcmp(platform, "android"))
		return _platform_icon_android;
	return _platform_icon_none;
}

short platform_icon_local(
	void)
{
	return platform_icon_for_name(community_net_platform());
}

short platform_icon_for_machine(
	long machine_index)
{
	return network_distributed_machine_platform(machine_index);
}

char const *platform_icon_label(
	char const *platform)
{
	if (!platform)
		return NULL;
	if (!strcmp(platform, "web"))
		return "WEB";
	if (!strcmp(platform, "windows") || !strcmp(platform, "linux"))
		return "PC";
	if (!strcmp(platform, "switch"))
		return "SWITCH";
	if (!strcmp(platform, "android"))
		return "ANDROID";
	return NULL;
}

static void platform_icon_bitmaps_load(
	void)
{
	unsigned int index;

	if (platform_icon_bitmaps_loaded)
		return;
	platform_icon_bitmaps_loaded = TRUE;
	for (index = 0; index < platform_icon_image_count; index++)
	{
		struct platform_icon_image const *image = &platform_icon_images[index];
		unsigned long width;
		unsigned long height;
		unsigned char *pixels;
		struct bitmap_data *bitmap;
		unsigned long pixel_index;

		if (image->kind <= _platform_icon_none || image->kind >= NUMBER_OF_PLATFORM_ICON_KINDS)
			continue;
		pixels = hud_hires_png_pixels(image->png, image->png_size, &width, &height);
		if (!pixels)
		{
			platform_log("platform icons: could not decode icon %d", (int)image->kind);
			continue;
		}
		if (width != 128 || height != 128)
		{
			platform_log("platform icons: icon %d is %lux%lu, not 128x128",
				(int)image->kind, width, height);
			hud_hires_png_pixels_free(pixels);
			continue;
		}
		bitmap = bitmap_2d_new((short)width, (short)height, 0, 11);
		/* (the hardware texture first, then its texels, as every other bitmap the port fills) */
		if (bitmap && !rasterizer_bitmap_new(bitmap))
		{
			bitmap_delete(bitmap);
			bitmap = NULL;
		}
		if (!bitmap || !bitmap->base_address)
		{
			platform_log("platform icons: could not allocate icon %d", (int)image->kind);
			bitmap_delete(bitmap);
			hud_hires_png_pixels_free(pixels);
			continue;
		}
		for (pixel_index = 0; pixel_index < width * height; pixel_index++)
		{
			unsigned char const *source = pixels + pixel_index * 4;
			pixel32 color = ((pixel32)source[3] << 24) | ((pixel32)source[0] << 16) |
				((pixel32)source[1] << 8) | source[2];

			((pixel32 *)bitmap->base_address)[pixel_index] = color;
		}
		hud_hires_png_pixels_free(pixels);
		rasterizer_bitmap_changed(bitmap);
		platform_icon_bitmaps[image->kind] = bitmap;
	}
}

void platform_icon_draw(
	short kind,
	rectangle2d const *bounds,
	pixel32 color)
{
	if (kind <= _platform_icon_none || kind >= NUMBER_OF_PLATFORM_ICON_KINDS || !bounds)
		return;
	platform_icon_bitmaps_load();
	if (platform_icon_bitmaps[kind])
		draw_bitmap_in_rect(platform_icon_bitmaps[kind], bounds, NULL, NULL, color, NULL, TRUE);
}
