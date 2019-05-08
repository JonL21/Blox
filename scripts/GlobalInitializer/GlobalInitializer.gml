/// @func GlobalInitializer()
/// @desc Read settings, scores from ini

ini_open("settings.ini");
global.C_left = ini_read_string("Preferences", "Left", DEFAULT_LEFT);
global.C_right = ini_read_string("Preferences", "Right", DEFAULT_RIGHT);
global.C_soft_drop = ini_read_string("Preferences", "Soft_Drop", DEFAULT_SOFT_DROP);
global.C_hard_drop = ini_read_string("Preferences", "Hard_Drop", DEFAULT_HARD_DROP);
global.C_hold = ini_read_string("Preferences", "Hold", DEFAULT_HOLD);
global.C_rotate_left = ini_read_string("Preferences", "CW", DEFAULT_ROTATE_LEFT);
global.C_rotate_right = ini_read_string("Preferences", "CCW", DEFAULT_ROTATE_RIGHT);

var temp = array_create(10, 0);
for (var i = 0; i < 10; i++) {
	temp[i] = ini_read_string("Marathon", i, "MAR - 0");
}
global.top_scores[0] = temp;
var temp = array_create(10, 0);
for (var i = 0; i < 10; i++) {
	temp[i] = ini_read_string("Ultra", i, "ULT - 0");
}
global.top_scores[1] = temp;
var temp = array_create(10, 0);
for (var i = 0; i < 10; i++) {
	temp[i] = ini_read_string("Sprint", i, "SPR - 0");
}
global.top_scores[2] = temp;
ini_close();