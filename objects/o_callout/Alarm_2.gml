/// @description Slow Fade

fade = max(fade - 0.035, 0);
if (fade == 0) instance_destroy();
else alarm[2] = 1;