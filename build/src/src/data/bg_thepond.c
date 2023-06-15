#pragma bank 255

// Background: thepond

#include "gbs_types.h"
#include "data/bg_thepond_tileset.h"
#include "data/bg_thepond_tilemap.h"

BANKREF(bg_thepond)

const struct background_t bg_thepond = {
    .width = 32,
    .height = 32,
    .tileset = TO_FAR_PTR_T(bg_thepond_tileset),
    .cgb_tileset = { NULL, NULL },
    .tilemap = TO_FAR_PTR_T(bg_thepond_tilemap),
    .cgb_tilemap_attr = { NULL, NULL }
};
