/// @func Movement()
/// @desc Moving, shifting, soft/hard drop logic
function Movement() {

	if solid exit;

	var frame_move = successful_move.none; // Used for lockdown system

	// Reset charge for shifting
	if keyboard_check_released(global.C_left) || keyboard_check_released(global.C_right) {
		das = 0;
		arr = 0;
		with board_id alarm[9] = 1;
	}
	
	// Shift/Move Left
	if keyboard_check(global.C_left) && !CC(-global.tilesize, 0) {
	    das = max(das - 1, -global.shift_delay); // Charge das for left shift
		arr = max(0, arr - 1);
		if (das == -global.shift_delay && arr == 0)
			|| keyboard_check_pressed(global.C_left) {
			x -= global.tilesize;
			UpdateTilePositions();
			last_move = successful_move.left_right;
			frame_move = successful_move.left_right;
			arr = global.repeat_delay;
			audio_play_sound(snd_tick, 1, false);
		}
	}
	// Shift/Move Right
	else if keyboard_check(global.C_right) && !CC(global.tilesize, 0) {
	    das = min(das + 1, global.shift_delay); // Charge das for right shift
		arr = max(0, arr - 1);
	    if (das == global.shift_delay && arr == 0)
			|| keyboard_check_pressed(global.C_right) {
		    x += global.tilesize;
			UpdateTilePositions();
			last_move = successful_move.left_right;
			frame_move = successful_move.left_right;
			arr = global.repeat_delay;
			audio_play_sound(snd_tick, 1, false);
		}
	}
	else if keyboard_check(global.C_left) && CC_Wall(-global.tilesize) {
		board_id.offx = mean(board_id.offx, -10);
	}
	else if keyboard_check(global.C_right) && CC_Wall(global.tilesize) {
		board_id.offx = mean(board_id.offx, 10);
	}
	
	// Soft Drop
	if keyboard_check(global.C_soft_drop) && !CC(0,  global.tilesize) {
		sdd = max(0, sdd - 1);
		if sdd == 0 {
		    y += global.tilesize;
			board_id.points += 1; // Each successful soft drop earns 1 point
			frame_move = successful_move.soft_drop;
			UpdateTilePositions();
			sdd = round(CalculateSpeed() / global.drop_factor);
			if sdd < 1 sdd = 1;
			audio_play_sound(snd_fall, 1, false);
		}
	}
	// Hard Drop
	if keyboard_check_pressed(global.C_hard_drop) {
		// Calculate distance for score, each unit is worth 2 points
		if alarm[1] != 0 && ghost_block_id != noone {
			hd = true;
			drop_points += (ghost_block_id.y - y) / (global.tilesize / 2);			
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
			lockdown_alpha = 0;
			if !CC(0, global.tilesize) {
				lockdown_alpha = 1;
				lockdown = false;
				alarm[1] = -1;
				alarm[0] = board_id.level < 15 ? CalculateSpeed() : 1;
			}
			else alarm[1] = global.lock_delay;
		}
		// Force block end
		else if lockdown && lock_cancels == 0 alarm[1] = 1;
	}


}