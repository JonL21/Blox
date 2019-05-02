/// @description  Auto Falling
if solid exit;

if place_free(x, y + 32) 
	y += 32;

alarm_set(0, 60);