/// @func FormatTime(number)
/// @desc Format a number to XX:XX format
/// @arg {Integer} number the number to format

var milli = frac(argument0) > 0 ? string_copy(string(frac(argument0)), 2, 3) : ".00";
var seconds = argument0 % 60 >= 10 ? string(floor(argument0 % 60)) : "0" + string(floor(argument0 % 60));
var minutes = floor(argument0 / 60) >= 10 ? string(floor(argument0 / 60)) : "0" + string(floor(argument0 / 60));
return minutes + ":" + seconds + milli;