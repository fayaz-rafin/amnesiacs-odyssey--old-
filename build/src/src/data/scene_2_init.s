.module scene_2_init

.include "vm.i"
.include "data/game_globals.i"

.globl b_wait_frames, _wait_frames, _fade_frames_per_step

.area _CODE_255

.LOCAL_ACTOR = -4
.LOCAL_TMP1_WAIT_ARGS = -5

___bank_scene_2_init = 255
.globl ___bank_scene_2_init

_scene_2_init::
        VM_LOCK

        VM_RESERVE              5

        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 1

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_NPC6

        ; If Variable True
        VM_IF_CONST             .GT, VAR_S1A1_TALEKDTOCAVEMAN, 0, 1$, 0
        VM_JUMP                 2$
1$:
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 1

        ; Actor Set Position
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 1)/, 1920
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 2)/, 256
        VM_ACTOR_SET_POS        .LOCAL_ACTOR

2$:

        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 2
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

        ; Wait N Frames
        VM_SET_CONST            .LOCAL_TMP1_WAIT_ARGS, 1
        VM_INVOKE               b_wait_frames, _wait_frames, 0, .LOCAL_TMP1_WAIT_ARGS

        ; Fade In
        VM_SET_CONST_INT8       _fade_frames_per_step, 1
        VM_FADE_IN              1

        ; If Variable True
        VM_IF_CONST             .GT, VAR_OLDMANHASTALKED, 0, 3$, 0
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 2
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

        VM_JUMP                 4$
3$:
        ; Actor Activate
        VM_SET_CONST            .LOCAL_ACTOR, 2
        VM_ACTOR_ACTIVATE       .LOCAL_ACTOR

        ; If Variable True
        VM_IF_CONST             .GT, VAR_KITTYKATTALKED_, 0, 5$, 0
        ; Text Dialogue
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002DE\nFG\001\003\004\001\377\002\001Meow.."
        VM_OVERLAY_CLEAR        0, 0, 20, 4, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_OVERLAY_MOVE_TO      0, 14, .OVERLAY_IN_SPEED
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_OVERLAY_MOVE_TO      0, 18, .OVERLAY_OUT_SPEED
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT)/

        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 2

        ; Actor Move To
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 1)/, 2816
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 2)/, 4224
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 3)/, ^/(.ACTOR_ATTR_CHECK_COLL | .ACTOR_ATTR_H_FIRST)/
        VM_ACTOR_MOVE_TO        .LOCAL_ACTOR

        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 2
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

        ; Variable Set To True
        VM_SET_CONST            VAR_KITTYKATTALKED_, 1

        VM_JUMP                 6$
5$:
6$:

        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 2
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

4$:

        ; If Variable .LTE Value
        VM_IF_CONST             .LTE, VAR_PLAYERHP, 4, 7$, 0
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 3

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_DEFAULT

        VM_JUMP                 8$
7$:
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 3

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_HALF_HEART

8$:

        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 5

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_NPC4

        ; If Variable .LTE Value
        VM_IF_CONST             .LTE, VAR_PLAYERHP, 4, 9$, 0
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 7

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_DEFAULT

        VM_JUMP                 10$
9$:
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 7

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_HALF_HEART

10$:

        ; Call Script: Heart display
        VM_PUSH_CONST           3 ; Actor 2
        VM_PUSH_CONST           6 ; Actor 1
        VM_PUSH_CONST           7 ; Actor 0
        VM_CALL_FAR             ___bank_script_7, _script_7

        ; Input Script Attach
        VM_CONTEXT_PREPARE      3, ___bank_script_input_0, _script_input_0
        VM_INPUT_ATTACH         32, 3

        ; Stop Script
        VM_STOP
