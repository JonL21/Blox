/// @description Previous Character
if initial_pos[pos] - 1 < 1 initial_pos[pos] = string_length(chars);
else initial_pos[pos]--;
audio_play_sound(snd_up, 1, false);