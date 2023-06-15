#pragma bank 255

// Background: home

#include "gbs_types.h"
#include "data/bg_home_tileset.h"
#include "data/bg_home_tilemap.h"

BANKREF(bg_home)

const struct background_t bg_home = {
    .width = 20,
    .height = 18,
    .tileset = TO_FAR_PTR_T(bg_home_tileset),
    .cgb_tileset = { NULL, NULL },
    .tilemap = TO_FAR_PTR_T(bg_home_tilemap),
    .cgb_tilemap_attr = { NULL, NULL }
};
