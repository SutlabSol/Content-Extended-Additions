/*
MAP_PICTURES.C

A Custom Edition map's picture taken in the game (map_pictures.h).

The three shots are planned once the map is loaded (shots_plan), from its
players' starting places and its structure's bounds, by a random number
the Map Manager's REGENERATE changes (another starting place, other
corners):
- the first is one of the starting places, from a player's eyes, facing
  as it faces;
- the others look from two of the four corners above the map toward its
  middle (the starting places' middle): each is a line from that middle
  toward the corner, halfway up the bounds, stopped short of the first
  wall, ceiling or scenery it meets, so the camera stays in the level (a
  camera outside it draws nothing). A corner too near the middle (an
  indoor map's walls) is passed over for the next; with fewer than two,
  other starting places are taken instead.
Each shot's camera is held SHOT_SETTLE_FRAMES frames first, for the
textures it sees to be loaded.

A shot is the frame presented once the lines over the screen are hidden
(the second present after it is asked for: the first may have been drawn
with them), read back by the renderer: its middle, of the menus' picture
shape (140x114), averaged down to MAP_PICTURE_WIDTH by MAP_PICTURE_HEIGHT
and written bottom row first, as image editors write a bmp file. A renderer
that never reads it back (one without the hook) is given up on after
CAPTURE_TIMEOUT_MILLISECONDS.
*/

/* ---------- headers */

#include "cseries.h"
#include "cseries/errors.h"
#include "objects/objects.h"
#include "physics/collisions.h"
#include "scenario/scenario.h"
#include "scenario/scenario_definitions.h"
#include "structures/structure_bsp_definitions.h"
#include "tag_files/tag_groups.h"
#include "text/unicode.h"
#include "custom_edition_cache.h"
#include "custom_edition_maps.h"
#include "network_replay.h"
#include "map_pictures.h"

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <xtl.h>

/* ---------- constants */

/* where the shots to choose from are kept, and the room for a path */
#define MAP_PICTURES_FOLDER "d:\\map_pictures"
#define MAP_PICTURE_PATH_SIZE 256

/* the menus' picture shape */
#define PICTURE_SHAPE_WIDTH 140
#define PICTURE_SHAPE_HEIGHT 114

/* how long a shot's camera is held before it is taken (frames), how long
a capture is waited for (milliseconds), and how long what was done is said
(milliseconds) */
#define SHOT_SETTLE_FRAMES 45
#define CAPTURE_TIMEOUT_MILLISECONDS 3000
#define STATUS_MILLISECONDS 4000

/* a player's eyes above where they stand, how far short of a wall a
corner's camera stops, the nearest to the middle it may be, how far toward
the middle the bounds' corners are taken in (of the way), and how high
between the middle and the bounds' top */
#define SHOT_EYE_HEIGHT 0.62f
#define SHOT_WALL_MARGIN 0.5f
#define SHOT_NEAREST_CORNER 3.0f
#define SHOT_CORNER_INSET 0.15f
#define SHOT_CORNER_HEIGHT 0.5f
/* the middle looked at, above the starting places' middle */
#define SHOT_MIDDLE_HEIGHT 0.5f

/* what a corner's line stops at: as the Theater's free camera, the level,
its scenery and machines, invisible walls too */
#define SHOT_COLLISION_FLAGS (FLAG(_collision_test_front_facing_surfaces_bit) | \
	FLAG(_collision_test_structure_bit) | FLAG(_collision_test_objects_scenery_bit) | \
	FLAG(_collision_test_objects_machines_bit))

/* ---------- prototypes */

unsigned long system_milliseconds(void);

/* ---------- globals */

static struct
{
	/* the map the game left the Map Manager for (its file name; empty for
	none), to return to it */
	char returning[CUSTOM_EDITION_MAP_NAME_SIZE];
	/* a map with a picture already whose Theater shot was taken: which of
	the two to keep is asked once the game is left (empty for none); and
	whether the capture asked for is that shot */
	char choosing[CUSTOM_EDITION_MAP_NAME_SIZE];
	boolean capture_choosing;
	/* the last three shots asked for were not all taken */
	boolean shots_failed;
	/* the three shots: being made, planned, all taken; the one being taken,
	the frames its camera has been held, and whether it has been taken;
	their cameras; the number they are planned by */
	boolean shots_wanted;
	boolean shots_planned;
	boolean shots_done;
	short shot;
	short shot_frames;
	boolean shot_taken;
	real_point3d shot_positions[MAP_PICTURE_SHOTS];
	real_vector3d shot_forwards[MAP_PICTURE_SHOTS];
	unsigned long seed;
	/* a capture asked for: when, the frames presented since, the file it is
	written to and the map's own picture it is copied to (empty: none), and
	the map's name as the menus show it */
	boolean capturing;
	unsigned long capture_time;
	short capture_frames;
	char capture_path[MAP_PICTURE_PATH_SIZE];
	char capture_copy[MAP_PICTURE_PATH_SIZE];
	wchar_t capture_name[64];
	/* what was last done, and when */
	wchar_t status[96];
	unsigned long status_time;
} map_pictures;

/* ---------- private code */

static void status_set(
	wchar_t const *text)
{
	ustrncpy(map_pictures.status, text, NUMBEROF(map_pictures.status) - 1);
	map_pictures.status[NUMBEROF(map_pictures.status) - 1] = 0;
	map_pictures.status_time = system_milliseconds();
}

/* the next of the shots' random numbers (xorshift) */
static unsigned long shots_random(
	void)
{
	unsigned long value = map_pictures.seed ? map_pictures.seed : 0x2545F491UL;

	value ^= value << 13;
	value ^= value >> 17;
	value ^= value << 5;
	map_pictures.seed = value & 0xFFFFFFFFUL;
	return map_pictures.seed;
}

/* whether a point is in the level (in one of its clusters) */
static boolean shots_in_level(
	real_point3d const *point)
{
	struct location location;

	scenario_location_from_point(&location, point);
	return location.cluster_index != NONE;
}

/* the starting place's camera: at a player's eyes, facing as it faces,
level */
static void shots_starting_place(
	struct player_starting_location const *location,
	real_point3d *position,
	real_vector3d *forward)
{
	*position = location->position;
	position->z += SHOT_EYE_HEIGHT;
	forward->i = (real)cos(location->facing);
	forward->j = (real)sin(location->facing);
	forward->k = 0.0f;
}

/* from `from`, as far toward `toward` as the level lets a camera go
(SHOT_WALL_MARGIN short of what it meets) in *camera; FALSE if that is not
SHOT_NEAREST_CORNER from it, or is out of the level */
static boolean shots_toward(
	real_point3d const *from,
	real_point3d const *toward,
	real_point3d *camera)
{
	struct collision_result collision;
	real_vector3d line;
	real length, travel;

	line.i = toward->x - from->x;
	line.j = toward->y - from->y;
	line.k = toward->z - from->z;
	length = (real)sqrt(line.i * line.i + line.j * line.j + line.k * line.k);
	if (length < SHOT_NEAREST_CORNER)
		return FALSE;
	travel = length;
	if (collision_test_vector(SHOT_COLLISION_FLAGS, from, &line, NONE, &collision))
	{
		real_vector3d hit;

		hit.i = collision.point.x - from->x;
		hit.j = collision.point.y - from->y;
		hit.k = collision.point.z - from->z;
		travel = (real)sqrt(hit.i * hit.i + hit.j * hit.j + hit.k * hit.k) - SHOT_WALL_MARGIN;
	}
	if (travel < SHOT_NEAREST_CORNER)
		return FALSE;
	camera->x = from->x + line.i / length * travel;
	camera->y = from->y + line.j / length * travel;
	camera->z = from->z + line.k / length * travel;
	return shots_in_level(camera);
}

/* the three shots' cameras, for the map loaded; FALSE (said) if it has
nowhere to take them from */
static boolean shots_plan(
	void)
{
	struct scenario *scenario = global_scenario_get();
	struct structure_bsp *bsp = global_structure_bsp_get();
	long starting_count = scenario ? scenario->players.count : 0;
	real_point3d middle, origin, corners[4];
	short count = 0;
	short corner, other;
	long index;

	if (!scenario || !bsp)
		return FALSE;
	/* (the starting places' middle, looked at; the bounds' without them) */
	middle.x = (bsp->world_bounds.x0 + bsp->world_bounds.x1) / 2.0f;
	middle.y = (bsp->world_bounds.y0 + bsp->world_bounds.y1) / 2.0f;
	middle.z = (bsp->world_bounds.z0 + bsp->world_bounds.z1) / 2.0f;
	if (starting_count > 0)
	{
		middle.x = middle.y = middle.z = 0.0f;
		for (index = 0; index < starting_count; index++)
		{
			struct player_starting_location const *location = TAG_BLOCK_GET_ELEMENT(&scenario->players, index,
				struct player_starting_location);

			middle.x += location->position.x;
			middle.y += location->position.y;
			middle.z += location->position.z;
		}
		middle.x /= (real)starting_count;
		middle.y /= (real)starting_count;
		middle.z = middle.z / (real)starting_count + SHOT_MIDDLE_HEIGHT;
	}
	/* (the first: a starting place, at random) */
	if (starting_count > 0)
	{
		struct player_starting_location const *location = TAG_BLOCK_GET_ELEMENT(&scenario->players,
			(long)(shots_random() % (unsigned long)starting_count), struct player_starting_location);

		shots_starting_place(location, &map_pictures.shot_positions[count], &map_pictures.shot_forwards[count]);
		count++;
	}
	/* (the corners' lines start at the middle, or, out of the level (in a
	pillar), at the first shot's place) */
	origin = middle;
	if (!shots_in_level(&origin) && count)
		origin = map_pictures.shot_positions[0];
	for (corner = 0; corner < 4; corner++)
	{
		real x = (corner & 1) ? bsp->world_bounds.x1 : bsp->world_bounds.x0;
		real y = (corner & 2) ? bsp->world_bounds.y1 : bsp->world_bounds.y0;

		corners[corner].x = x + (middle.x - x) * SHOT_CORNER_INSET;
		corners[corner].y = y + (middle.y - y) * SHOT_CORNER_INSET;
		corners[corner].z = origin.z + (bsp->world_bounds.z1 - origin.z) * SHOT_CORNER_HEIGHT;
	}
	/* (in a random order) */
	for (corner = 3; corner > 0; corner--)
	{
		real_point3d swapped = corners[corner];

		other = (short)(shots_random() % (unsigned long)(corner + 1));
		corners[corner] = corners[other];
		corners[other] = swapped;
	}
	for (corner = 0; corner < 4 && count < MAP_PICTURE_SHOTS; corner++)
	{
		real_point3d *position = &map_pictures.shot_positions[count];
		real_vector3d *forward = &map_pictures.shot_forwards[count];

		if (!shots_toward(&origin, &corners[corner], position))
			continue;
		forward->i = middle.x - position->x;
		forward->j = middle.y - position->y;
		forward->k = middle.z - position->z;
		count++;
	}
	/* (too few corners: other starting places) */
	for (index = 0; count < MAP_PICTURE_SHOTS && starting_count > 0 && index < 8; index++)
	{
		struct player_starting_location const *location = TAG_BLOCK_GET_ELEMENT(&scenario->players,
			(long)(shots_random() % (unsigned long)starting_count), struct player_starting_location);

		shots_starting_place(location, &map_pictures.shot_positions[count], &map_pictures.shot_forwards[count]);
		count++;
	}
	if (count < MAP_PICTURE_SHOTS)
	{
		status_set(L"This map has no places to take its pictures from.");
		error(_error_silent, "map pictures: %d places for shots found, of %d", count, MAP_PICTURE_SHOTS);
		return FALSE;
	}
	error(_error_silent, "map pictures: shots planned (seed %08lx, %ld starting places)", map_pictures.seed,
		starting_count);
	return TRUE;
}

/* the frame asked for, written to path and (copy not empty) copied to the
map's own picture */
static void capture_begin(
	char const *path,
	char const *copy,
	wchar_t const *name)
{
	csstrncpy(map_pictures.capture_path, path, sizeof(map_pictures.capture_path) - 1);
	map_pictures.capture_path[sizeof(map_pictures.capture_path) - 1] = 0;
	csstrncpy(map_pictures.capture_copy, copy ? copy : "", sizeof(map_pictures.capture_copy) - 1);
	map_pictures.capture_copy[sizeof(map_pictures.capture_copy) - 1] = 0;
	ustrncpy(map_pictures.capture_name, name ? name : L"", NUMBEROF(map_pictures.capture_name) - 1);
	map_pictures.capture_name[NUMBEROF(map_pictures.capture_name) - 1] = 0;
	map_pictures.capture_frames = 0;
	map_pictures.capture_time = system_milliseconds();
	map_pictures.capture_choosing = FALSE;
	map_pictures.capturing = TRUE;
}

/* a capture not read back in time: given up on */
static void capture_check(
	void)
{
	if (map_pictures.capturing && system_milliseconds() - map_pictures.capture_time > CAPTURE_TIMEOUT_MILLISECONDS)
	{
		map_pictures.capturing = FALSE;
		map_pictures.shot_taken = TRUE;
		if (map_pictures.capture_choosing)
			map_pictures.choosing[0] = 0;
		status_set(L"Pictures cannot be taken with this renderer.");
		error(_error_silent, "map pictures: the frame for '%s' was never read back", map_pictures.capture_path);
	}
}

/* the map at the display index, left for: its files, its level name and
where the game returns; FALSE (why) if it cannot be */
static boolean session_begin(
	short display_index,
	struct custom_edition_map_file *file,
	char const **level_name,
	char *why,
	long why_size)
{
	*level_name = custom_edition_maps_level_name(display_index);
	if (!custom_edition_maps_file_get(display_index, file) || !*level_name)
	{
		snprintf(why, (size_t)why_size, "That map is not there any more.");
		return FALSE;
	}
	map_pictures.shots_wanted = FALSE;
	map_pictures.capturing = FALSE;
	csstrncpy(map_pictures.returning, file->name, sizeof(map_pictures.returning) - 1);
	map_pictures.returning[sizeof(map_pictures.returning) - 1] = 0;
	return TRUE;
}

/* ---------- public code */

boolean map_pictures_shot_path(
	char const *map_name,
	short shot,
	char *path,
	long size)
{
	char suffix[16];

	if (shot == _map_picture_shot_theater)
		csstrcpy(suffix, "_theater");
	else
		csprintf(suffix, "_shot%d", shot + 1);
	if ((long)(csstrlen(MAP_PICTURES_FOLDER) + 1 + csstrlen(map_name) + csstrlen(suffix) + 4) >= size)
		return FALSE;
	csprintf(path, "%s\\%s%s.bmp", MAP_PICTURES_FOLDER, map_name, suffix);
	return TRUE;
}

boolean map_pictures_generate(
	short display_index,
	char *why,
	long why_size)
{
	struct custom_edition_map_file file;
	char const *level_name;
	char path[MAP_PICTURE_PATH_SIZE];
	short shot;

	if (!session_begin(display_index, &file, &level_name, why, why_size))
		return FALSE;
	/* (the last ones gone, so a shot not taken this time is not shown) */
	for (shot = 0; shot < MAP_PICTURE_SHOTS; shot++)
	{
		if (map_pictures_shot_path(file.name, shot, path, sizeof(path)))
			DeleteFileA(path);
	}
	map_pictures.shots_wanted = TRUE;
	map_pictures.shots_failed = FALSE;
	map_pictures.shots_planned = FALSE;
	map_pictures.shots_done = FALSE;
	map_pictures.shot = 0;
	map_pictures.shot_frames = 0;
	map_pictures.shot_taken = FALSE;
	/* (other places each time) */
	map_pictures.seed ^= system_milliseconds() * 2654435761UL;
	shots_random();
	if (!network_replay_explore(level_name, TRUE, why, why_size))
	{
		map_pictures.shots_wanted = FALSE;
		map_pictures.returning[0] = 0;
		return FALSE;
	}
	return TRUE;
}

boolean map_pictures_explore(
	short display_index,
	char *why,
	long why_size)
{
	struct custom_edition_map_file file;
	char const *level_name;

	if (!session_begin(display_index, &file, &level_name, why, why_size))
		return FALSE;
	if (!network_replay_explore(level_name, FALSE, why, why_size))
	{
		map_pictures.returning[0] = 0;
		return FALSE;
	}
	return TRUE;
}

boolean map_pictures_watch(
	short display_index,
	char const *replay_path,
	char *why,
	long why_size)
{
	struct custom_edition_map_file file;
	char const *level_name;

	if (!session_begin(display_index, &file, &level_name, why, why_size))
		return FALSE;
	if (!network_replay_watch(replay_path, why, why_size))
	{
		map_pictures.returning[0] = 0;
		return FALSE;
	}
	return TRUE;
}

boolean map_pictures_return_take(
	char *name,
	long size,
	boolean *choose)
{
	*choose = map_pictures.choosing[0] != 0;
	if (!map_pictures.returning[0] && !*choose)
		return FALSE;
	csstrncpy(name, *choose ? map_pictures.choosing : map_pictures.returning, size - 1);
	name[size - 1] = 0;
	map_pictures.returning[0] = 0;
	map_pictures.choosing[0] = 0;
	map_pictures.shots_failed = map_pictures.shots_wanted && !map_pictures.shots_done;
	map_pictures.shots_wanted = FALSE;
	map_pictures.capturing = FALSE;
	return TRUE;
}

boolean map_pictures_shots_failed(
	void)
{
	return map_pictures.shots_failed;
}

boolean map_pictures_take(
	char const *level_name)
{
	struct custom_edition_map_file file;
	char path[MAP_PICTURE_PATH_SIZE];
	char copy[MAP_PICTURE_PATH_SIZE];
	short display_index = level_name ? custom_edition_maps_display_index(level_name) : NONE;
	wchar_t const *name;

	if (map_pictures.capturing)
	{
		status_set(L"A picture is being taken.");
		return FALSE;
	}
	if (display_index == NONE || !custom_edition_maps_file_get(display_index, &file) ||
		custom_edition_maps_campaign_level(display_index) != NONE)
	{
		status_set(L"Only Custom Edition maps have pictures of their own.");
		return FALSE;
	}
	if (!file.managed)
	{
		status_set(L"Only the maps in custom_maps can be given a picture.");
		return FALSE;
	}
	if (!map_pictures_shot_path(file.name, _map_picture_shot_theater, path, sizeof(path)) ||
		!custom_edition_maps_file_path(display_index, ".bmp", copy, sizeof(copy)))
	{
		status_set(L"The map's name is too long for a picture.");
		return FALSE;
	}
	name = custom_edition_maps_name(display_index);
	/* (a map with a picture: its shot alone, and which to keep asked once
	the game is left) */
	capture_begin(path, file.has_picture ? NULL : copy, name);
	if (file.has_picture)
	{
		map_pictures.capture_choosing = TRUE;
		csstrcpy(map_pictures.choosing, file.name);
	}
	return TRUE;
}

boolean map_pictures_shots_camera(
	real_point3d *position,
	real_vector3d *forward)
{
	char path[MAP_PICTURE_PATH_SIZE];
	wchar_t text[64];

	if (!map_pictures.shots_wanted || map_pictures.shots_done)
		return FALSE;
	if (!map_pictures.shots_planned)
	{
		map_pictures.shots_planned = TRUE;
		if (!shots_plan())
		{
			map_pictures.shots_done = TRUE;
			return FALSE;
		}
	}
	capture_check();
	/* (taken: the next one) */
	if (map_pictures.shot_taken && !map_pictures.capturing)
	{
		map_pictures.shot++;
		map_pictures.shot_frames = 0;
		map_pictures.shot_taken = FALSE;
		if (map_pictures.shot >= MAP_PICTURE_SHOTS)
		{
			map_pictures.shots_done = TRUE;
			status_set(L"The pictures are taken.");
			return FALSE;
		}
	}
	*position = map_pictures.shot_positions[map_pictures.shot];
	*forward = map_pictures.shot_forwards[map_pictures.shot];
	if (!map_pictures.capturing && ++map_pictures.shot_frames >= SHOT_SETTLE_FRAMES)
	{
		if (map_pictures_shot_path(map_pictures.returning, map_pictures.shot, path, sizeof(path)))
			capture_begin(path, NULL, NULL);
		else
			map_pictures.shot_taken = TRUE;
	}
	usnprintf(text, NUMBEROF(text) - 1, L"Taking the pictures: %d of %d", map_pictures.shot + 1, MAP_PICTURE_SHOTS);
	text[NUMBEROF(text) - 1] = 0;
	status_set(text);
	return TRUE;
}

boolean map_pictures_shots_done(
	void)
{
	return map_pictures.shots_wanted && map_pictures.shots_done;
}

boolean map_pictures_start_camera(
	real_point3d *position,
	real *yaw)
{
	struct scenario *scenario = global_scenario_get();
	struct player_starting_location const *location;
	real_vector3d forward;

	if (!scenario || scenario->players.count <= 0)
		return FALSE;
	location = TAG_BLOCK_GET_ELEMENT(&scenario->players, 0, struct player_starting_location);
	shots_starting_place(location, position, &forward);
	*yaw = location->facing;
	return TRUE;
}

boolean map_pictures_hiding(
	void)
{
	capture_check();
	return map_pictures.capturing;
}

boolean map_pictures_status(
	wchar_t *text,
	long length)
{
	if (!map_pictures.status[0] || system_milliseconds() - map_pictures.status_time > STATUS_MILLISECONDS)
		return FALSE;
	ustrncpy(text, map_pictures.status, length - 1);
	text[length - 1] = 0;
	return TRUE;
}

int map_pictures_capture_wanted(
	void)
{
	/* (the first present may show the lines over the screen: the second) */
	return map_pictures.capturing && ++map_pictures.capture_frames >= 2;
}

void map_pictures_capture_take(
	unsigned char const *pixels,
	unsigned long width,
	unsigned long height,
	unsigned long pitch,
	int bgra)
{
	/* a bmp file's headers: the file's (14 bytes) and the picture's (40) */
	unsigned char header[54];
	unsigned char row[MAP_PICTURE_WIDTH * 3];
	unsigned long crop_width, crop_height, left, top;
	unsigned long file_size = sizeof(header) + sizeof(row) * MAP_PICTURE_HEIGHT;
	long x, y;
	FILE *file;
	wchar_t text[96];

	if (!map_pictures.capturing)
		return;
	map_pictures.capturing = FALSE;
	map_pictures.shot_taken = TRUE;
	if (!pixels || !width || !height)
		return;
	/* (the middle, of the menus' picture shape) */
	crop_width = width;
	crop_height = width * PICTURE_SHAPE_HEIGHT / PICTURE_SHAPE_WIDTH;
	if (crop_height > height)
	{
		crop_height = height;
		crop_width = height * PICTURE_SHAPE_WIDTH / PICTURE_SHAPE_HEIGHT;
	}
	left = (width - crop_width) / 2;
	top = (height - crop_height) / 2;
	CreateDirectoryA(MAP_PICTURES_FOLDER, NULL);
	file = fopen(map_pictures.capture_path, "wb");
	if (!file)
	{
		status_set(L"The picture could not be written.");
		error(_error_silent, "map pictures: '%s' could not be written", map_pictures.capture_path);
		return;
	}
	csmemset(header, 0, sizeof(header));
	header[0] = 'B';
	header[1] = 'M';
	header[2] = (unsigned char)file_size;
	header[3] = (unsigned char)(file_size >> 8);
	header[4] = (unsigned char)(file_size >> 16);
	header[5] = (unsigned char)(file_size >> 24);
	header[10] = sizeof(header);
	header[14] = 40;
	header[18] = (unsigned char)MAP_PICTURE_WIDTH;
	header[19] = (unsigned char)(MAP_PICTURE_WIDTH >> 8);
	header[22] = (unsigned char)MAP_PICTURE_HEIGHT;
	header[23] = (unsigned char)(MAP_PICTURE_HEIGHT >> 8);
	header[26] = 1;
	header[28] = 24;
	fwrite(header, 1, sizeof(header), file);
	/* (the bottom row first; each pixel the average of those it covers) */
	for (y = MAP_PICTURE_HEIGHT - 1; y >= 0; y--)
	{
		unsigned long y0 = top + (unsigned long)y * crop_height / MAP_PICTURE_HEIGHT;
		unsigned long y1 = MAX(y0 + 1, top + (unsigned long)(y + 1) * crop_height / MAP_PICTURE_HEIGHT);

		for (x = 0; x < MAP_PICTURE_WIDTH; x++)
		{
			unsigned long x0 = left + (unsigned long)x * crop_width / MAP_PICTURE_WIDTH;
			unsigned long x1 = MAX(x0 + 1, left + (unsigned long)(x + 1) * crop_width / MAP_PICTURE_WIDTH);
			unsigned long sums[3] = { 0, 0, 0 };
			unsigned long count = (x1 - x0) * (y1 - y0);
			unsigned long sx, sy;

			for (sy = y0; sy < y1; sy++)
			{
				unsigned char const *texel = pixels + sy * pitch + x0 * 4;

				for (sx = x0; sx < x1; sx++, texel += 4)
				{
					sums[0] += texel[0];
					sums[1] += texel[1];
					sums[2] += texel[2];
				}
			}
			/* (a bmp file's pixels are blue, green, red) */
			row[x * 3 + 0] = (unsigned char)((bgra ? sums[0] : sums[2]) / count);
			row[x * 3 + 1] = (unsigned char)(sums[1] / count);
			row[x * 3 + 2] = (unsigned char)((bgra ? sums[2] : sums[0]) / count);
		}
		fwrite(row, 1, sizeof(row), file);
	}
	if (fclose(file) != 0)
	{
		status_set(L"The picture could not be written.");
		return;
	}
	error(_error_silent, "map pictures: %s written from a %lux%lu frame", map_pictures.capture_path, width, height);
	if (map_pictures.capture_choosing)
		status_set(L"Taken. Leave to choose between it and the map's picture.");
	if (map_pictures.capture_copy[0])
	{
		if (!CopyFileA(map_pictures.capture_path, map_pictures.capture_copy, FALSE))
		{
			status_set(L"The picture could not be saved beside the map.");
			return;
		}
		usnprintf(text, NUMBEROF(text) - 1, L"Saved as %.48s's picture.", map_pictures.capture_name);
		text[NUMBEROF(text) - 1] = 0;
		status_set(text);
		/* (the menus read it, and the folder, again) */
		custom_edition_maps_look_again();
	}
}
