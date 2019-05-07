/// @description Ready?
alarm_set(0, 1.5 * game_get_speed(gamespeed_fps));
instance_deactivate_object(o_spawner);