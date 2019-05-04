/// @description Scale Up

size = min(size + logn(25000, maxSize), maxSize);
if size == maxSize alarm[4] = 1;
else alarm[3] = 1;