#pragma bank 255

// Background: village

#include "gbs_types.h"
#include "data/bg_village_tileset.h"
#include "data/bg_village_tilemap.h"

BANKREF(bg_village)

const struct background_t bg_village = {
    .width = 32,
    .height = 32,
    .tileset = TO_FAR_PTR_T(bg_village_tileset),
    .cgb_tileset = { NULL, NULL },
    .tilemap = TO_FAR_PTR_T(bg_village_tilemap),
    .cgb_tilemap_attr = { NULL, NULL }
};
