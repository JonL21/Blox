/// @description Spawn Game Over HUD
with instance_create_layer(room_width / 2, room_height / 2, "Instances", o_game_over) {
	board_id = other.id;	
}