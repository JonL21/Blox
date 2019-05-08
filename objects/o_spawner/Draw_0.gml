/// @description  Draw held block, next blocks, score

// Top Off Line
draw_rectangle_color(global.border[0], global.border[3], global.border[1] - 2, global.border[3] + 2, c_red, c_red, c_red, c_red, false);

draw_set_halign(fa_left);

// Draw Score
draw_set_font(scoreFont);
var _y = scoreBasePos[1];
draw_text(scoreBasePos[0], _y, string("Score: " + string(global.points)));
_y += 40;

// Draw Timer
draw_text(scoreBasePos[0], _y, "Time: " + FormatTime(global.timer));
_y += 40;

// Draw Level
if global.game_mode != mode.sprint
	draw_text(scoreBasePos[0], _y, string("Level: " + string(global.level)));
else
	draw_text(scoreBasePos[0], _y, string("Lines: " + string(max((40 - global.stats[? "Total Lines Cleared"]), 0))));
_y += 48;

// Draw Stats
draw_set_font(deFont);
for (var i = 0; i < array_length_1d(global.strstats); i++) {
	var str = global.strstats[i] + ": " + string(global.stats[? global.strstats[i]]);
	draw_text(scoreBasePos[0], _y, str);
	_y += string_height(str);
}

// Draw Held Block
draw_set_font(scoreFont);
draw_set_halign(fa_center);
draw_text(global.border[0] - 64, global.border[3] - 32, "HOLD");
if global.held_block != -1 {
    if global.hold_available draw_sprite_ext(global.held_block, 0, global.border[0] - 64, global.border[3] + 64, 0.9, 0.9, 0, c_white, 1);
	else draw_sprite_ext(global.held_block, 0, global.border[0] - 64, global.border[3] + 64, 0.9, 0.9, 0, c_gray, 1);
}

// Draw Next Blocks
draw_text(global.border[1] + 64, global.border[3] - 32, "NEXT");
var posx = global.border[1] + 64;
var posy = global.border[3] + 64;
for (var i = 0; i < 6; i++) {
    var block = global.bag[| i];
	if is_undefined(block) break;
    draw_sprite_ext(block, 0, posx, posy, 0.9, 0.9, 0, c_white, 1);
    posy += 32 * 3;
}