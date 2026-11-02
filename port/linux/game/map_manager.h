/*
MAP_MANAGER.H

The Map Manager: one Custom Edition map of the custom_maps folder, chosen
in a map list (its MANAGE MAP, or X or Y: menu_functions.c's "port map
manage"), moved to another of its folders (or one made for it), deleted,
given a description of its own (line by line, as the menus show it) and a
picture (map_pictures.h: three shots taken in the game, or one taken in the
Theater). menu_functions.c's "port maps" functions show its lists, a row
each, and the row chosen's details and picture.

The lists, each opened from the one before (B goes back up, and from the
first back to the map list):
	MAP           the map's FOLDER, DESCRIPTION, PICTURE and DELETE MAP
	DESCRIPTION   its description's lines, CLEAR DESCRIPTION
	MOVE          the folders it can be moved to, NEW FOLDER
	PICTURE       its picture, its shots to choose from, TAKE NEW SHOTS,
	              TAKE IN THEATER, DELETE PICTURE
	THEATER       EXPLORE THE MAP (no recording), the replays of the map
	COMPARE       a new shot or its picture, each shown as it is chosen:
	              which to keep (a shot chosen, or a Theater shot taken,
	              while it has a picture)

Only the custom_maps folder's maps are managed (not a Custom Edition
install's), and nothing is changed while a Custom Edition map is loaded.
*/

#ifndef __MAP_MANAGER_H
#define __MAP_MANAGER_H

/* ---------- constants */

/* what the menu does after a row is chosen (map_manager_choose) */
enum
{
	/* it stays, its rows as they are now */
	_map_manager_stays,
	/* the keyboard was opened for a name or a line (map_manager_poll takes
	what is typed) */
	_map_manager_typing,
	/* a game is loading (a Theater): the menus close with it */
	_map_manager_leaving,
	/* the map is gone (deleted): the screen goes back to the map list */
	_map_manager_closes,
};

/* ---------- structures */

struct bitmap_data;

/* ---------- prototypes/MAP_MANAGER.C */

/* the map the screen opens at next (its file name), at its MAP list, or
(pictures: the game left the screen for the map's pictures) its PICTURE
list, or (choosing: its Theater shot taken while it had a picture) asking
which of the two to keep; set before the screen is opened */
void map_manager_open_at(
	char const *map_name,
	boolean pictures,
	boolean choosing);

/* the screen opened (map_manager_open_at's map), or closed (its picture
let go) */
void map_manager_open(
	void);
void map_manager_close(
	void);

/* whether the map is there (else the screen has nothing to show) */
boolean map_manager_present(
	void);

/* each frame the screen is shown, before its rows are: the maps' folder
looked at again when it has changed, a list left whose map or folder is no
longer there, and what was typed taken */
void map_manager_poll(
	void);

/* the list shown (an index of its own, which changes as lists are opened),
how many rows it has, and the first shown and the one chosen (the screen's
to keep) */
short map_manager_list(
	void);
short map_manager_count(
	void);
short *map_manager_first(
	void);
short *map_manager_chosen(
	void);

/* a row's name and state (UTF-8 text) */
void map_manager_row(
	short row,
	char *name,
	long name_size,
	char *state,
	long state_size);

/* the row chosen's details: its title and its text, the last thing done
first */
void map_manager_details(
	short row,
	char *title,
	long title_size,
	char *text,
	long text_size);

/* A on a row: _map_manager_stays, _typing, _leaving or _closes */
short map_manager_choose(
	short row);

/* B: up a list; FALSE in the first (the screen leaves) */
boolean map_manager_back(
	void);

/* (ui_widget.c) the picture of the row chosen, over the screen's
map_picture widget; NULL for none */
struct bitmap_data *map_manager_menu_picture(
	void);

#endif
