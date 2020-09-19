/// @description Reset rainbow shader

if _mix > 0.0 {
	_mix -= 0.01;
	alarm[1] = 1;
}
else all_clear = false;