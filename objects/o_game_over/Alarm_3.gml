/// @description Fade out
if fade > 0 {
	fade -= 0.05;
	alarm[3] = 1;
}
else { 
	alarm[0] = 1;
}