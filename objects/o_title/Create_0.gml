/// @description  Local Variables

y = 288;

// Available Options
menu_options[0] = "Marathon";
menu_options[1] = "Ultra";
menu_options[2] = "Sprint";
menu_options[3] = "Options";
menu_options[4] = "Quit";

menu_select = 0;
scales = array_create(array_length_1d(menu_options), 0.5);
scales[menu_select] = 1;

sb_clamp_low = x + 384;
sb_clamp_high = room_width + 256;
sb_mar = instance_create_depth(room_width + 256, y - 128, 1, o_scoreboard);
with sb_mar {
	game_mode = mode.marathon;
	alarm[0] = 1;
}
sb_ult = instance_create_depth(room_width + 256, y - 128, 2, o_scoreboard);
with sb_ult {
	game_mode = mode.ultra;
	alarm[0] = 1;
}
sb_spr = instance_create_depth(room_width + 256, y - 128, 3, o_scoreboard);
with sb_spr {
	game_mode = mode.sprint;
	alarm[0] = 1;
}
