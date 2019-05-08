/// @description Auto Falling
if !CC(0, 32) {
    y += 32;
	UpdateTilePositions();
	alarm[0] = CalculateSpeed();
}