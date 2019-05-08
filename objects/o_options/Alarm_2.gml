/// @description Update Key Binds
ini_open("settings.ini");
ini_write_string("Preferences", "Left", global.C_left);
ini_write_string("Preferences", "Right", global.C_right);
ini_write_string("Preferences", "Soft_Drop", global.C_soft_drop);
ini_write_string("Preferences", "Hard_Drop", global.C_hard_drop);
ini_write_string("Preferences", "Hold", global.C_hold);
ini_write_string("Preferences", "CW", global.C_rotate_left);
ini_write_string("Preferences", "CCW", global.C_rotate_right);
ini_close();