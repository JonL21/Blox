/// @description  Local Variables

// Available Options
menu_options[0] = "Marathon";
menu_options[1] = "Ultra";
menu_options[2] = "Sprint";
menu_options[3] = "Zen";
menu_options[4] = "Master";
menu_options[5] = "Options";
menu_options[6] = "Quit";

// Option Descriptions
menu_explain[0] = "Clear 150 lines while trying to get the highest score";
menu_explain[1] = "Rank up as many points as possible within 2 minutes";
menu_explain[2] = "Clear 40 lines as fast as possible";
menu_explain[3] = "Play at your own pace with no speed increases";
menu_explain[4] = "Coming Soon(?)";
menu_explain[5] = "Change settings";
menu_explain[6] = "Exit the game";

// Menu Cursor and Scaling
menu_select = 0;
scales = array_create(array_length_1d(menu_options), 0.5);
scales[menu_select] = 1;

// Create scoreboards and set positionings
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
