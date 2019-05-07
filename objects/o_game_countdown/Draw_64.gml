/// @description Draw text

draw_set_font(headsUpFont);
draw_set_halign(fa_center);
draw_text_colour(x + 2, y + 2, text, c_black,c_black,c_black,c_black, 1);
draw_text(x + 2, y , text);