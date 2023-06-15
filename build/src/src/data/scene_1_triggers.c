#pragma bank 255

// Scene: Home
// Triggers

#include "gbs_types.h"
#include "data/trigger_0_interact.h"

BANKREF(scene_1_triggers)

const struct trigger_t scene_1_triggers[] = {
    {
        // Trigger 1,
        .x = 5,
        .y = 17,
        .width = 2,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_0_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    }
};
