/// @description 

draw_set_alpha(fadebg);
draw_rectangle_colour(0, 0, room_width, room_height, c_ltgray,c_ltgray,c_ltgray,c_ltgray, false);
draw_set_alpha(1);

draw_set_font(headsUpFont);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed_colour(x, y + 2, "GAME OVER!", size, size, 0, c_black,c_black,c_black,c_black, fade - 0.5);
draw_text_transformed_colour(x, y, "GAME OVER!", size, size, 0, c_white,c_white,c_white,c_white, fade);

draw_set_valign(fa_top);