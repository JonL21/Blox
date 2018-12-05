/// @description  Local variables

// Sprite related
image_speed = 0;

// Technical
lock_delay = 30; // How many frames before block solidifies
lock_cancels = 15; // How many successful moves/rotations can delay block lock
lockdown = false;

shift_delay = 14; // How many frames to hold left/right before block slides in desired direction
das = 0; // Counter to shift_delay

enum successful_move {
    none = -1,
    left_right = 0,
    soft_drop = 1,
    hard_drop = 2,
    rotation = 3,
    kick = 4
}

last_move = successful_move.none;

var lines; // The lines to tell LineChecker to check
cleared_lines = 0;

hold_available = true; // Allow one use to hold block

// Visual
emitter = part_emitter_create(global.par_sys);

// Start falling
alarm_set(0, 60);

