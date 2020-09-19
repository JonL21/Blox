/// @description Fast Fade

fade = max(fade - 0.05, 0);
if (fade == 0) instance_destroy();
else alarm[1] = 1;