/// @func CalculateSpeed()
/// @desc Calculates how many rows to move down

/* Gravity
	This arbitrary formula
			          60
		--------------------------- - 12.85
		0.25 (level - 1.661) + 0.99
	ensures there is a steady difficulty increase.
	
	Level 1		-	1 row per ~60 frames (or move 1 row per second)
	Level 5		-	1 row per ~20 frames
	Level 10	-	1 row per ~6.66 frames
	Level 15+	-	1 row per ~1 frame (or move 60 rows per second)
	
	No support for >1 row per frame (yet)
*/

var num = game_get_speed(gamespeed_fps)

var a = 0.25;
var b = -1.661;
var c = 0.99;
var d = -12.85;

var dem = a * (global.level + b) + c;

var result = num / dem + d;
return result > 1 ? result : 1;