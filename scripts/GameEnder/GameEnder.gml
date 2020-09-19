/// @description GameEnder
function GameEnder() {
	if game_clear exit;
	switch global.game_mode {
		case mode.marathon: // Clear 150 (999 for endless) lines with as high a score ASAP
			if global.endless {
				if stats[? "Total Lines Cleared"] >= 999 {
					game_over = true;
					game_clear = true;
					alarm[5] = 1;
				}
			}
			else if (stats[? "Total Lines Cleared"] >= 150) {
				game_over = true;
				game_clear = true;
				alarm[5] = 1;
			}
			break;
		case mode.ultra: // Get the highest score within 3 minutes
			if timer == 0 {
				game_over = true;
				game_clear = true;
				alarm[5] = 1;
			}
			break;
		case mode.sprint: // Clear 40 lines ASAP
			if stats[? "Total Lines Cleared"] >= 40 {
				game_over = true;
				game_clear = true;
				alarm[5] = 1;
			}
			break;
	}
}