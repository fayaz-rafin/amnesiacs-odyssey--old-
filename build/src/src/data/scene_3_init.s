.module scene_3_init

.include "vm.i"
.include "data/game_globals.i"

.globl b_wait_frames, _wait_frames, _fade_frames_per_step

.area _CODE_255

.LOCAL_ACTOR = -4
.LOCAL_TMP1_WAIT_ARGS = -5
.LOCAL_TMP2_WAIT_ARGS = -5
.LOCAL_TMP3_WAIT_ARGS = -5

___bank_scene_3_init = 255
.globl ___bank_scene_3_init

_scene_3_init::
        VM_LOCK

        VM_RESERVE              5

        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 2

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_NPC5

        ; If Variable .LTE Value
        VM_IF_CONST             .LTE, VAR_PLAYERHP, 4, 1$, 0
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 3

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_DEFAULT

        VM_JUMP                 2$
1$:
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 3

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_HALF_HEART

2$:

        ; If Variable .LTE Value
        VM_IF_CONST             .LTE, VAR_PLAYERHP, 12, 3$, 0
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 4

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_DEFAULT

        VM_JUMP                 4$
3$:
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 4

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_HALF_HEART

4$:

        ; If Variable .LTE Value
        VM_IF_CONST             .LTE, VAR_PLAYERHP, 20, 5$, 0
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 5

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_DEFAULT

        VM_JUMP                 6$
5$:
        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 5

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_HALF_HEART

6$:

        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 6

        ; Actor Set Animation State
        VM_ACTOR_SET_ANIM_SET   .LOCAL_ACTOR, STATE_RAFTEMPTY

        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 7
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

        ; Wait N Frames
        VM_SET_CONST            .LOCAL_TMP1_WAIT_ARGS, 1
        VM_INVOKE               b_wait_frames, _wait_frames, 0, .LOCAL_TMP1_WAIT_ARGS

        ; Fade In
        VM_SET_CONST_INT8       _fade_frames_per_step, 1
        VM_FADE_IN              1

        ; If Variable True
        VM_IF_CONST             .GT, VAR_OLDMANHASTALKED, 0, 7$, 0
        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 7
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

        VM_JUMP                 8$
7$:
        ; Actor Activate
        VM_SET_CONST            .LOCAL_ACTOR, 7
        VM_ACTOR_ACTIVATE       .LOCAL_ACTOR

        ; If Variable True
        VM_IF_CONST             .GT, VAR_KITTYKATTALKEDPONDSCENE, 0, 9$, 0
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
        VM_SET_CONST            .LOCAL_ACTOR, 7

        ; Actor Move To
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 1)/, 4096
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 2)/, 512
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 3)/, ^/(.ACTOR_ATTR_CHECK_COLL | .ACTOR_ATTR_H_FIRST)/
        VM_ACTOR_MOVE_TO        .LOCAL_ACTOR

        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 7
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

        ; Variable Set To True
        VM_SET_CONST            VAR_KITTYKATTALKEDPONDSCENE, 1

        VM_JUMP                 10$
9$:
10$:

        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 7
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

8$:

        ; Variable Set To False
        VM_SET_CONST            VAR_CUTSCENE3, 0

        ; Call Script: Heart display
        VM_PUSH_CONST           3 ; Actor 2
        VM_PUSH_CONST           4 ; Actor 1
        VM_PUSH_CONST           5 ; Actor 0
        VM_CALL_FAR             ___bank_script_7, _script_7

        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 8
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

        ; Input Script Attach
        VM_CONTEXT_PREPARE      3, ___bank_script_input_1, _script_input_1
        VM_INPUT_ATTACH         32, ^/(3 | .OVERRIDE_DEFAULT)/

        ; If Variable True
        VM_IF_CONST             .GT, VAR_CUTSCENE2, 0, 11$, 0
        ; Variable Set To False
        VM_SET_CONST            VAR_CUTSCENE2, 0

        VM_JUMP                 12$
11$:
        ; Actor Activate
        VM_SET_CONST            .LOCAL_ACTOR, 8
        VM_ACTOR_ACTIVATE       .LOCAL_ACTOR

        ; Actor Activate
        VM_SET_CONST            .LOCAL_ACTOR, 6
        VM_ACTOR_ACTIVATE       .LOCAL_ACTOR

        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 8

        ; Actor Set Position
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 1)/, 2432
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 2)/, 1536
        VM_ACTOR_SET_POS        .LOCAL_ACTOR

        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 8

        ; Actor Set Direction
        VM_ACTOR_SET_DIR        .LOCAL_ACTOR, .DIR_LEFT

        ; Text Dialogue
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001Well, i gathered\nas much resource"
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_OVERLAY_MOVE_TO      0, 13, .OVERLAY_IN_SPEED
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001as i could."
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001Here's a raft."
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001It aint much,\nbut it's honest\nboat."
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001It's just like\nold man bart\nsaid"
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001follow the seas\ndown south."
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001and you should \nbe able reach \nthe island."
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_OVERLAY_MOVE_TO      0, 18, .OVERLAY_OUT_SPEED
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT)/

        ; Text Dialogue
        VM_LOAD_TEXT            0
        .asciz "This raft isnt big\nenough for the both\nof us"
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_OVERLAY_MOVE_TO      0, 13, .OVERLAY_IN_SPEED
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "Where's yours?"
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_OVERLAY_MOVE_TO      0, 18, .OVERLAY_OUT_SPEED
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT)/

        ; Wait N Frames
        VM_SET_CONST            .LOCAL_TMP2_WAIT_ARGS, 30
        VM_INVOKE               b_wait_frames, _wait_frames, 0, .LOCAL_TMP2_WAIT_ARGS

        ; Text Dialogue
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001I think i'll\nstay back,"
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_OVERLAY_MOVE_TO      0, 13, .OVERLAY_IN_SPEED
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001I'll make sure\nto search for any\nremaining creeper"
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001And i'll hunt \nthem down."
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001You're on your\nown from here."
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "\001\001\002\002LM\nNO\001\003\004\001\377\002\001Goodluck, \nfriend."
        VM_OVERLAY_CLEAR        0, 0, 20, 5, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_OVERLAY_MOVE_TO      0, 18, .OVERLAY_OUT_SPEED
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT)/

        ; Wait N Frames
        VM_SET_CONST            .LOCAL_TMP3_WAIT_ARGS, 30
        VM_INVOKE               b_wait_frames, _wait_frames, 0, .LOCAL_TMP3_WAIT_ARGS

        ; Text Dialogue
        VM_LOAD_TEXT            0
        .asciz "Thanks, Steve.\n"
        VM_OVERLAY_CLEAR        0, 0, 20, 4, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_OVERLAY_MOVE_TO      0, 14, .OVERLAY_IN_SPEED
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_LOAD_TEXT            0
        .asciz "I'll do my best\nto stay alive."
        VM_OVERLAY_CLEAR        0, 0, 20, 4, .UI_COLOR_WHITE, ^/(.UI_AUTO_SCROLL | .UI_DRAW_FRAME)/
        VM_DISPLAY_TEXT
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT | .UI_WAIT_BTN_A)/
        VM_OVERLAY_MOVE_TO      0, 18, .OVERLAY_OUT_SPEED
        VM_OVERLAY_WAIT         .UI_MODAL, ^/(.UI_WAIT_WINDOW | .UI_WAIT_TEXT)/

        ; Actor Set Active
        VM_SET_CONST            .LOCAL_ACTOR, 8

        ; Actor Move To
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 1)/, 1920
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 2)/, 128
        VM_SET_CONST            ^/(.LOCAL_ACTOR + 3)/, ^/(.ACTOR_ATTR_CHECK_COLL | .ACTOR_ATTR_H_FIRST)/
        VM_ACTOR_MOVE_TO        .LOCAL_ACTOR

        ; Actor Deactivate
        VM_SET_CONST            .LOCAL_ACTOR, 8
        VM_ACTOR_DEACTIVATE     .LOCAL_ACTOR

        ; Variable Set To True
        VM_SET_CONST            VAR_CUTSCENE3, 1

        ; Variable Set To False
        VM_SET_CONST            VAR_CUTSCENE2, 0

12$:

        ; Stop Script
        VM_STOP
