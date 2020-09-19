/// @func LinePusher()
/// @desc Push lines down after lines are cleared
function LinePusher() {

	// Push lines in internal playfield
	for (var highest = ds_grid_height(board_id.playfield); highest >= 0; highest--) {
	    if ds_grid_get_max(board_id.playfield, 0, 0, global.width - 1, highest - 1) == -1 break;
	    while ds_grid_get_max(board_id.playfield, 0, highest, global.width - 1, highest) == -1
			ds_grid_set_grid_region(board_id.playfield, board_id.playfield, 
				0, 0, global.width - 1, highest - 1, 0, 1);
	}
	
	// Update visual playfield
	tilemap_clear(board_id.playfield_map, 0);
	for (var i = 0; i < ds_grid_height(board_id.playfield); i++) {
		for (var j = 0; j < ds_grid_width(board_id.playfield); j++) {
			tilemap_set(board_id.playfield_map, 
				board_id.playfield[# j,i] + 1, 
				j, i);
		}
	}
	BlockWarpUp();
}
