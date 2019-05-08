/// @description  Draw menu options

draw_set_font(titleFont);
draw_set_halign(fa_center);

draw_text_colour(x + 2, y - 126, "OPTIONS", c_black, c_black, c_black, c_black, 0.5);
draw_text(x + 2, y - 128, "OPTIONS");

var posy = y;
for (var i = 0; i < array_length_1d(menu_options); i++) {
    draw_text_transformed_colour(x + 2, posy + 2 - scales[i] * 32, string(menu_options[i]), scales[i], scales[i], 0, c_black, c_black, c_black, c_black, 0.5);
    draw_text_transformed(x + 2, posy - scales[i] * 32, string(menu_options[i]), scales[i], scales[i], 0);
    posy += 48;
}

draw_sprite_ext(spr_arrow, 0, x - string_width(menu_options[menu_select]) / 2 - 48, y + 48 * menu_select - string_height(menu_options[menu_select]) / 2 + 10, 1, 1, 0, c_black, 0.5);
draw_sprite(spr_arrow, 0, x - string_width(menu_options[menu_select]) / 2 - 48, y + 48 * menu_select - string_height(menu_options[menu_select]) / 2 + 8);

for (var j = 0; j < array_length_1d(scales); j++) {
    if menu_select == j scales[j] = min(scales[j] + 0.1, 1);
    else scales[j] = max(scales[j] - 0.1, 0.65); 
}

draw_set_font(deFont);
draw_text_colour(x + 2, room_height - 30, "MENU CONTROLS: Move Up - UP ARROW KEY, Move Down - DOWN ARROW KEY, Select - ENTER, Back to Main Menu - ESCAPE", c_black, c_black, c_black, c_black, 0.5);
draw_text(x + 2, room_height - 32, "MENU CONTROLS: Move Up - UP ARROW KEY, Move Down - DOWN ARROW KEY, Select - ENTER, Back to Main Menu - ESCAPE");