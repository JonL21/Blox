/// @description Scale Up

size = min(size + logn(5, maxSize), maxSize);
if size == maxSize alarm[4] = 1;
else alarm[3] = 1;