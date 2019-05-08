/// @description Check if Out of Focus and Increment/Decrement Timer
if os_is_paused() alarm[2] = 1;

if !global.game_over {
	// Countdown
	if global.game_mode == mode.ultra
		global.timer = max(global.timer - 1 / game_get_speed(gamespeed_fps), 0);
	// Count up
	else 
		global.timer += 1 / game_get_speed(gamespeed_fps);
}