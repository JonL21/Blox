/// @description Pop Out
if size < maxSize {
	size += size * 0.35;
	fadebg = min(fadebg + 0.1, 0.85);
	alarm[1] = 1;
}
else alarm[2] = 1;