/// @func CalculateSpeed()
/// @desc Calculates how many rows to move down
function CalculateSpeed() {

	/* Gravity
		This formula borrowed from Tetris Worlds:
			(0.8-((Level-1)*0.007))^(Level-1)
		ensures there is a steady difficulty increase.
	
		Level 1     1 row per second
		Level 5     1 row per 0.355 seconds
		Level 10    1 row per 0.064 seconds
		Level 15+   1 row per 0.007 seconds
	*/

	var result = power(0.8 - ( (board_id.level - 1) * 0.007), (board_id.level - 1)) * game_get_speed(gamespeed_fps)

	return result > 1 ? result : 1;
}
