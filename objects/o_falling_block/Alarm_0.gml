/// @description  Auto Falling
if !CC(0, 32) {
    y += 32;
	script_execute(UpdateTilePositions())
	alarm_set(0, CalculateSpeed());
}