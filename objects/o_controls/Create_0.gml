/// @description Local Variables

x = room_width * 2;
y = room_height * 2;

// Available Options
menu_options[0] = "Move Left: " + KeyToString(global.C_left);
menu_options[1] = "Move Right: " + KeyToString(global.C_right);
menu_options[2] = "Soft Drop: " + KeyToString(global.C_soft_drop);
menu_options[3] = "Hard Drop: " + KeyToString(global.C_hard_drop);
menu_options[4] = "Hold: " + KeyToString(global.C_hold);
menu_options[5] = "Rotate Left: " + KeyToString(global.C_rotate_left);
menu_options[6] = "Rotate Right: " + KeyToString(global.C_rotate_right);
menu_options[7] = "Reset Key Binds to Default";
menu_options[8] = "Back";

// Menu Cursor and Scaling
menu_select = 0;
scales = array_create(array_length_1d(menu_options), 0.5);
scales[menu_select] = 1;