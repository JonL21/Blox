/// @description Declare Local variables

image_speed = 0; // As each image of sprite is a different orientation, disable image animation

lock_cancels = global.lock_cancels; // How many successful moves/rotations can delay block lock
lockdown = false; // Flag to indicate solidying process
last_move = successful_move.none; // The last successful movement of the block, for T-Spin Checker

das = 0; // Counter for Delayed Auto Shift
arr = 0; // Counter for Auto Repeat Rate
sdd = 0; // Soft Drop Delay

// Precharge das if holding left/right
if keyboard_check(global.C_right) das = global.shift_delay;
else if keyboard_check(global.C_left) das = -global.shift_delay;

cleared_lines = 0; // Number of lines cleared after this block is placed
all_clear = false;
tspin_type = tspin_check.none; // Checks what type of T-Spin
drop_points = 0; // Hard-drop points
tile_pos = array_create(4); // Positions of each tile of block
ghost_block_id = noone; // The ghost block attached to this block
hd = false; // Hard drop indicator for visual effects

emitter = part_emitter_create(global.par_sys); // Emitter for hard drop/line clear particle effects
lockdown_alpha = 1;
lockdown_colour = c_white;