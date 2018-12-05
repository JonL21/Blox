/// @description  DoSomething() based on menu_select

switch menu_select {
    case 0:
        room_goto(game);
        break;
	case 2:
		game_end();
    default:
        break;
}

