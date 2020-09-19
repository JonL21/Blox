/// @func UpdateLeaderboard(game_mode)
/// @desc Save Leaderboard in ini file
/// @arg {Integer} Game mode Enum
function UpdateLeaderboard(game_mode) {
	var _gm = ["Marathon","Ultra","Sprint"];
	var _key = _gm[game_mode];

	ini_open("settings.ini");
	for (var i = 0; i < array_length_1d(global.top_scores[game_mode]); i++) {
		ini_write_string(_key, i, global.top_scores[game_mode][i]);
	}
	ini_close();
}

/// @func ResetLeaderboards()
/// @desc Reset all learboards 
function ResetLeaderboards() {
	var _abbr = ["MAR","ULT","SPR"];
	for (var i = 0; i < array_length_1d(_abbr); i++) {
		for (var j = 0; j < 10; j++) {
			global.top_scores[@ i][@ j] = _abbr[i] + " - 0";
		}
		UpdateLeaderboard(i);
	}
}

/// @func CheckFinalScore(scoretimer)
/// @desc Check if final score places in leaderboard
/// @arg {Integer} the score to compare against
function checkFinalScore(argument0) {
	var pos = -1;
	for (var i = 0; i < array_length_1d(global.top_scores[global.game_mode]); i++) {
		var	hiScore = string_delete(global.top_scores[global.game_mode][i], 1, 6);
		hiScore = real(hiScore);
		if hiScore == 0 { pos = i; break; }
		if global.game_mode == mode.sprint {
			if argument0 < hiScore { pos = i; break; }
		}
		else if argument0 > hiScore { pos = i; break; }
	}
	return pos;
}
