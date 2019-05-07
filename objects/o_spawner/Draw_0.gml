/// @description  Draw held block, next blocks, score

// Top Off Line
draw_rectangle_color(global.border[0], global.border[3], global.border[1] - 2, global.border[3] + 2, c_red, c_red, c_red, c_red, false);

draw_set_halign(fa_left);

// Draw Score
draw_set_font(scoreFont);
var _y = scoreBasePos[1];
draw_text(scoreBasePos[0], _y, string("Score: " + string(score)));
_y += 40;

// Draw Timer
var seconds = (global.timer % 60) >= 10 ? string(global.timer % 60) : "0" + string(global.timer % 60);
var minutes = floor(global.timer / 60) >= 10 ? string(floor(global.timer / 60)) : "0" + string(floor(global.timer / 60));
draw_text(scoreBasePos[0], _y, "Time: " + minutes + ":" + seconds);
_y += 40;

// Draw Level
if global.game_mode != mode.sprint
	draw_text(scoreBasePos[0], _y, string("Level: " + string(global.level)));
else
	draw_text(scoreBasePos[0], _y, string("Lines: " + string(abs(40 - global.stats[? "Total Lines Cleared"]))));
_y += 48;

// Draw Stats
draw_set_font(deFont);
for (var i = 0; i < array_length_1d(global.strstats); i++) {
	var str = global.strstats[i] + ": " + string(global.stats[? global.strstats[i]]);
	draw_text(scoreBasePos[0], _y, str);
	_y += string_height(str);
}

// Draw Held Block
draw_set_halign(fa_center);
if global.held_block != -1 {
    if global.hold_available draw_sprite_ext(global.held_block, 0, x - 32 * 2 - 32 * global.width / 2, 32 * 4, 0.9, 0.9, 0, c_white, 1);
	else draw_sprite_ext(global.held_block, 0, x - 32 * 2 - 32 * global.width / 2, 32 * 4, 0.9, 0.9, 0, c_gray, 1);
}

// Draw Next Blocks
var posx = x + 32 * 2 + 32 * global.width / 2;
var posy = y + 32 * 4;

for (var i = 0; i < 6; i++) {
    var block = ds_list_find_value(global.bag, i);
	if is_undefined(block) break;
    draw_sprite_ext(block, 0, posx, posy, 0.9, 0.9, 0, c_white, 1);
    posy += 32 * 3;
}