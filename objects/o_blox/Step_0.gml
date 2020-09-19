/// @description Adjust variables

rainbow_timer += 1 / room_speed;

// Slow speed when game is paused
if instance_exists(o_pause)
	speed = max(speed - 0.1, 1);
else if speed < fall_speed
	speed = min(speed + 0.1, fall_speed);

if rot_timer == 0 {
	direction = mean(direction, 270);
	hspeed = mean(hspeed, 0);
}
else
	rot_timer--;
	
if y > room_height + sprite_height instance_destroy();