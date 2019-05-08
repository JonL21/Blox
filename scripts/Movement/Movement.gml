/// @func Movement()
/// @desc Moving, shifting, soft/hard drop logic

var frame_move = successful_move.none; // Used for lockdown system

// Reset charge for shifting
if keyboard_check_released(global.C_left) || keyboard_check_released(global.C_right)
	das = 0;

// Shift/Move Left
if keyboard_check(global.C_left) {
    das = max(das - 1, -shift_delay); // Charge das for left shift
	if (das == -shift_delay || keyboard_check_pressed(global.C_left)) && !CC(-32, 0) {
		x -= 32;
		UpdateTilePositions();
		last_move = successful_move.left_right;
		frame_move = successful_move.left_right;
	}
}
// Shift/Move Right
else if keyboard_check(global.C_right) {
    das = min(das + 1, shift_delay); // Charge das for right shift
    if (das == shift_delay || keyboard_check_pressed(global.C_right)) && !CC(32, 0) {
	    x += 32;
		UpdateTilePositions();
		last_move = successful_move.left_right;
		frame_move = successful_move.left_right;
	}
}
// Soft Drop
if keyboard_check(global.C_soft_drop) && !CC(0,  32) {
    y += 32;
	global.points += 1; // Each successful soft drop earns 1 point
	frame_move = successful_move.soft_drop;
	UpdateTilePositions();
}
// Hard Drop
if keyboard_check_pressed(global.C_hard_drop) {
	// Calculate distance for score, each unit is worth 2 points
	if alarm[1] != 0 {
		with o_ghost_block {
			other.drop_points += (y - other.y) / 16;	
		}
	    alarm[0] = -1;
	    alarm[1] = 1;
	}
}

if frame_move == successful_move.left_right
	|| frame_move == successful_move.soft_drop
{
	// Reset lock delay, decrement lock cancels
	if lockdown && lock_cancels != 0 {
		lock_cancels = max(lock_cancels - 1, 0);
		if !CC(0, 32) {
			lockdown = false;
			alarm[1] = -1;
			alarm[0] = CalculateSpeed();
		}
		else alarm[1] = lock_delay;
	}
	// Force block end
	else if lock_cancels == 0 alarm[1] = 1;
}