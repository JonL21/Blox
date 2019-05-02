/// @description Fast Fade

fade = max(fade - 0.025, 0);
if (fade == 0) alarm[0] = 1;
else alarm[1] = 1;