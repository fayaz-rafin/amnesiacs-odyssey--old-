#pragma bank 255

// Scene: Village
// Triggers

#include "gbs_types.h"
#include "data/trigger_1_interact.h"
#include "data/trigger_2_interact.h"
#include "data/trigger_4_interact.h"
#include "data/trigger_10_interact.h"
#include "data/trigger_18_interact.h"

BANKREF(scene_2_triggers)

const struct trigger_t scene_2_triggers[] = {
    {
        // Trigger 1,
        .x = 30,
        .y = 23,
        .width = 2,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_1_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    },
    {
        // Trigger 2,
        .x = 24,
        .y = 47,
        .width = 3,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_2_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    },
    {
        // Trigger 3,
        .x = 9,
        .y = 39,
        .width = 2,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_4_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    },
    {
        // Trigger 4,
        .x = 36,
        .y = 33,
        .width = 2,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_10_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    },
    {
        // Trigger 5,
        .x = 16,
        .y = 26,
        .width = 2,
        .height = 1,
        .script = TO_FAR_PTR_T(trigger_18_interact),
        .script_flags = TRIGGER_HAS_ENTER_SCRIPT
    }
};
