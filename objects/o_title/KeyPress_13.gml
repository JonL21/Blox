/// @description  DoSomething() based on menu_select

enum mode {
	marathon = 0,
	ultra = 1,
	sprint = 2,
}

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
		game_end();
    default:
        break;
}