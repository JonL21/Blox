/// @func LineChecker()
/// @desc Checks for line clears

var update = false; // If any present line clears
var filled_lines; // Y pos of rows that need to be cleared

// Particle-related
var emit_regions; // Y pos of each particle pos

// Get y-pos of each row blocked was placed in
var lines = ds_list_create();
for (var i = 0; i < array_length_1d(tile_pos); i++) {
	var tile = tile_pos[i];
	if ds_list_find_index(lines, tile[1]) == -1 
		ds_list_add(lines, tile[1]);
}
// Check for cleared lines, clear lines on internal grid
for (var i = 0, j = 0; i < ds_list_size(lines); i++) {
	var _y = (lines[| i] - global.border[3]) / 32 + global.height;
    // If no empty cells in row
    if ds_grid_get_min(global.playfield, 0, _y, global.width - 1, _y) != -1 {
        update = true;
        // Particle related
        emit_regions[cleared_lines++] = _y;
        ds_grid_set_region(global.playfield, 0, _y, global.width - 1, _y, -1); // Clear row
        filled_lines[j++] = lines[| i];
    }
}

// Check for T-Spins
tspin_type = TSpinChecker(sprite_index, image_index, x, y, last_move, cleared_lines);

if update {
	// Clear line clears on visual grid
	for (var i = 0; i < array_length_1d(filled_lines); i++)
	    with o_square
			if y == filled_lines[i] instance_destroy();
	
	// Increment combo
    global.combo++;
	
    // Create emitters, spawning line clear particles
    for (var j = 0; j < cleared_lines; j++) {
        var e = part_emitter_create(global.par_sys);
        part_emitter_region(global.par_sys, e, 
        (global.border[1] - global.border[0]) / 2 + global.border[0], 
        (global.border[1] - global.border[0]) / 2 + global.border[0], 
        (emit_regions[j] - global.height) * 32 + global.border[3] + 16, 
        (emit_regions[j] - global.height) * 32 + global.border[3] + 16, ps_shape_line, ps_distr_linear);
        part_emitter_burst(global.par_sys, e, global.p_line, 4);
    }
    alarm[3] = 8;
}
else alarm[4] = 1;