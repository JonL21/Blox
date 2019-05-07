/// @description Declare Local variables

// Sprite related
image_speed = 0;

lock_delay = global.lock_delay; // How many frames before block solidifies
lock_cancels = global.lock_cancels; // How many successful moves/rotations can delay block lock
lockdown = false; // Flag to indicate solidying process

shift_delay = 14; // How many frames to hold left/right before block slides in desired direction
das = 0; // Counter to shift_delay

last_move = successful_move.none; // The last successful movement of the block
cleared_lines = 0; // Number of lines cleared after this block solidifies
tspin_type = tspin_check.none; // Checks what type of T-Spin
drop_points = 0; // hard-drop points
tile_pos = array_create(4); // Positions of each tile of block

emitter = part_emitter_create(global.par_sys); // Line clear visual