/// @description Update Key Binds in Ini
ini_open("settings.ini");
ini_write_string("Controls", "Left", global.C_left);
ini_write_string("Controls", "Right", global.C_right);
ini_write_string("Controls", "Soft_Drop", global.C_soft_drop);
ini_write_string("Controls", "Hard_Drop", global.C_hard_drop);
ini_write_string("Controls", "Hold", global.C_hold);
ini_write_string("Controls", "CCW", global.C_rotate_left);
ini_write_string("Controls", "CW", global.C_rotate_right);
ini_close();