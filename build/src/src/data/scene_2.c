#pragma bank 255

// Scene: Village

#include "gbs_types.h"
#include "data/bg_village.h"
#include "data/scene_2_collisions.h"
#include "data/palette_0.h"
#include "data/palette_1.h"
#include "data/sprite_actor3animated.h"
#include "data/scene_2_triggers.h"
#include "data/scene_2_init.h"

BANKREF(scene_2)

const struct scene_t scene_2 = {
    .width = 32,
    .height = 32,
    .type = SCENE_TYPE_TOPDOWN,
    .background = TO_FAR_PTR_T(bg_village),
    .collisions = TO_FAR_PTR_T(scene_2_collisions),
    .parallax_rows = {
        PARALLAX_STEP(0,0,0)
    },
    .palette = TO_FAR_PTR_T(palette_0),
    .sprite_palette = TO_FAR_PTR_T(palette_1),
    .reserve_tiles = 0,
    .player_sprite = TO_FAR_PTR_T(sprite_actor3animated),
    .n_actors = 0,
    .n_triggers = 2,
    .n_sprites = 0,
    .n_projectiles = 0,
    .triggers = TO_FAR_PTR_T(scene_2_triggers),
    .script_init = TO_FAR_PTR_T(scene_2_init)
};
