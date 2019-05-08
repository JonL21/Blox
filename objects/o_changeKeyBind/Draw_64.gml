/// @description 

// Draw Overlay
draw_set_alpha(0.95);
draw_rectangle_colour(0, 0, room_width, room_height, c_dkgray,c_dkgray,c_dkgray,c_dkgray, false);
draw_set_alpha(1);

draw_set_halign(fa_center);

draw_set_font(titleFont);
var kb = ["Move Left", "Move Right", "Soft Drop", "Hard Drop", "Hold", "Rotate Left", "Rotate Right"];
draw_text_colour(x + 2, y - 126, "Change Key Bind: " + kb[target_keybind], c_black, c_black, c_black, c_black, 0.5);
draw_text(x + 2, y - 128, "Change Key Bind: " + kb[target_keybind]);

draw_set_font(scoreFont);
draw_text_colour(x + 2, y - 30, "Press any key to set this keybind to it. Press ESCAPE to cancel.", c_black, c_black, c_black, c_black, 0.5);
draw_text(x + 2, y - 32, "Press any key to set this keybind to it. Press ESCAPE to cancel.");