/// @description Draw Text

draw_set_halign(fa_center);
draw_set_font(scoreFont);

// Draw Menu Options
var posy = y;
for (var i = 0; i < array_length_1d(menu_options); i++) {
	if i == 0 && board_id.game_over { posy += 64; continue; }
    draw_text_trf_shadow(x + 2, posy, string(menu_options[i]), scales[i], c_black);
	posy += 64;
}

for (var j = 0; j < array_length_1d(scales); j++) {
    if menu_select == j scales[j] = min(scales[j] + 0.1, 1);
    else scales[j] = max(scales[j] - 0.1, 0.65); 
}

// Draw Heading
draw_set_font(titleFont);
if board_id.game_over {
	draw_text_shadow(x + 2, y - 280, "Final Score:\n" + FormatNum(board_id.points), c_black);
	if board_id.game_clear {
		if global.game_mode != mode.ultra {
			draw_text_shadow(x + 2, y - 152, "Final Time:\n" + FormatTime(board_id.timer), c_black);
		}
	}
}
else {
	draw_text_shadow(x + 2, y - 128, "PAUSED", c_black);
}


// Draw Stats
//draw_set_font(smallFont);
//_y = y - string_height("ABC") * (array_length_1d(ss) / 2);

//draw_set_font(scoreFont);
//draw_set_halign(fa_center);
//_y -= string_height("Statistics");
//draw_text_shadow(x - 456 + string_width("ABC") * 1.5, _y, "Statistics", c_black);
//_y += string_height("Statistics") * 1.5;

//draw_set_halign(fa_left);
//draw_set_font(smallFont);
//for (var i = 0; i < array_length_1d(ss); i++) {
//	var str = ss[i] + ": " + string(s[? ss[i]]);
//	draw_text_shadow(x - 456, _y, str, c_black);
//	_y += string_height(str);
//}