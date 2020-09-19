/// @description Change Pause Menu if end game conditions met

if (board_id.game_over) {
	menu_options[1] = "Retry";
    menu_select = 1;
    scales[1] = 1;
	sb_clamp_low = board_id.border[1] + 180;
	sb = instance_create_depth(room_width + 256, board_id.border[3] + 140, -10, o_scoreboard);
	with sb {
		game_mode = global.game_mode;
		alarm[0] = 1;
	}
}
else {
	instance_deactivate_object(o_falling_block);
	instance_deactivate_object(o_ghost_block);
	instance_deactivate_object(o_callout);
}