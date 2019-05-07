/// @description Check for Out of Focus/OS paused
if os_is_paused() 
	if !instance_exists(o_pause) instance_create_layer(room_width / 2, room_height / 2, "Instances", o_pause);

if !global.game_over {
	if global.game_mode == mode.ultra 
		global.timer -= 1 / game_get_speed(gamespeed_fps);
	else
		global.timer += 1 / game_get_speed(gamespeed_fps);
}