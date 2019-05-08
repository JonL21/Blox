/// @description Spawn some blox

if instance_number(o_blox) >= 300 exit;

var _x = irandom_range(1, 10) * irandom_range(room_width / 10 - 10, room_width / 10 + 10) + irandom_range(-35, 15);
var _col = choose(blox.I, blox.J, blox.O, blox.S, blox.Z, blox.L, blox.T);
var _rot = irandom(3);
var _speed = random_range(10, 15);
with instance_create_depth(_x, - 64, 250, o_blox) {
	sprite_index = _col;
	image_index = _rot;
	fall_speed = _speed;
	alarm[1] = 1;
}

alarm[0] = irandom_range(5, 10);