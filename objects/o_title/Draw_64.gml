/// @description  Draw menu options

draw_set_font(titleFont);
draw_set_halign(fa_center);
posy = y;
for (var i = 0; i < array_length_1d(menu_options); i++) {
    draw_text_transformed_colour(x + 2, posy + 2 - scales[i] * 32, string(menu_options[i]), scales[i], scales[i], 0, c_black, c_black, c_black, c_black, 0.5);
    draw_text_transformed(x + 2, posy - scales[i] * 32, string(menu_options[i]), scales[i], scales[i], 0);
    posy += 48;
}

for (var j = 0; j < array_length_1d(scales); j++) {
    if menu_select == j scales[j] = min(scales[j] + 0.1, 1);
    else scales[j] = max(scales[j] - 0.1, 0.5); 
}

