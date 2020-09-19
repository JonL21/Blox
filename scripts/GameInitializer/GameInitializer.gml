/// @func GameInitializer()
/// @desc Declare playfield dimensions, variables shared by all instances belonging to this board
function GameInitializer() {

	// Define borders; 0 - Left, 1 - Right, 2 - Floor, 3 - Ceiling
	border[0] = x - global.tilesize * global.width / 2;		// Left
	border[1] = x + global.tilesize * global.width / 2;		// Right
	border[2] = y + global.tilesize * (global.height + 2);	// Floor, extra two rows for block spawning area
	border[3] = y + global.tilesize * 2;					// Ceiling

	// Initialize Tile Layer that serves as background of playfield
	tilelayer = layer_create(500);
	bg_map = layer_tilemap_create(tilelayer, border[0], border[3], bg_grid_tileset, global.width, global.height);
	for (var i = 0; i < global.height + 2; i++) {
	    for (var j = 0; j < global.width; j++) {
	        tilemap_set(bg_map, 1, j, i);
	    }
	}
	layer_set_visible(tilelayer, false);

	// Initialize Tile Layer that serves as visual playfield
	playfield_layer = layer_create(150);
	playfield_map = layer_tilemap_create(playfield_layer, border[0], border[3] - global.tilesize * 20,
		tileset_sqr, global.width, global.height * 2);
	layer_set_visible(playfield_layer, false);

	// Initialize internal playfield
	playfield = ds_grid_create(global.width, global.height * 2);
	ds_grid_clear(playfield, -1);

	// Statistics
	points = 0;
	level = 1; // Visual indicator for fall speed
	next_level = global.to_next_level;
	timer = 0; // How much time has elasped
	if global.game_mode == mode.ultra // Ultra has specified time limit
		timer = 2 * game_get_speed(gamespeed_fps);
	
	combo = -1; // How many consecutive line clears
	b2b = false; // Chance indicator for consecutive T-Spins/Quadruples
	game_over = false; // If game is over
	game_clear = false; // If game mode end condition cleared
	
	hold_available = true; // If a block can be swapped from hold
	held_block = -1; // Initialize block holder
	
	stats = ds_map_create();
	strstats = // For ensuring order
	["Total Lines Cleared",
	"Singles","Doubles","Triples","Quadruples","All Clears",
	"T-Spins", "T-Spin Minis", "T-Spin Mini Singles", "T-Spin Mini Doubles",
	"T-Spin Singles", "T-Spin Doubles", "T-Spin Triples",
	"Back to Backs"]
	for (var i = 0; i < array_length_1d(strstats); i++) {
		stats[? strstats[i]] = 0;
	}

	// Intialize block spawner
	bag = ds_list_create();

	// Visual Helper Variables
	score_base_pos = [border[0] - 16, border[2] - 32]; // Where score/stats start displaying from
	callouts_base_pos = [border[0] - 16, border[3] + 128]; // Where callouts start displaying from

	// Generate a bag
	alarm[0] = 1;

}

/// draw_sprite_clip(sprite, subimg, x, y, clipx, clipy, clipw, cliph)
function draw_sprite_clip(sprite, subimg, x, y, clipx, clipy, clipw, cliph) {
	var s = argument0;
	var sw = sprite_get_width(s);
	var sh = sprite_get_height(s);
	var sx = sprite_get_xoffset(s);
	var sy = sprite_get_yoffset(s);
	var si = argument1;
	var _x = argument2;
	var _y = argument3;
	var cx1 = argument4;
	var cy1 = argument5;
	var cx2 = cx1 + argument6;
	var cy2 = cy1 + argument7;
	//
	var bx1 = _x - sprite_get_xoffset(s);
	var by1 = _y - sprite_get_yoffset(s);
	var bx2 = bx1 + sprite_get_width(s);
	var by2 = by1 + sprite_get_height(s);
	//
	switch (rectangle_in_rectangle(bx1, by1, bx2, by2, cx1, cy1, cx2, cy2)) {
	case 1:
	    draw_sprite(s, si, _x, _y);
	    return true;
	case 2:
	    var lx1 = max(0, cx1 - bx1);
	    var ly1 = max(0, cy1 - by1);
	    var lx2 = sw + min(0, cx2 - bx2);
	    var ly2 = sh + min(0, cy2 - by2);
	    draw_sprite_part(s, si, lx1, ly1, lx2 - lx1, ly2 - ly1, _x + lx1 - sx, _y + ly1 - sy);
	    return true;
	}
	return false;
}

/// draw_sprite_clip_ext(sprite, subimg, x, y, xscale, yscale, color, alpha, rx, ry, rw, rh)
function draw_sprite_clip_ext(sprite, subimg, x, y, xscale, yscale, color, alpha, rx, ry, rw, rh) {
	var s = argument0;
	var sw = sprite_get_width(s);
	var sh = sprite_get_height(s);
	var sx = sprite_get_xoffset(s);
	var sy = sprite_get_yoffset(s);
	var si = argument1;
	var _x = argument2;
	var _y = argument3;
	var mx = argument4;
	var my = argument5;
	var sc = argument6;
	var sa = argument7;
	var cx1 = argument8;
	var cy1 = argument9;
	var cx2 = cx1 + argument10;
	var cy2 = cy1 + argument11;
	//
	var bx1 = _x - sprite_get_xoffset(s) * mx;
	var by1 = _y - sprite_get_yoffset(s) * my;
	var bx2 = bx1 + sprite_get_width(s) * mx;
	var by2 = by1 + sprite_get_height(s) * my;
	//
	switch (rectangle_in_rectangle(bx1, by1, bx2, by2, cx1, cy1, cx2, cy2)) {
	case 1:
	    draw_sprite_ext(s, si, _x, _y, mx, my, 0, sc, sa);
	    return true;
	case 2:
	    if (mx == 0 || my == 0) return true;
	    var lx1 = max(0, cx1 - bx1) / mx;
	    var ly1 = max(0, cy1 - by1) / my;
	    var lx2 = sw + min(0, cx2 - bx2) / mx;
	    var ly2 = sh + min(0, cy2 - by2) / my;
	    draw_sprite_part_ext(s, si, lx1, ly1, lx2 - lx1, ly2 - ly1,
	        _x + (lx1 - sx) * mx, _y + (ly1 - sy) * my,
	        mx, my, sc, sa);
	    return true;
	}
	return false;
}