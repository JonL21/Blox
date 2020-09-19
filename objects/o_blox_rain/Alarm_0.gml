/// @description Spawn some blox

var amt = 1;
if board_id != -1 {
	var l = board_id.level;
	if l > 5 amt = 2
	else if l > 10 amt = 3;
	else if l > 14 amt = 4;
}

repeat amt {
	var _x = random_range(10, room_width - 10);
	var _col = choose(blox.I, blox.J, blox.O, blox.S, blox.Z, blox.L, blox.T);
	var _rot = irandom(3);
	var _scale = irandom_range(0.5, 1.1);
	var _speed = random_range(2, 6);
	if board_id != -1 {
		var spd = min(board_id.level * 1.5, 40);
		_speed = max(random_range(spd - 3, spd + 3), 2);
	}
	
	with instance_create_depth(_x, -64, depth, o_blox) {
		if other.board_id != -1
			board_id = other.board_id;
		sprite_index = _col;
		image_index = _rot;
		image_speed = 0;
		image_xscale = _scale;
		image_yscale = _scale;
		direction = 270;
		speed = _speed;
		fall_speed = _speed;
	}
}