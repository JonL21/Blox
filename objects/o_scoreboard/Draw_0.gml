/// @description Draw Scores

draw_set_alpha(0.95);
draw_roundrect_color(x - 166, y - 16, x + 166, y + 386, c_dkgray, c_dkgray, false);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_font(scoreFont);

var str = "Leaderboard";
var md = "";
switch game_mode {
	case mode.marathon: md += "Marathon"; break;
	case mode.ultra: md += "Ultra"; break;
	case mode.sprint: md += "Sprint"; break;
}
draw_text_transformed(x, y - 8, str + " - " + md, 0.85, 0.85, 0);

draw_set_halign(fa_left);
draw_set_font(statFont);
draw_text(x - 150, y + 28, "#");
draw_set_halign(fa_center);
draw_text(x - 40, y + 28, "INITIALS");
draw_set_halign(fa_right);
draw_text(x + 150, y + 28, game_mode == mode.sprint ? "TIME" : "SCORE");

draw_set_font(scoreFont);
var _x = x - 150;
var _y = y + 48;
for (var i = 0; i < array_length_1d(global.top_scores[game_mode]); i++) {
	draw_set_halign(fa_left);
	var str = string(i + 1);
	draw_text(_x, _y, str);
	
	draw_set_halign(fa_center);
	var initial = string_copy(global.top_scores[game_mode][i], 1, 3);
	draw_text(x - 40, _y, initial);
	
	draw_set_halign(fa_right);
	var str2 = string_delete(global.top_scores[game_mode][i], 1, 6);
	var points = game_mode == mode.sprint ? FormatTime(real(str2)) : FormatNum(str2);
	draw_text(x + abs(_x - x), _y, points);
	_y += 32;
}