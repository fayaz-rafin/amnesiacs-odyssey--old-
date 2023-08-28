.module scene_1_init

.include "vm.i"
.include "data/game_globals.i"

.globl b_wait_frames, _wait_frames, _fade_frames_per_step, b_camera_shake_frames, _camera_shake_frames

.area _CODE_255

.LOCAL_ACTOR = -4
.LOCAL_TMP1_WAIT_ARGS = -4
.LOCAL_TMP2_CAMERA_SHAKE_ARGS = -4

___bank_scene_1_init = 255
.globl ___bank_scene_1_init

_scene_1_init::
        VM_LOCK

        VM_RESERVE              4

        ; If Variable True
        VM_IF_CONST             .GT, VAR_KATRANOFF_HOME, 0, 1$, 0
        ; Actor Activate
        VM_SET_CONST            .LOCAL_ACTOR, 2
        VM_ACTOR_ACTIVATE       .LOCAL_ACTOR

        VM_JUMP                 2$
1$:
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 2
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 1

        ; Actor Set Position
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 1)/, 896
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 2)/, 896
        VM_ACTOR_SET_POS        .LOCAL_ACTOR

        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 1

        ; Actor Set Direction
        VM_ACTOR_SET_DIR        .LOCAL_ACTOR, .DIR_RIGHT

2$:

        ; If Variable .LTE Value
        VM_IF_CONST             .LTE, VAR_PLAYERHP, 4, 3$, 0
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 3

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_DEFAULT

        VM_JUMP                 4$
3$:
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 3

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_HALF_HEART

4$:

        ; If Variable .LTE Value
        VM_IF_CONST             .LTE, VAR_PLAYERHP, 12, 5$, 0
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 4

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_DEFAULT

        VM_JUMP                 6$
5$:
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 4

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_HALF_HEART

6$:

        ; If Variable .LTE Value
        VM_IF_CONST             .LTE, VAR_PLAYERHP, 20, 7$, 0
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 5

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_DEFAULT

        VM_JUMP                 8$
7$:
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 5

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_HALF_HEART

8$:

        ; Call Script: Heart display
        VM_PUSH_CONST           3 ; Actor 2
        VM_PUSH_CONST           4 ; Actor 1
        VM_PUSH_CONST           5 ; Actor 0
        VM_CALL_FAR             ___bank_script_7, _script_7

        ; Wait N Frames
        VM_SET_CONST            .LOCAL_TMP1_WAIT_ARGS, 1
        VM_INVOKE               b_wait_frames, _wait_frames, 0, .LOCAL_TMP1_WAIT_ARGS

        ; Fade In
        VM_SET_CONST_INT8       _fade_frames_per_step, 1
        VM_FADE_IN              1

        ; If Variable True
        VM_IF_CONST             .GT, VAR_S0_PLAYER_INITIAL_LOAD, 0, 9$, 0
        ; Camera Shake
        VM_SET_CONST            .LOCAL_TMP2_CAMERA_SHAKE_ARGS, 36
        VM_SET_CONST            ^/(.LOCAL_TMP2_CAMERA_SHAKE_ARGS + 1)/, .CAMERA_SHAKE_X
        VM_INVOKE               b_camera_shake_frames, _camera_shake_frames, 0, .LOCAL_TMP2_CAMERA_SHAKE_ARGS

        ; Variable Set To True
        VM_SET_CONST            VAR_S0_PLAYER_INITIAL_LOAD, 1

        ; Text Dialogue
        VM_LOAD_TEXT            0
        .asciz ". . ."
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_OVERLAY_MOVE_TO      0, 13, .OVERLAY_IN_SPEED
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "Huh... Where am I?\n"
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "Why cant i\nremember\nanything?"
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_OVERLAY_MOVE_TO      0, 18, .OVERLAY_OUT_SPEED
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT)/

        ; Call Script: Heart display
        VM_PUSH_CONST           3 ; Actor 2
        VM_PUSH_CONST           4 ; Actor 1
        VM_PUSH_CONST           5 ; Actor 0
        VM_CALL_FAR             ___bank_script_7, _script_7

        VM_JUMP                 10$
9$:
10$:

        ; If Variable True
        VM_IF_CONST             .GT, VAR_PLAYERVARIABLESSET, 0, 11$, 0
        ; Call Script: Setting Player Variables
        VM_PUSH_CONST           3 ; Actor 2
        VM_PUSH_CONST           4 ; Actor 1
        VM_PUSH_CONST           5 ; Actor 0
        VM_CALL_FAR             ___bank_script_2, _script_2

        VM_JUMP                 12$
11$:
12$:

        ; Stop Script
        VM_STOP
