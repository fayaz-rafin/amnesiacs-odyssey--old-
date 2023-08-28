#pragma bank 255

// Scene: The Pond

#include "gbs_types.h"
#include "data/bg_thepond.h"
#include "data/scene_3_collisions.h"
#include "data/palette_0.h"
#include "data/palette_1.h"
#include "data/sprite_actor3animated2.h"
#include "data/scene_3_actors.h"
#include "data/scene_3_triggers.h"
#include "data/scene_3_sprites.h"
#include "data/scene_3_projectiles.h"
#include "data/scene_3_init.h"

BANKREF(scene_3)

const struct scene_t scene_3 = {
    .width = 32,
    .height = 32,
    .type = SCENE_TYPE_TOPDOWN,
    .background = TO_FAR_PTR_T(bg_thepond),
    .collisions = TO_FAR_PTR_T(scene_3_collisions),
    .parallax_rows = {
        PARALLAX_STEP(0,0,0)
    },
    .palette = TO_FAR_PTR_T(palette_0),
    .sprite_palette = TO_FAR_PTR_T(palette_1),
    .reserve_tiles = 0,
    .player_sprite = TO_FAR_PTR_T(sprite_actor3animated2),
    .n_actors = 8,
    .n_triggers = 5,
    .n_sprites = 7,
    .n_projectiles = 1,
    .actors = TO_FAR_PTR_T(scene_3_actors),
    .triggers = TO_FAR_PTR_T(scene_3_triggers),
    .sprites = TO_FAR_PTR_T(scene_3_sprites),
    .projectiles = TO_FAR_PTR_T(scene_3_projectiles),
    .script_init = TO_FAR_PTR_T(scene_3_init)
};
