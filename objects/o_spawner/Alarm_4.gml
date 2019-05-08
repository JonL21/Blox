/// @description Update Leaderboard

var new_score = initials + " - " + string(global.game_mode == mode.sprint ? global.timer : global.points);

var new_scores = array_create(10, 0); array_copy(new_scores, 0, global.top_scores[global.game_mode], 0, ranking);
new_scores[ranking] = new_score;
array_copy(new_scores, ranking + 1, global.top_scores[global.game_mode], ranking, 10 - ranking);

global.top_scores[global.game_mode] = new_scores;
UpdateLeaderboard(global.game_mode);
alarm[2] = 1;