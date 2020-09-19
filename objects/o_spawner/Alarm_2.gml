/// @description Spawn Pause Menu
if instance_exists(o_initialer) || instance_exists(o_game_countdown) exit;
if !instance_exists(o_pause) {
	with instance_create_depth(room_width / 2, room_height / 2, -5, o_pause) {
		board_id = other.id;
		event_user(0);
	}
}