/// @description  Draw menu options

draw_set_font(titleFont);
draw_set_halign(fa_center);

var yy = y - 196;
// Menu heading
draw_text_shadow(x + 2, yy - 128, "OPTIONS", c_black);

draw_set_halign(fa_left);
var posy = yy;
var posx = x - 400;
// Menu options
for (var i = 0; i < array_length_1d(menu_options); i++) {
	draw_text_trf_shadow(posx, posy, string(menu_options[i]), scales[i], c_black);
	if menu_select == i {
		draw_sprite_ext(spr_arrow, 0, 
			posx - 40, 
			posy - string_height(menu_options[i]) / 2 + 6, 
			1, 1, 0, c_black, 0.5);
		draw_sprite(spr_arrow, 0, 
			posx - 42,
			posy - string_height(menu_options[i]) / 2 + 6);
	}
    posy += string_height(string(menu_options[i]));
}

draw_set_halign(fa_right);
var posy = yy;
var posx = x + 400;
var ss = 0.65;
var i = 0;

// Changeable preferences
var f = global.shift_delay == 1 ? " Frame" : " Frames";
draw_text_trf_shadow(posx, posy, string(global.shift_delay) + f, scales[i] * ss, c_black);
if menu_select == i {
	if checkSD() != 0
		draw_text_trf_shadow(posx - (string_width("99" + f)) * scales[i] * ss - 8, posy, "+", scales[i] * ss, c_black);
	if checkSD() != 1
		draw_text_trf_shadow(posx + 24, posy, "-", scales[i], c_black);
}
posy += string_height(string(menu_options[i++]));

f = global.repeat_delay == 1 ? " Frame" : " Frames";
draw_text_trf_shadow(posx, posy, string(global.repeat_delay) + f, scales[i] * ss, c_black);
if menu_select == i {
	if checkRR() != 0
		draw_text_trf_shadow(posx - (string_width("99" + f)) * scales[i] * ss - 8, posy, "+", scales[i] * ss, c_black);
	if checkRR() != 1
		draw_text_trf_shadow(posx + 24, posy, "-", scales[i], c_black);
}
posy += string_height(string(menu_options[i++]));

draw_text_trf_shadow(posx, posy, string(global.drop_factor) + "x", scales[i] * ss, c_black);
if menu_select == i {
	if checkDF() != 0
		draw_text_trf_shadow(posx - (string_width("99x")) * scales[i] * ss - 8, posy, "+", scales[i] * ss, c_black);
	if checkDF() != 1	
		draw_text_trf_shadow(posx + 24, posy, "-", scales[i], c_black);
}
posy += string_height(string(menu_options[i++]));

draw_text_trf_shadow(posx, posy, global.particle_effects ? "True" : "False", scales[i] * ss, c_black);
posy += string_height(string(menu_options[i++]));

var str = ""; switch global.show_callouts {
	case callouts.none: str = "None"; break;
	case callouts.some: str = "Quadruples/T-Spins Only"; break;
	case callouts.every: str = "All"; break;
}
draw_text_trf_shadow(posx, posy, str, scales[i] * ss, c_black);

// Menu explanations
if global.show_options && !global.show_control_options {
	draw_set_halign(fa_center);
	draw_set_font(statFont);
	draw_text_shadow(x, room_height - 40, menu_explain[menu_select], c_black);
}