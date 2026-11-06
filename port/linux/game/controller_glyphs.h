#ifndef CONTROLLER_GLYPHS_H
#define CONTROLLER_GLYPHS_H

#include "math/integer_math.h"

struct bitmap_data;
struct icon_hud_element_definition;
short controller_glyph_style(void);
/* a slot's artwork in a style, for what draws its own prompts (Forge): the
bitmap, and the visible part of its 512 by 512 picture (left, top, right,
bottom). FALSE: the style has none, and the caller draws its own */
boolean controller_glyph_lookup(short style, short slot, struct bitmap_data **bitmap, short bounds[4]);
boolean controller_glyph_draw(short style, short index,
    struct icon_hud_element_definition const *icon, rectangle2d *cursor, pixel32 color);
void controller_glyphs_dispose(void);

#endif
