/// @description Draw FPS

draw_set_halign(fa_left);
draw_set_font(tinyFont);
//draw_text(2, 2, fps_real);
draw_text(2, 2, game_get_speed(gamespeed_fps));