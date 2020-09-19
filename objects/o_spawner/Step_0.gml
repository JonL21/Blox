/// @description Check if Out of Focus and Increment/Decrement Timer
if game_over exit;

if os_is_paused() alarm[2] = 1;

if !instance_exists(o_pause) && !instance_exists(o_game_countdown) {
	// Countdown
	if global.game_mode == mode.ultra
		timer = max(timer - 1 / game_get_speed(gamespeed_fps), 0);
	// Count up
	else 
		timer += 1 / game_get_speed(gamespeed_fps);
	
	if !instance_exists(b)
		alarm[1] = 1;
}