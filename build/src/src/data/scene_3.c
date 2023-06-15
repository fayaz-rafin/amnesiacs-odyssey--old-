#pragma bank 255

// Scene: The Pond

#include "gbs_types.h"
#include "data/bg_thepond.h"
#include "data/scene_3_collisions.h"
#include "data/palette_0.h"
#include "data/palette_1.h"
#include "data/sprite_actor3animated.h"
#include "data/scene_3_triggers.h"
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
    .player_sprite = TO_FAR_PTR_T(sprite_actor3animated),
    .n_actors = 0,
    .n_triggers = 1,
    .n_sprites = 0,
    .n_projectiles = 0,
    .triggers = TO_FAR_PTR_T(scene_3_triggers),
    .script_init = TO_FAR_PTR_T(scene_3_init)
};
