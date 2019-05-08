/// @description  DoSomething() based on menu_select
switch menu_select {
    case 0:
		global.game_mode = mode.marathon;
        room_goto(game);
        break;
	case 1:
		global.game_mode = mode.ultra;
		room_goto(game);
        break;
	case 2:
		global.game_mode = mode.sprint;
		room_goto(game);
        break;
	case 3:
		instance_create_depth(x, y, 1, o_options);
		instance_destroy();
		break;
	case 4:
		game_end();
    default:
        break;
}