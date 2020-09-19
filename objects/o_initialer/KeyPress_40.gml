/// @description Next Character
if initial_pos[pos] + 1 > string_length(chars) initial_pos[pos] = 1;
else initial_pos[pos]++;
audio_play_sound(snd_down, 1, false);