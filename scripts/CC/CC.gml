// CC

/*
    Returns true if collision or not within borders
*/
var xx = argument0;
var yy = argument1;

// Check for collision
for (var i = 0; i < array_length_1d(tile_pos); i++) {
	var tile = tile_pos[i];
	var tilex = tile[0];
	var tiley = tile[1];
	
	if (tilex + xx) < global.border[0] return true;
	if (tilex + xx) > global.border[1] return true;
	if (tiley + yy) > global.border[2] return true;

	if position_meeting(tilex + xx, tile[1] + yy, o_grid) return true;
	if position_meeting(tilex + xx, tile[1] + yy, o_square) return true;	
	
	// Check if tile is within playfield
	switch (rectangle_in_rectangle(tilex + xx, tiley + yy, tilex + 32 + xx, tiley + 32 + yy, global.border[0], global.border[3] - 64, global.border[1], global.border[2]))
	{
		case 0: return true;
		case 1: break;
		case 2: return true;
	}
}
return false;
