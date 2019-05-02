/// @description Declare Local variables

// Sprite related
image_speed = 0;

// Technical
lock_delay = 20; // How many frames before block solidifies
lock_cancels = 15; // How many successful moves/rotations can delay block lock
lockdown = false; // Flag to prevent further movement

shift_delay = 14; // How many frames to hold left/right before block slides in desired direction
das = 0; // Counter to shift_delay

last_move = successful_move.none; // The last successful movement of the block

cleared_lines = 0; // Number of lines cleared after this block solidifies
tspin_type = tspin_check.none; // Checks what type of T-Spin 

hold_available = true; // Allow one use to hold block

// Visual
emitter = part_emitter_create(global.par_sys);