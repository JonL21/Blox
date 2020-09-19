/// @description 

draw_set_halign(fa_right);
draw_set_font(tinyFont);

draw_roundrect(room_width - 64, room_height - 64, room_width - 32, room_height - 32, true);
draw_text(room_width - 40, room_height - 40, KeyToString(global.C_soft_drop));