#pragma bank 255

// Scene: Home
// Actors

#include "gbs_types.h"
#include "data/sprite_oldman.h"
#include "data/actor_1_update.h"
#include "data/actor_1_interact.h"

BANKREF(scene_1_actors)

const struct actor_t scene_1_actors[] = {
    {
        // Old man,
        .pos = {
            .x = 112 * 16,
            .y = 48 * 16
        },
        .bounds = {
            .left = 0,
            .bottom = 7,
            .right = 15,
            .top = -8
        },
        .dir = DIR_LEFT,
        .sprite = TO_FAR_PTR_T(sprite_oldman),
        .move_speed = 16,
        .anim_tick = 15,
        .pinned = FALSE,
        .persistent = FALSE,
        .collision_group = COLLISION_GROUP_NONE,
        .collision_enabled = TRUE,
        .script_update = TO_FAR_PTR_T(actor_1_update),
        .script = TO_FAR_PTR_T(actor_1_interact),
        .reserve_tiles = 0
    }
};
