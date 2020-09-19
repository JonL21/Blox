/// @description Update Leaderboard

var new_score = initials + " - " + string(global.game_mode == mode.sprint ? timer : points);

var new_scores = array_create(10, 0);

if ranking == 0 {
	new_scores[ranking] = new_score;
	array_copy(new_scores, ranking + 1, 
		global.top_scores[global.game_mode], ranking, 
		array_length_1d(global.top_scores[global.game_mode]) - 1);
}
else {
	array_copy(new_scores, 0, global.top_scores[global.game_mode], 0, ranking);
	new_scores[ranking] = new_score;
	array_copy(new_scores, ranking + 1, 
		global.top_scores[global.game_mode], ranking, 
		array_length_1d(global.top_scores[global.game_mode]) - ranking - 1);
}

global.top_scores[global.game_mode] = new_scores;
UpdateLeaderboard(global.game_mode);
alarm[2] = 1;