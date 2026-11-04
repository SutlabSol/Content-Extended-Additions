/* Forge (port/forge, Content Extended's) where it is not built: only the
Windows build compiles port/forge (tools/windows_build.py's FORGE_DIR), but the
game's own code asks whether a Forge session is on and for Forge's tag preview
in every build. These weak definitions answer "no" and "none" there; where
port/forge is linked, its own (forge_runtime_tags.c's) take their place. */

#include <stddef.h>

struct bitmap_data;

__attribute__((weak)) int g_forge_session_enabled = 0;

__attribute__((weak)) struct bitmap_data *forge_tag_preview_get_bitmap(void)
{
	return NULL;
}
