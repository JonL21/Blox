/// @func TSpinChecker()
/// @desc Checks for T-Spins
function TSpinChecker() {

	/*
	    Criteria:
	    1 - Last successful move was a rotation
	    2 - Three of the four adjacent corners around of the t-block are occupied by a wall/block
	    3 - BOTH corners directy adjacent to the "pointy end" of the t-block are occupied
	    If above are true and 1/2/3 lines are cleared: classified as T-Spin Single/Double/Triple.
   
	    FOR MINI:
	    1 - Last successful move was a kick
	    2 - One of the blocks directly adjacent to the "pointy end" of the t-block is open
	    Only T-Spin Minis and T-Spin Mini Singles/Doubles are possible.
    
	    NOTE: The T-Spin triple acheived with a kick does NOT count as a mini, but an actual t-spin
    
	    All T-Spins qualify for Back-to-Back combos alongside quadruples.
	*/

	if sprite_index == blox.T {
		// Count amount of occupied corners
		var ts = global.tilesize;
	    var occupied_corner = 0;
		if tilemap_get_at_pixel(board_id.playfield_map, x - ts, y - ts) != 0 occupied_corner++;
		if tilemap_get_at_pixel(board_id.playfield_map, x + ts, y - ts) != 0 occupied_corner++;
		if tilemap_get_at_pixel(board_id.playfield_map, x - ts, y + ts) != 0 occupied_corner++;
		if tilemap_get_at_pixel(board_id.playfield_map, x + ts, y + ts) != 0 occupied_corner++;
	    if occupied_corner >= 3 {
			// Determine if corners adjacent to pointy end of t-block occupied
			var occupied_point = false;
			switch image_index {
		        case 0: // Top left and Top right
					if tilemap_get_at_pixel(board_id.playfield_map, x - ts, y - ts) != 0 &&
						tilemap_get_at_pixel(board_id.playfield_map, x + ts, y - ts) != 0
					occupied_point = true; break; 
		        case 1: // Top right and Bottom right 
					if tilemap_get_at_pixel(board_id.playfield_map, x + ts, y - ts) != 0 &&
						tilemap_get_at_pixel(board_id.playfield_map, x + ts, y + ts) != 0
					occupied_point = true; break; 
		        case 2: // Bottom left and Bottom right
					if tilemap_get_at_pixel(board_id.playfield_map, x - ts, y + ts) != 0 &&
						tilemap_get_at_pixel(board_id.playfield_map, x + ts, y + ts) != 0
					occupied_point = true; break;
		        case 3: // Top left and Bottom left
					if tilemap_get_at_pixel(board_id.playfield_map, x - ts, y - ts) != 0 &&
						tilemap_get_at_pixel(board_id.playfield_map, x - ts, y + ts) != 0
					occupied_point = true; break; 
			}
	        // T-Spin Single/Double/Triple
	        if ((last_move == successful_move.kick || last_move == successful_move.rotation) 
				&& occupied_point && cleared_lines >= 1)
	            return tspin_check.tspin;
	        // T-Spin Mini [Single/Double]
	        else if (last_move == successful_move.kick && cleared_lines <= 2)
	            return tspin_check.mini;
	        // T-Spin
	        else if ((last_move == successful_move.kick || last_move == successful_move.rotation) 
				&& occupied_point && cleared_lines < 1)
	            return tspin_check.tspin;
		    }
	}
	return tspin_check.none;
}
