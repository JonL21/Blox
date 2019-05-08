/// @description Go!
instance_activate_object(o_spawner);
with o_spawner {
	// Drop a block
	alarm[1] = 5;
}
instance_destroy();