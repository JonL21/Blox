/// @description Submit Top Score

ranking = checkFinalScore(global.game_mode == mode.sprint ? timer : points);
if ranking > -1 && !global.endless {
	initials = "AAA";
	with instance_create_depth(room_width / 2, room_height / 2, -10, o_initialer)
		board_id = other.id;
}
else alarm[2] = 1;