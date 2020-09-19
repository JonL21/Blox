/// @description Draw menu options

draw_set_font(headsUpFont);
draw_set_halign(fa_center);

// Title
draw_text_shadow(x + 2, y - 196, "BLOX", c_black);

draw_set_font(titleFont);
var posy = y - 48;

// Menu Options
for (var i = 0; i < array_length_1d(menu_options); i++) {
	if menu_select == 0 && i == 0 && keyboard_check(vk_shift)
		draw_text_trf_shadow(x - 30, posy - 22, "ENDLESS", 0.37, c_black);
	draw_text_trf_shadow(x + 2, posy, string(menu_options[i]), scales[i], c_black);
	
	// Menu Cursor
	if menu_select == i {
		draw_sprite_ext(spr_arrow, 0, x - string_width(menu_options[menu_select]) / 2 - 46, posy - sprite_get_height(spr_arrow) + 12, 1, 1, 0, c_black, 0.5);
		draw_sprite(spr_arrow, 0, x - string_width(menu_options[menu_select]) / 2 - 48, posy - sprite_get_height(spr_arrow) + 10);
	}
	
    posy += string_height(menu_options[i]) / 1.25;
}


// Menu Explanations
if !global.show_options && !global.show_control_options {
	draw_set_halign(fa_center);
	draw_set_font(statFont);
	draw_text_shadow(x, room_height - 40, menu_explain[menu_select], c_black);
}