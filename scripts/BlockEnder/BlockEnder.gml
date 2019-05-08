/// @func BlockEnder()
/// @desc Update each position of each tile of block

// Hide block and ghost block
with o_ghost_block { visible = false; instance_destroy(); }
visible = false;

// Lock-in particle effect
part_emitter_region(global.par_sys, emitter, x - 16, x + 16, y - 16, y + 16, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.par_sys, emitter, global.p_spark, irandom_range(3, 8));

// Record position of block on internal grid
for (var i = 0; i < array_length_1d(tile_pos); i++) {
	var tile = tile_pos[i];
	var tilex = tile[0];
	var tiley = tile[1];
	global.playfield[# ((tilex - global.border[0]) / 32), ((tiley - global.border[3]) / 32 + global.height)] = sprite_index;
	with instance_create_layer(tilex, tiley, "Instances", o_square) image_index = other.sprite_index;
}

if !global.game_over alarm[2] = 1;