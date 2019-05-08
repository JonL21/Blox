/// @func UpdateLeaderboard(game_mode)
/// @desc Save Leaderboard in ini file
/// @arg {Integer} Game mode Enum
var _gm = ["Marathon","Ultra","Sprint"];
var _key = _gm[argument0];

ini_open("settings.ini");
var _scores = global.top_scores[argument0];
for (var i = 0; i < 10; i++) {
	ini_write_string(_key, i, _scores[i]);
}
ini_close();