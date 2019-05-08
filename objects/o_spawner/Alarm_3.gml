/// @description Submit Top Score

ranking = checkFinalScore(global.game_mode == mode.sprint ? global.timer : global.points);
if ranking > -1 {
	initials = "AAA";
	instance_create_depth(room_width / 2, room_height / 2, -10, o_initialer);
}
else alarm[2] = 1;