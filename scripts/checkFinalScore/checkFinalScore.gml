/// @func CheckFinalScore(number)
/// @desc Check if final score places in leaderboard
/// @arg {Integer} the score to compare against

var temp = array_create(10, 0); array_copy(temp, 0, global.top_scores[global.game_mode], 0, 10);
var pos = -1;
for (var i = 0; i < array_length_1d(temp); i++) {
	var	hiScore = string_delete(temp[i], 1, 6);
	hiScore = real(hiScore);
	if hiScore == 0 { pos = i; break; }
	if global.game_mode == mode.sprint {
		if argument0 < hiScore { pos = i; break; }
	}
	else if argument0 > hiScore { pos = i; break; }
}
return pos;