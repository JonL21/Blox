/// @description Menu

menu_options[0] = "Resume";
menu_options[1] = "Restart";
menu_options[2] = "Main Menu";

menu_select = 0;
scales = array_create(array_length_1d(menu_options), 0.5);

if (global.game_over) {
	menu_options[1] = "Play Again";
    menu_select = 1;
    scales[1] = 1;
	sb_clamp_low = x + 384;
	sb = instance_create_depth(room_width + 256, y - 160, -10, o_scoreboard);
	with sb {
		game_mode = global.game_mode;
		alarm[0] = 1;
	}
}
else {
    menu_select = 0;
    scales[0] = 1;
}

instance_deactivate_object(o_spawner);
instance_deactivate_object(o_falling_block);
instance_deactivate_object(o_ghost_block);
instance_deactivate_object(o_callout);