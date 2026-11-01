/*
MAP_PICTURES.H

A Custom Edition map's picture (<name>.bmp beside it, which the menus show:
custom_edition_maps.c) taken in the game: three shots made on their own
(the view from one of its players' starting places, and from two of its
corners toward its middle), or the frame a player chose in the Theater. The
Map Manager (map_manager.c) starts them and shows the shots to choose from.

A shot is the frame drawn as it is presented, read back by the renderer
(d3d8_gl.c, port/switch/guest/d3d8_dk.c, port/android/guest/d3d8_vk.c ask
map_pictures_capture_wanted at each present and hand the pixels to
map_pictures_capture_take), the lines over the screen hidden while it is
taken; its middle, in the menus' picture shape, written as a 24-bit bmp
file of MAP_PICTURE_WIDTH by MAP_PICTURE_HEIGHT.

The shots are made in a Theater with no recording (network_replay_explore):
the map loaded with nobody in it and its clock held, the free camera put
at each place in turn. The shots to choose from are kept in the data
folder's map_pictures (d:\map_pictures\<name>_shot<n>.bmp, and the last
Theater one's <name>_theater.bmp) until the next ones are made.
*/

#ifndef __MAP_PICTURES_H
#define __MAP_PICTURES_H

/* ---------- constants */

/* a picture written: twice the menus' picture shape (140x114) */
#define MAP_PICTURE_WIDTH 280
#define MAP_PICTURE_HEIGHT 228

/* the shots made on their own: the starting place's, then two corners' */
#define MAP_PICTURE_SHOTS 3

/* the shots to choose from (map_pictures_shot_path) */
enum
{
	_map_picture_shot_spawn,
	_map_picture_shot_corner_first,
	_map_picture_shot_corner_second,
	_map_picture_shot_theater,
	NUMBER_OF_MAP_PICTURE_SHOTS
};

/* ---------- prototypes/MAP_PICTURES.C */

/* the file of a shot to choose from of the map (its file name, without
.map) in path: d:\map_pictures\<name>_shot<n>.bmp; FALSE if it does not fit */
boolean map_pictures_shot_path(
	char const *map_name,
	short shot,
	char *path,
	long size);

/* (the Map Manager) the three shots of the map at the display index made
again, in a Theater with no recording: other places than the last time.
The game returns to the Map Manager once they are taken. FALSE, with why,
when it cannot start */
boolean map_pictures_generate(
	short display_index,
	char *why,
	long why_size);

/* (the Map Manager) the map walked round in a Theater with no recording,
or the replay at replay_path (the host's path) played, for a picture to be
taken in it; then back to the Map Manager */
boolean map_pictures_explore(
	short display_index,
	char *why,
	long why_size);
boolean map_pictures_watch(
	short display_index,
	char const *replay_path,
	char *why,
	long why_size);

/* (the main menu, just opened: menu_functions.c) the map whose pictures
the game left the Map Manager for, or whose Theater shot was taken while it
had a picture (choose: which of the two to keep is to be asked), once: its
file name in name; FALSE for neither */
boolean map_pictures_return_take(
	char *name,
	long size,
	boolean *choose);

/* whether the last three shots asked for were not all taken (the map did
not load, or the Theater was left first) */
boolean map_pictures_shots_failed(
	void);

/* ---------- in a Theater (network_replay_playback.c) */

/* the frame taken as the picture of the level (level_name, its game's):
written as its Theater shot, and as its picture when it has none (else
which to keep is asked once the game is left: map_pictures_return_take). FALSE, said in
map_pictures_status, when it cannot be (not a Custom Edition map, or one
being taken) */
boolean map_pictures_take(
	char const *level_name);

/* the three shots being made: the camera for this frame, TRUE while they
are; and whether they are all taken (the Theater leaves) */
boolean map_pictures_shots_camera(
	real_point3d *position,
	real_vector3d *forward);
boolean map_pictures_shots_done(
	void);

/* the place a Theater with no recording starts at: one of the map's
players' starting places, at a player's eyes, facing as it faces. FALSE
for a map without any */
boolean map_pictures_start_camera(
	real_point3d *position,
	real *yaw);

/* whether the lines over the screen are hidden: a shot is being taken */
boolean map_pictures_hiding(
	void);

/* what was last done (a picture saved, or why not), for a few seconds after;
FALSE after them */
boolean map_pictures_status(
	wchar_t *text,
	long length);

/* ---------- the renderers' (which declare them themselves, in plain C
types: port/linux/src has no game headers) */

/* (at each present) whether the frame presented is to be read back */
int map_pictures_capture_wanted(
	void);

/* the frame read back: width by height pixels, pitch bytes from a row to
the next, the top row first, 8 bits a channel in blue, green, red order
(bgra) or red, green, blue; the alpha ignored */
void map_pictures_capture_take(
	unsigned char const *pixels,
	unsigned long width,
	unsigned long height,
	unsigned long pitch,
	int bgra);

#endif
