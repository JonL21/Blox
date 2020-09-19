/// @description Ease offsets after hitting wall

if offx != 0 {
	offx = mean(offx, 0);
	alarm[9] = 1;
}