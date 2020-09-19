/// @description Destroy
instance_destroy();
with board_id {
	if game_clear alarm[3] = 1;
	else alarm[2] = 1;
}