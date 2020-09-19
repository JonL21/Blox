/// @func CC(x, y)
/// @desc Checks if moving block x, y units causes collision or out of bounds
/// @arg {Integer} x how many pixels to move horizontally
/// @arg {Integer} y how many pixels to move vertically
function CC(xx, yy) {
	// Cycle through each tile of block
	for (var i = 0; i < array_length_1d(tile_pos); i++) {
		var tilex = tile_pos[i, 0];
		var tiley = tile_pos[i, 1];
	
		// Check for out of bounds
		if (tilex + xx) < board_id.border[0] return true;
		if (tilex + xx) >= board_id.border[1] return true;
		if (tiley + yy) > board_id.border[2] return true;

		// Check for collision
		if tilemap_get_at_pixel(board_id.playfield_map, tilex + xx, tiley + yy) != 0 return true;
	}
	return false;
}

/// @func CC_Wall(x)
/// @desc Checks if moving block x units is out of bounds
/// @arg {Integer} x how many pixels to move horizontally
function CC_Wall(xx) {
	// Cycle through each tile of block
	for (var i = 0; i < array_length_1d(tile_pos); i++) {
		var tilex = tile_pos[i, 0];
	
		// Check for out of bounds
		if (tilex + xx) < board_id.border[0] return true;
		if (tilex + xx) >= board_id.border[1] return true;
	}
	return false;
}
