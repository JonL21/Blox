/// @description DoSomething()

switch menu_select {
	case 0:
		instance_activate_all();
		instance_destroy();
		break;
	case 1:
		room_restart();
		break;
	case 2:
		room_goto(title);
		break;
}
audio_play_sound(snd_confirm, 1, false);