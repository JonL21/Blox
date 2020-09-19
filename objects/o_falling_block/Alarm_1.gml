/// @description Lock block into place

solid = true; // Disable step event
if instance_exists(ghost_block_id)
	y = ghost_block_id.y; // Move block to final position
UpdateTilePositions();

// Hide block and destroy ghost block
instance_destroy(ghost_block_id);
visible = false;

// Lock-in particle effect
if hd && global.particle_effects {
	with o_blox {
		speed += 10;
		alarm[1] = 5;
	}
	var left = room_width; 
	var right = 0;
	var down = 0;
	var up = room_height;
	for (var i = 0; i < array_length_1d(tile_pos); i++) {
		if tile_pos[i, 0] < left left = tile_pos[i, 0];
		if tile_pos[i, 0] > right right = tile_pos[i, 0];
		if tile_pos[i, 1] < up up = tile_pos[i, 1];
		if tile_pos[i, 1] > down down = tile_pos[i, 1];
	}
	var xx = left;
	var w = (right - left) / global.tilesize + 1;
	repeat w {
		part_particles_create(global.par_sys, xx + board_id.offx, down + global.tilesize + board_id.offy, global.p_hard_drop, 1);
		xx += global.tilesize;
	};
	right += global.tilesize;
	part_emitter_region(global.par_sys, emitter, left, right, up, down, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(global.par_sys, emitter, global.p_spark, irandom_range(2, 6));
	part_emitter_region(global.par_sys, emitter, left, right, up, down, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(global.par_sys, emitter, global.p_blotch, irandom_range(1, 4));
	
	audio_play_sound(snd_hard_drop, 1, false);
}

// Record position of block on internal grid
for (var i = 0; i < array_length_1d(tile_pos); i++) {
	var tilex = tile_pos[i, 0];
	var tiley = tile_pos[i, 1];
	board_id.playfield[# tilemap_get_cell_x_at_pixel(board_id.playfield_map, tilex, tiley), 
		tilemap_get_cell_y_at_pixel(board_id.playfield_map, tilex, tiley)] = sprite_index;
		
	// Visual - Tile Map
	tilemap_set_at_pixel(board_id.playfield_map, sprite_index + 1, tilex, tiley)
}

alarm[2] = 1;