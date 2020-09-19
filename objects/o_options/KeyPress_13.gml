/// @description  DoSomething() based on menu_select

if !global.show_options exit;
if global.show_control_options exit;
if instance_exists(o_changeKeyBind) exit;
switch menu_select {
	case 5:
		alarm[1] = 1;
		break;
	case 6:
		alarm[4] = 1;
		break;
	case 7:
		alarm[2] = 1;
		break;
	case 8:
		alarm[3] = 1;
		break;
    default:
        break;
}
audio_play_sound(snd_confirm, 1, false);