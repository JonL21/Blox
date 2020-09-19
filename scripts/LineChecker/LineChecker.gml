/// @func LineChecker()
/// @desc Checks for line clears
function LineChecker() {

	var update = false; // If any present line clears

	// Particle-related
	var emit_regions; // Y pos of each particle pos

	// Get y-pos of each row blocked was placed in
	var lines = ds_list_create();
	for (var i = 0; i < array_length_1d(tile_pos); i++)
		if ds_list_find_index(lines, tile_pos[i, 1]) == -1 
			ds_list_add(lines, tile_pos[i, 1]);

	// Check for cleared lines, clear lines on internal grid
	for (var i = 0, j = 0; i < ds_list_size(lines); i++) {
		var _y = (lines[| i] - board_id.border[3]) / global.tilesize + global.height;
	    // If no empty cells in row
	    if ds_grid_get_min(board_id.playfield, 0, _y, global.width - 1, _y) != -1 {
	        update = true;
	        emit_regions[cleared_lines++] = lines[| i]; // Particle related
	        ds_grid_set_region(board_id.playfield, 0, _y, global.width - 1, _y, -1); // Clear row
	    }
	}
	ds_list_destroy(lines);

	// Check for T-Spins
	tspin_type = TSpinChecker();

	// Check for All Clear
	if ds_grid_get_max(board_id.playfield, 0, 0, global.width - 1, global.height * 2 - 1) == -1
		all_clear = true;

	if hd {
		with board_id {
			offy = update ? (other.all_clear ? 25 : 15) : 5;
			alarm[6] = 1;
		}	
	}

	if update {
		// Increment combo
	    board_id.combo++;
	
	    // Create emitters, spawning line clear particles
		if global.particle_effects {
			for (var j = 0; j < cleared_lines; j++) {
				part_particles_create(global.par_sys, board_id.x + board_id.offx, 
					emit_regions[j] + (global.tilesize / 2) + board_id.offy, 
				global.p_line, 1);
			}
		}
		
		//audio_sound_pitch(snd_combo, power(2, (cleared_lines == 4 ? 8 : 1) /12));
		if all_clear
			audio_play_sound(snd_all_clear, 1, false);
		else if board_id.b2b && (tspin_type != tspin_check.none || cleared_lines == 4)
			audio_play_sound(snd_b2b, 1, false);
		else if tspin_type != tspin_check.none
			audio_play_sound(snd_spin_clear, 1, false);
		else 
			audio_play_sound(cleared_lines == 4 ? snd_high : snd_low, 1, false);
	    alarm[3] = global.clear_delay;
	}
	else BlockWarpUp();
}