/// @description Detect Key Press
if keyboard_check_pressed(vk_anykey) {
	// Prevent overlappping key binds
	switch target_keybind {
		case 0:	
			switch (keyboard_key) {
				case global.C_right: case global.C_soft_drop:
				case global.C_hard_drop: case global.C_hold: case global.C_rotate_left:
				case global.C_rotate_right:
					exit;
				default:
					break;
			} break;
		case 1:	
			switch (keyboard_key) {
				case global.C_left: case global.C_soft_drop:
				case global.C_hard_drop: case global.C_hold: case global.C_rotate_left:
				case global.C_right:
					exit;
				default:
					break;
			} break;
		case 2:	
			switch (keyboard_key) {
				case global.C_left: case global.C_right: case global.C_hard_drop: 
				case global.C_hold: case global.C_rotate_left: case global.C_rotate_right:
					exit;
				default:
					break;
			} break;
		case 3:	
			switch (keyboard_key) {
				case global.C_left: case global.C_right: case global.C_soft_drop:
				case global.C_hold: case global.C_rotate_left: case global.C_rotate_right:
					exit;
				default:
					break;
			} break;
		case 4:	
			switch (keyboard_key) {
				case global.C_left: case global.C_right: case global.C_soft_drop:
				case global.C_hard_drop: case global.C_rotate_left: case global.C_rotate_right:
					exit;
				default:
					break;
			} break;
		case 5:	
			switch (keyboard_key) {
				case global.C_left: case global.C_right: case global.C_soft_drop:
				case global.C_hard_drop: case global.C_hold: case global.C_rotate_right:
					exit;
				default:
					break;
			} break;
		case 6:	
			switch (keyboard_key) {
				case global.C_left: case global.C_right: case global.C_soft_drop:
				case global.C_hard_drop: case global.C_hold: case global.C_rotate_left:
					exit;
				default:
					break;
			} break;
	}
	
	// Only let keys that can be converted to string to be bound
	var key_str = KeyToString(keyboard_key);
	if string_length(key_str) == 0 exit;
	
	// Set keybind
	switch target_keybind {
		case 0: global.C_left = keyboard_key; break;
		case 1:	global.C_right = keyboard_key; break;
		case 2:	global.C_soft_drop = keyboard_key; break;
		case 3:	global.C_hard_drop = keyboard_key; break;
		case 4:	global.C_hold = keyboard_key; break;
		case 5: global.C_rotate_left = keyboard_key; break;
		case 6:	global.C_rotate_right = keyboard_key; break;
	}
	
	o_controls.alarm[2] = 1;
	o_controls.alarm[0] = 1;
	instance_destroy();
}