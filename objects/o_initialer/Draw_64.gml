/// @description

// Draw Overlay
draw_set_alpha(0.85);
draw_rectangle_colour(0, 0, room_width, room_height, c_ltgray,c_ltgray,c_ltgray,c_ltgray, false);
draw_set_alpha(1);

draw_set_halign(fa_center);

draw_set_font(titleFont);
draw_text_colour(x, y - 134,"New High Score!\nSet Initials", c_black, c_black, c_black, c_black, 0.5);
draw_text(x, y - 136, "New High Score!\nSet Initials");

draw_rectangle_color(x - 136, y - 8, x + 136, y + 104, col,col,col,col, col == c_white ? true : false);

draw_set_font(headsUpFont);
draw_text_colour(x - 96, y + 2, string_char_at(chars, initial_pos[0]), c_black, c_black, c_black, c_black, 0.5);
draw_text(x - 96, y, string_char_at(chars, initial_pos[0]));
draw_text_colour(x, y + 2, string_char_at(chars, initial_pos[1]), c_black, c_black, c_black, c_black, 0.5);
draw_text(x, y, string_char_at(chars, initial_pos[1]));
draw_text_colour(x + 96, y + 2, string_char_at(chars, initial_pos[2]), c_black, c_black, c_black, c_black, 0.5);
draw_text(x + 96, y, string_char_at(chars, initial_pos[2]));

var up_arr = c_white;
var dw_arr = c_white;
if keyboard_check(vk_up)
	up_arr = c_dkgray;
else if keyboard_check(vk_down)
	dw_arr = c_dkgray;

if col == c_white {
	switch pos {
		case 0:
			draw_sprite_ext(spr_arrow, 0, x - 112, y, 1, 1, 90, up_arr, 1);
			draw_sprite_ext(spr_arrow, 0, x - 80, y + 96, 1, 1, -90, dw_arr, 1);
			break;
		case 1:
			draw_sprite_ext(spr_arrow, 0, x - 16, y, 1, 1, 90, up_arr, 1);
			draw_sprite_ext(spr_arrow, 0, x + 16, y + 96, 1, 1, -90, dw_arr, 1);
			break;
		case 2:
			draw_sprite_ext(spr_arrow, 0, x + 80, y, 1, 1, 90, up_arr, 1);
			draw_sprite_ext(spr_arrow, 0, x + 112, y + 96, 1, 1, -90, dw_arr, 1);
			break;
	}
}