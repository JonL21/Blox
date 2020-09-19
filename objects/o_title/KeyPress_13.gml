/// @description DoSomething() based on menu_select

if global.show_options exit;
switch menu_select {
    case 0:
		global.game_mode = mode.marathon;
        if keyboard_check(vk_shift)
			global.endless = true;
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
		global.game_mode = mode.zen;
		room_goto(game);
		break;
	case 5:
		alarm[0] = 1;
		break;
	case 6:
		game_end();
    default:
        break;
}
audio_play_sound(snd_confirm, 1, false);