#pragma bank 255

// Scene: The Pond
// Triggers

#include "gbs_types.h"
#include "data/trigger_3_interact.h"
#include "data/trigger_5_interact.h"
#include "data/trigger_12_interact.h"
#include "data/trigger_13_interact.h"
#include "data/trigger_15_interact.h"

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
    },
    {
        // Trigger 2,
        .x = 31,
        .y = 2,
        .width = 1,
        .height = 3,
        .script = TO_FAR_PTR_T(trigger_5_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    },
    {
        // Trigger 3,
        .x = 16,
        .y = 13,
        .width = 2,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_12_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    },
    {
        // Trigger 4,
        .x = 0,
        .y = 31,
        .width = 32,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_13_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    },
    {
        // Trigger 5,
        .x = 0,
        .y = 30,
        .width = 32,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_15_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    }
};
