/// @description Scale Up

size = min(size + 0.015, maxSize);
if size == maxSize alarm[4] = 1;
else alarm[3] = 1;