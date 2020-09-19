/// @description Form Initials

var str = 
	string_char_at(chars, initial_pos[0]) +
	string_char_at(chars, initial_pos[1]) +
	string_char_at(chars, initial_pos[2]);
col = make_color_rgb(50,205,50);
board_id.initials = str;
alarm[0] = 30;
audio_play_sound(snd_confirm, 1, false);