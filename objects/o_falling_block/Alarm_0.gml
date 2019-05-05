/// @description  Auto Falling
if solid exit;

// Check if topped off
if CC(0, 0) {
	global.game_over = true;
	alarm_set(1, 0);
	exit;
}
if !CC(0, 32) {
    y += 32;
	script_execute(UpdateTilePositions())
}
else {
    lockdown = true;
    alarm_set(1, lock_delay);
}
alarm_set(0, 60 / global.fall_speed);