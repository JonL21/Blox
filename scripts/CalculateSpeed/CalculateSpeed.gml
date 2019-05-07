// Arbritary formula for determining how many units a block traverses per game speed

var num = game_get_speed(gamespeed_fps)

var a = 1/4;
var b = -1.661;
var c = 0.99;
var d = -12.85;

var dem = a * (global.level + b) + c;

var result = num / dem + d;
return result > 1 ? result : 1; // No support for >1 unit per frame (yet)