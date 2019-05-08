/// @description Destroy
instance_destroy();
with o_spawner {
	if global.game_clear alarm[3] = 1;
	else alarm[2] = 1;
}