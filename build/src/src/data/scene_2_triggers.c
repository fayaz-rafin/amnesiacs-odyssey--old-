#pragma bank 255

// Scene: Village
// Triggers

#include "gbs_types.h"
#include "data/trigger_1_interact.h"
#include "data/trigger_2_interact.h"

BANKREF(scene_2_triggers)

const struct trigger_t scene_2_triggers[] = {
    {
        // Trigger 1,
        .x = 22,
        .y = 15,
        .width = 2,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_1_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    },
    {
        // Trigger 2,
        .x = 15,
        .y = 31,
        .width = 3,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_2_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    }
};
