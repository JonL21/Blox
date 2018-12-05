/// @description Draw words
// You can write your code in this editor

draw_set_alpha(0.85);
draw_rectangle_colour(0, 0, room_width, room_height, c_ltgray,c_ltgray,c_ltgray,c_ltgray, false);
draw_set_alpha(1);

// RESUME
//if (!global.game_over) {
    if (menu_select == 0) scales[0] = min(scales[0] + 0.1, 1);
    else scales[0] = max(scales[0] - 0.1, 0.5);
    draw_text_transformed_colour(x + 2, y + 2 - (scales[0] * 16), "RESUME", scales[0], scales[0], 0, c_black,c_black,c_black,c_black, 0.5);
    draw_text_transformed(x, y - (scales[0] * 16), "RESUME", scales[0], scales[0], 0);
//}

// RESTART
if (menu_select == 1) scales[1] = min(scales[1] + 0.1, 1);
else scales[1] = max(scales[1] - 0.1, 0.5);
draw_text_transformed_colour(x + 2, y + 66 - (scales[1] * 16), "RESTART", scales[1], scales[1], 0, c_black,c_black,c_black,c_black, 0.5);
draw_text_transformed(x, y + 64 - (scales[1] * 16), "RESTART", scales[1], scales[1], 0);

// EXIT
if (menu_select == 2) scales[2] = min(scales[2] + 0.1, 1);
else scales[2] = max(scales[2] - 0.1, 0.5);
draw_text_transformed_colour(x + 2, y + 130 - (scales[2] * 16), "MAIN MENU", scales[2], scales[2], 0, c_black,c_black,c_black,c_black, 0.5);
draw_text_transformed(x, y + 128 - (scales[2] * 16), "MAIN MENU", scales[2], scales[2], 0);

draw_set_font(scoreFont);

draw_text_colour(x + 2, y - 126, "PAUSED", c_black,c_black,c_black,c_black, 0.5);
draw_text(x, y - 128, "PAUSED");