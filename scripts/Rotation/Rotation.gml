/// @func Rotation()
/// @desc Rotation logic
function Rotation() {

	if solid exit;

	// Rotate by changing image index
	var orig_state = image_index;
	var next_state = image_index;
	if keyboard_check_pressed(global.C_rotate_left) {
	    if next_state - 1 < 0 next_state = 3; // Cycle to last index if at first index
	    else next_state--;
	}
	else if keyboard_check_pressed(global.C_rotate_right) {
	    if next_state + 1 > 3 next_state = 0;
	    else next_state++;
	}
	else exit;

	// "Rotate" block and update tile positions
	image_index = next_state;
	UpdateTilePositions();

	/*
		If collision detected, attempt wall kick
	    ROTATION GUIDE
	    0 - Spawn state
	    L - State resulting from CCW rotation from 0
	    R - State resulting from CW rotation from 0
	    2 - 180 rotation from 0
    
	    NOTE: Translations on y-axis are reversed as room origin starts at top left corner.
	*/

	var kicked = false;

	// Kick Translations for I
	var kickI0R = [[0,0],[-2,0],[1,1],[-2,-1],[1,2]];
	var kickIR2 = [[0,0],[-1,0],[2,0],[-1,2],[2,-1]];
	var kickI2L = [[0,0],[2,0],[-1,0],[2,1],[-1,-2]];
	var kickIL0 = [[0,0],[1,0],[-2,0],[1,-2],[2,1]];

	// Translation Offsets for J/L/S/T/Z
	var off02 = [[0,0],[0,0],[0,0],[0,0],[0,0]];
	var offR = [[0,0],[1,0],[1,-1],[0,2],[1,2]];
	var offL = [[0,0],[-1,0],[-1,-1],[0,2],[-1,2]];

	// Kicks for CCW
	if CC(0, 0) && keyboard_check_pressed(global.C_rotate_left) {
	    // Wall kicks for I block
	    if sprite_index == blox.I {
	        switch image_index {
	            case 0: // R -> 0
					kicked = KickI(kickI0R, true); break;
	            case 1: // 2 -> R
					kicked = KickI(kickIR2, true); break;
	            case 2: // L -> 2
					kicked = KickI(kickI2L, true); break;
	            case 3: // 0 -> L
					kicked = KickI(kickIL0, true); break;
	        }
	    }
	    // Wall kicks for J/L/S/T/Z blocks
	    else if sprite_index != blox.O {
	        switch image_index {
	            case 0: // R -> 0
	                kicked = Kick(offR, off02); break;
	            case 1: // 2 -> R
	                kicked = Kick(off02, offR); break;
	            case 2: // L -> 2
	                kicked = Kick(offL, off02);  break;
	            case 3: // 0 -> L
	                kicked = Kick(off02, offL); break;
	        }
	    }
		if !kicked next_state = orig_state;
	}
	else if CC(0, 0) && keyboard_check_pressed(global.C_rotate_right) {
	    // Wall kicks for I block
	    if sprite_index == blox.I {
	        switch image_index {
	            case 0: // L -> 0
					kicked = KickI(kickIL0, false);
	                break;
	            case 1: // 0 -> R
					kicked = KickI(kickI0R, false);
	                break;
	            case 2: // R -> 2
					kicked = KickI(kickIR2, false);
	                break;
	            case 3: // 2 -> L
					kicked = KickI(kickI2L, false);
	                break;
	        }
	    }
	    // Wall kicks for J/L/S/T/Z blocks
	    else if sprite_index != blox.O {
	        switch image_index {
	            case 0: // L -> 0
					kicked = Kick(offL, off02);
	                break;
	            case 1: // 0 -> R
					kicked = Kick(off02, offR);
	                break;
	            case 2: // R -> 2
					kicked = Kick(offR, off02);
	                break;
	            case 3: // 2 -> L
					kicked = Kick(off02, offL);
	                break;
	        }
	    }
		if !kicked next_state = orig_state;
	}

	var frame_rotation = successful_move.none; // Used for lockdown system

	if kicked {
		last_move = successful_move.kick;
		frame_rotation = successful_move.kick;
		UpdateTilePositions();
	}
	else if orig_state != next_state {
	    last_move = successful_move.rotation;
		frame_rotation = successful_move.rotation;
	}
	else {
		image_index = orig_state;
		UpdateTilePositions();
	}

	if frame_rotation == successful_move.rotation || frame_rotation = successful_move.kick {
		
		if TSpinChecker() != tspin_check.none  {
			if keyboard_check_pressed(global.C_rotate_left) {
				with o_blox alarm[2] = 1;
				with board_id {
					offx = 10;
					alarm[8] = 3;
					if alarm[7] alarm[7] = -1;
				}
			}
			else if keyboard_check_pressed(global.C_rotate_right) {
				with o_blox alarm[3] = 1;
				with board_id {
					offx = -10;
					alarm[7] = 3;
					if alarm[8] alarm[8] = -1;
				}
			}
			audio_play_sound(snd_spin, 1, false);
		}
		
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