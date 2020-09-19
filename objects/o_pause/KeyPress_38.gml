/// @description Go up one option

if menu_select - 1 < 0 menu_select = array_length_1d(menu_options) - 1;
else menu_select--;
if board_id.game_over && menu_select == 0 menu_select = array_length_1d(menu_options) - 1;
audio_play_sound(snd_up, 1, false);