/// @description  Local variables

// Sprite related
image_speed = 0;

if place_free(x, y)
	exit;

// Start falling
alarm_set(0, 60);
