/// @description  DoSomething() based on menu_select

if !global.show_control_options exit;
if instance_exists(o_changeKeyBind) exit;
switch menu_select {
    case 0: case 1: case 2: case 3: case 4: case 5: case 6:
		instance_create_layer(x, y, "Instances", o_changeKeyBind);
		break;
	case 7:
		alarm[1] = 1;
		break;
	case 8:
		alarm[3] = 1;
		break;
    default:
        break;
}
audio_play_sound(snd_confirm, 1, false);