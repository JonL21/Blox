/// @description  Draw menu options

draw_set_font(titleFont);
draw_set_halign(fa_center);

var yy = y - 128;
// Submenu heading
draw_text_shadow(x + 2, yy - 128, "Edit Controls", c_black);

var posy = yy;
// Menu options
for (var i = 0; i < array_length_1d(menu_options); i++) {
    draw_text_trf_shadow(x + 2, posy, string(menu_options[i]), scales[i], c_black);
	if menu_select == i {
		draw_sprite_ext(spr_arrow, 0, 
			x - string_width(menu_options[i]) / 2 - 40, 
			posy - string_height(menu_options[i]) / 2 + 6, 
			1, 1, 0, c_black, 0.5);
		draw_sprite(spr_arrow, 0, 
			x - string_width(menu_options[i]) / 2 - 42,
			posy - string_height(menu_options[i]) / 2 + 6);
	}
	posy += 48;
}

// Disclaimer
if global.show_options && global.show_control_options {
	draw_set_halign(fa_center);
	draw_set_font(statFont);
	draw_text_shadow(x, room_height - 40, "(Changes do not affect menu controls)", c_black);
}