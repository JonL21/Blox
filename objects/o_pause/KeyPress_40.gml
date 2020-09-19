/// @description Go down one option

if menu_select + 1 == array_length_1d(menu_options) menu_select = 0;
else menu_select++;
if board_id.game_over && menu_select == 0 menu_select++;
audio_play_sound(snd_down, 1, false);