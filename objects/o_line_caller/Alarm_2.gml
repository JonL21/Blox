/// @description Slow Fade

fade = max(fade - 0.001, 0);
if (fade == 0) alarm[0] = 1;
else alarm[2] = 1;