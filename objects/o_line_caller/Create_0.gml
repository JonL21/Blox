/// @description Wait until delay

/*
	A Line Caller displays to the player what type of line clear they just performed.
	Some instance variables must be determined by the instance creator:
	- callout: the String to display
	- fadeDelay: how many seconds to wait before text fades out (default is 3)
	- fadeType: either 1 for fast or 2 for slow
	- x, y
*/

fadeDelay *= room_speed;
alarm[3] = 1;
alarm_set(fadeType, fadeDelay);