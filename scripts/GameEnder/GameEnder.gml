/// @description GameEnder
switch global.game_mode {
	case mode.marathon: // Clear 150 lines with as high a score ASAP
		if global.stats[? "Total Lines Cleared"] >= 150 {
			global.game_over = true;
			global.game_clear = true;
			instance_create(room_width / 2, room_height / 2, o_pause);
		}
		break;
	case mode.ultra: // Get the highest score within 3 minutes
		if global.timer <= 0 {
			global.game_over = true;
			global.game_clear = true;
			instance_create(room_width / 2, room_height / 2, o_pause);
		}
		break;
	case mode.sprint: // Clear 40 lines ASAP
		if global.stats[? "Total Lines Cleared"] >= 40 {
			global.game_over = true;
			global.game_clear = true;
			instance_create(room_width / 2, room_height / 2, o_pause);
		}
		break;
}