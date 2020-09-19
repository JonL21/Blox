/// @description  Go down one option

if !global.show_control_options exit;
if instance_exists(o_changeKeyBind) exit;
if menu_select + 1 == array_length_1d(menu_options) menu_select = 0;
else menu_select++;
audio_play_sound(snd_down, 1, false);