#pragma bank 255
// SpriteSheet: oldman

#include "gbs_types.h"
#include "data/sprite_oldman_tileset.h"

BANKREF(sprite_oldman)

#define SPRITE_4_STATE_DEFAULT 0
#define SPRITE_4_STATE_WALK 0
#define SPRITE_4_STATE_RAFTEMPTY 0
#define SPRITE_4_STATE_ATTACK 0
#define SPRITE_4_STATE_RAFT_MOVEMENT 0
#define SPRITE_4_STATE_HEARTBLINK 0
#define SPRITE_4_STATE_HALF_HEART 0
#define SPRITE_4_STATE_HALF_HEART_BLINK 0
#define SPRITE_4_STATE_NPC2 0
#define SPRITE_4_STATE_NPC3 0
#define SPRITE_4_STATE_NPC4 0
#define SPRITE_4_STATE_NPC5 0
#define SPRITE_4_STATE_NPC6 0
#define SPRITE_4_STATE_EXPLOSION 0

const metasprite_t sprite_oldman_metasprite_0[]  = {
    { 0, 8, 14, 0 }, { 0, -8, 14, 32 },
    {metasprite_end}
};

const metasprite_t sprite_oldman_metasprite_1[]  = {
    { 0, 8, 16, 0 }, { 0, -8, 16, 32 },
    {metasprite_end}
};

const metasprite_t sprite_oldman_metasprite_2[]  = {
    { 0, 8, 0, 0 }, { 0, -8, 2, 0 },
    {metasprite_end}
};

const metasprite_t sprite_oldman_metasprite_3[]  = {
    { 0, 8, 4, 0 }, { 0, -8, 6, 0 },
    {metasprite_end}
};

const metasprite_t sprite_oldman_metasprite_4[]  = {
    { 0, 8, 8, 0 }, { 0, -8, 8, 32 },
    {metasprite_end}
};

const metasprite_t sprite_oldman_metasprite_5[]  = {
    { 0, 8, 10, 0 }, { 0, -8, 12, 0 },
    {metasprite_end}
};

const metasprite_t sprite_oldman_metasprite_6[]  = {
    { 0, 0, 0, 32 }, { 0, 8, 2, 32 },
    {metasprite_end}
};

const metasprite_t sprite_oldman_metasprite_7[]  = {
    { 0, 0, 4, 32 }, { 0, 8, 6, 32 },
    {metasprite_end}
};

const metasprite_t * const sprite_oldman_metasprites[] = {
    sprite_oldman_metasprite_0,
    sprite_oldman_metasprite_1,
    sprite_oldman_metasprite_2,
    sprite_oldman_metasprite_3,
    sprite_oldman_metasprite_4,
    sprite_oldman_metasprite_5,
    sprite_oldman_metasprite_6,
    sprite_oldman_metasprite_7
};

const struct animation_t sprite_oldman_animations[] = {
    {
        .start = 0,
        .end = 1
    },
    {
        .start = 2,
        .end = 3
    },
    {
        .start = 4,
        .end = 5
    },
    {
        .start = 6,
        .end = 7
    },
    {
        .start = 0,
        .end = 1
    },
    {
        .start = 2,
        .end = 3
    },
    {
        .start = 4,
        .end = 5
    },
    {
        .start = 6,
        .end = 7
    }
};

const UWORD sprite_oldman_animations_lookup[] = {
    SPRITE_4_STATE_DEFAULT
};

const struct spritesheet_t sprite_oldman = {
    .n_metasprites = 8,
    .emote_origin = {
        .x = 0,
        .y = -16
    },
    .metasprites = sprite_oldman_metasprites,
    .animations = sprite_oldman_animations,
    .animations_lookup = sprite_oldman_animations_lookup,
    .bounds = {
        .left = 0,
        .bottom = 7,
        .right = 15,
        .top = -8
    },
    .tileset = TO_FAR_PTR_T(sprite_oldman_tileset),
    .cgb_tileset = { NULL, NULL }
};
