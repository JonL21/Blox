/// @description  Go up one option

if !global.show_control_options exit;
if instance_exists(o_changeKeyBind) exit;
if menu_select - 1 < 0 menu_select = array_length_1d(menu_options) - 1;
else menu_select--;
audio_play_sound(snd_up, 1, false);