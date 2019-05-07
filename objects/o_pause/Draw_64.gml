/// @description Draw Text

// Draw Overlay
draw_set_halign(fa_center);
draw_set_alpha(0.85);
draw_rectangle_colour(0, 0, room_width, room_height, c_ltgray,c_ltgray,c_ltgray,c_ltgray, false);
draw_set_alpha(1);

// Draw Menu Options
var posy = y;
for (var i = 0; i < array_length_1d(menu_options); i++) {
	if i == 0 && global.game_over { posy += 64; continue; }
    draw_text_transformed_colour(x + 2, posy + 2 - scales[i] * 32, string(menu_options[i]), scales[i], scales[i], 0, c_black, c_black, c_black, c_black, 0.5);
    draw_text_transformed(x + 2, posy - scales[i] * 32, string(menu_options[i]), scales[i], scales[i], 0);
    posy += 64;
}

for (var j = 0; j < array_length_1d(scales); j++) {
    if menu_select == j scales[j] = min(scales[j] + 0.1, 1);
    else scales[j] = max(scales[j] - 0.1, 0.65); 
}

// Draw Heading
draw_set_font(scoreFont);
if global.game_over {
	draw_text_colour(x + 2, y - 126, "GAME OVER", c_black,c_black,c_black,c_black, 0.5);
	
	draw_text_colour(x + 2, y - 94, "Final Score: " + string(score), c_black,c_black,c_black,c_black, 0.5);
	draw_text(x + 2, y - 96, "Final Score: " + string(score));
	
	if global.game_clear {
		draw_text_colour(x + 2 , y - 128, "GAME OVER", c_aqua,c_aqua,c_aqua,c_aqua, 1);
		
		var seconds = (global.timer % 60) >= 10 ? string(global.timer % 60) : "0" + string(global.timer % 60);
		var minutes = floor(global.timer / 60) >= 10 ? string(floor(global.timer / 60)) : "0" + string(floor(global.timer / 60));
		if global.game_mode != mode.ultra {
			draw_text_colour(x + 2, y - 62, "Final Time: " + minutes + ":" + seconds, c_black,c_black,c_black,c_black, 0.5);
			draw_text(x + 2, y - 64, "Final Time: " + minutes + ":" + seconds);
		}
	}
	else draw_text_colour(x + 2 , y - 128, "GAME OVER", c_red,c_red,c_red,c_red, 1);
}
else {
	draw_text_colour(x + 2, y - 126, "PAUSED", c_black,c_black,c_black,c_black, 0.5);
	draw_text(x + 2, y - 128, "PAUSED");
}
draw_set_halign(fa_left);