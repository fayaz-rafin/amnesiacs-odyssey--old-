#pragma bank 255

// Scene: The Pond
// Triggers

#include "gbs_types.h"
#include "data/trigger_3_interact.h"

BANKREF(scene_3_triggers)

const struct trigger_t scene_3_triggers[] = {
    {
        // Trigger 1,
        .x = 14,
        .y = 0,
        .width = 4,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_3_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    }
};
