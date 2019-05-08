/// @func TSpinChecker(sprite_index, image_index, xpos, ypos, last_move, lines_cleared);
/// @desc Checks for T-Spins
/// @arg {id} sprite index the type of block 
/// @arg {id} image index the rotation state
/// @arg {Integer} x x origin of block
/// @arg {Integer} y y origin of block
/// @arg {Integer} last_move the last move
/// @arg {Integer} lines_cleared the number of lines cleared 

/*
    Criteria:
    1 - Last successful move was a rotation
    2 - Three of the four adjacent corners around of the t-block are occupied by a wall/block
    3 - BOTH corners directy adjacent to the "pointy end" of the t-block are occupied
    If above are true and 1/2/3 lines are cleared: classified as T-Spin Single/Double/Triple.
   
    FOR MINI:
    1 - Last successful move was a kick
    2 - One of the blocks directly adjacent to the "pointy end" of the t-block is open
    Only T-Spin Minis and T-Spin Mini Singles are possible.
    
    NOTE: The T-Spin triple acheived with a kick does NOT count as a mini, but an actual t-spin
    
    All T-Spins qualify for Back-to-Back combos alongside quadruples.
*/

if argument[0] == spr_T {
	// Count amount of occupied corners
    var occupied_corner = 0;
	var pox = argument[2];
	var poy = argument[3];
    if collision_point(pox - 32, poy - 32, o_square, false, false) || collision_point(pox - 32, poy - 32, o_grid, false, false) occupied_corner++; // Top left
    if collision_point(pox + 32, poy - 32, o_square, false, false) || collision_point(pox + 32, poy - 32, o_grid, false, false) occupied_corner++; // Top right
    if collision_point(pox - 32, poy + 32, o_square, false, false) || collision_point(pox - 32, poy + 32, o_grid, false, false) occupied_corner++; // Bottom left
    if collision_point(pox + 32, poy + 32, o_square, false, false) || collision_point(pox + 32, poy + 32, o_grid, false, false) occupied_corner++; // Bottom right
    if occupied_corner >= 3 {
		// Determine if corners adjacent to pointy end of t-block occupied
		var occupied_point = false;
		var move = argument[4];
		var img = argument[1];
		var cleared = argument[5];
		switch img {
	        case 0: // Top left and Top right
				if (collision_point(pox - 32, poy - 32, o_square, false, false) || collision_point(pox - 32, poy - 32, o_grid, false, false)) && 
					(collision_point(pox + 32, poy - 32, o_square, false, false) || collision_point(pox + 32, poy - 32, o_grid, false, false))
				occupied_point = true; break; 
	        case 1: // Top right and Bottom right 
				if (collision_point(pox + 32, poy - 32, o_square, false, false) || collision_point(pox + 32, poy - 32, o_grid, false, false)) && 
					(collision_point(pox + 32, poy + 32, o_square, false, false) || collision_point(pox + 32, poy + 32, o_grid, false, false))
				occupied_point = true; break; 
	        case 2: // Bottom left and Bottom right
				if (collision_point(pox - 32, poy + 32, o_square, false, false) || collision_point(pox - 32, poy + 32, o_grid, false, false)) && 
					(collision_point(pox + 32, poy + 32, o_square, false, false) || collision_point(pox + 32, poy + 32, o_grid, false, false))
				occupied_point = true; break;
	        case 3: // Top left and Bottom left
				if (collision_point(pox - 32, poy - 32, o_square, false, false) || collision_point(pox - 32, poy - 32, o_grid, false, false)) && 
					(collision_point(pox - 32, poy + 32, o_square, false, false) || collision_point(pox - 32, poy + 32, o_grid, false, false))
				occupied_point = true; break; 
		}
        if (move == successful_move.kick && occupied_point && cleared == 3)
			return tspin_check.tspin;
		else if ((move == successful_move.kick || move == successful_move.rotation) && occupied_point && cleared >= 1)
            return tspin_check.tspin;
        else if (move == successful_move.kick && cleared <= 1)
            return tspin_check.mini;
    }
}
return tspin_check.none;